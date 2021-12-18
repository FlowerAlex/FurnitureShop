import 'dart:io';
import 'package:bloc_test/bloc_test.dart';
import 'package:cqrs/cqrs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';
import 'package:furniture_shop/features/login_screen/login_screen_cubit.dart';
import 'package:login_client/login_client.dart';
import 'package:mocktail/mocktail.dart';

class MockCQRS extends Mock implements CQRS {}

class MockAuthCubit extends Mock implements AuthCubit {}

void main() {
  group(
    'LogInScreenCubit',
    () {
      late MockAuthCubit authCubit;

      setUpAll(() {
        registerFallbackValue(const ResourceOwnerPasswordStrategy('', ''));
      });

      setUp(() {
        authCubit = MockAuthCubit();
      });

      LogInScreenCubit buildCubit() => LogInScreenCubit(
            authCubit: authCubit,
          );

      blocTest<LogInScreenCubit, LogInScreenState>(
        'has LogInScreenReadyState ready state',
        build: buildCubit,
        verify: (cubit) => expect(cubit.state, const LogInScreenReadyState()),
      );

      blocTest<LogInScreenCubit, LogInScreenState>(
        'has LogInScreenReadyState and logIn is called successful',
        build: () {
          when(() => authCubit.logIn(any()))
              .thenAnswer((invocation) => () async {}());
          return buildCubit();
        },
        act: (cubit) => cubit.logIn('', ''),
        verify: (cubit) => expect(cubit.state, const LogInScreenReadyState()),
      );

      blocTest<LogInScreenCubit, LogInScreenState>(
        'has LogInScreenReadyState and logIn is called without internet',
        build: () {
          when(() => authCubit.logIn(any()))
              .thenThrow(const SocketException('Network exception'));
          return buildCubit();
        },
        act: (cubit) => cubit.logIn('', ''),
        verify: (cubit) => expect(
            cubit.state, const LogInScreenReadyState(networkError: true)),
      );

      blocTest<LogInScreenCubit, LogInScreenState>(
        'has LogInScreenReadyState and logIn is called and user has invalid credentials',
        build: () {
          when(() => authCubit.logIn(any()))
              .thenThrow(AuthorizationException('', null, null));
          return buildCubit();
        },
        act: (cubit) => cubit.logIn('', ''),
        verify: (cubit) => expect(
            cubit.state, const LogInScreenReadyState(invalidCredentials: true)),
      );

      blocTest<LogInScreenCubit, LogInScreenState>(
        'has LogInScreenReadyState and logIn is called with unknown error',
        build: () {
          when(() => authCubit.logIn(any())).thenThrow(Exception());
          return buildCubit();
        },
        act: (cubit) => cubit.logIn('', ''),
        verify: (cubit) => expect(
            cubit.state, const LogInScreenReadyState(unknownError: true)),
      );
    },
  );
}
