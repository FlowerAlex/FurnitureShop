import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:cqrs/contracts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/sign_up_screen.dart/sign_up_screen_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../register_fallback_values.dart';

void main() {
  group(
    'SignUpScreenCubit',
    () {
      late MockCQRS cqrs;
      late MockAuthCubit authCubit;

      setUpAll(registerFallbackValues);

      setUp(() {
        cqrs = MockCQRS();
        authCubit = MockAuthCubit();
      });

      SignUpScreenCubit buildCubit() => SignUpScreenCubit(
            cqrs: cqrs,
            authCubit: authCubit,
          );

      blocTest<SignUpScreenCubit, SignUpScreenState>(
        'has SignUpScreenReadyState ready state',
        build: buildCubit,
        verify: (cubit) => expect(cubit.state, const SignUpScreenReadyState()),
      );

      blocTest<SignUpScreenCubit, SignUpScreenState>(
        'has SignUpScreenReadyState and registerUser is called and registered successful',
        build: () {
          when(() => cqrs.run(any<IRemoteCommand>(that: isA<RegisterUser>())))
              .thenAnswer((_) async => const CommandResult([]));
          when(() => authCubit.logIn(any()))
              .thenAnswer((invocation) => () async {}());
          return buildCubit();
        },
        act: (cubit) => cubit.registerUser('', ''),
        verify: (cubit) => expect(cubit.state, const SignUpScreenReadyState()),
      );

      blocTest<SignUpScreenCubit, SignUpScreenState>(
        'has SignUpScreenReadyState and registerUser is called without internet',
        build: () {
          when(() => cqrs.run(any<IRemoteCommand>(that: isA<RegisterUser>())))
              .thenThrow(const SocketException('Network exception'));
          when(() => authCubit.logIn(any()))
              .thenAnswer((invocation) => () async {}());
          return buildCubit();
        },
        act: (cubit) => cubit.registerUser('', ''),
        verify: (cubit) => expect(
            cubit.state, const SignUpScreenReadyState(networkError: true)),
      );

      blocTest<SignUpScreenCubit, SignUpScreenState>(
        'has SignUpScreenReadyState and registerUser is called with unknown error',
        build: () {
          when(() => cqrs.run(any<IRemoteCommand>(that: isA<RegisterUser>())))
              .thenThrow(Exception());
          when(() => authCubit.logIn(any()))
              .thenAnswer((invocation) => () async {}());
          return buildCubit();
        },
        act: (cubit) => cubit.registerUser('', ''),
        verify: (cubit) => expect(
            cubit.state, const SignUpScreenReadyState(unknownError: true)),
      );
    },
  );
}
