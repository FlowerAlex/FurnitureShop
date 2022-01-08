import 'package:bloc_test/bloc_test.dart';
import 'package:cqrs/contracts.dart';
import 'package:cqrs/cqrs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furniture_shop/profile_screen/profile_screen_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:furniture_shop/data/contracts.dart';

import '../test_data.dart';

class MockCQRS extends Mock implements CQRS {}

void main() {
  group(
    'ProfileScreenCubit',
    () {
      late MockCQRS cqrs;

      setUpAll(() {
        registerFallbackValue(UserInfo());
        registerFallbackValue(UpdateProfile());
      });

      setUp(() {
        cqrs = MockCQRS();
      });

      ProfileScreenCubit buildCubit() => ProfileScreenCubit(
            cqrs: cqrs,
          );

      blocTest<ProfileScreenCubit, ProfileScreenState>(
        'emit initial ProfileScreenState on the start',
        build: buildCubit,
        verify: (cubit) =>
            expect(cubit.state, const ProfileScreenInitialState()),
      );

      blocTest<ProfileScreenCubit, ProfileScreenState>(
        'run fetch successfully',
        build: () {
          when(() => cqrs.get<UserInfoDTO>(any(that: isA<UserInfo>())))
              .thenAnswer((_) async => userInfoTest);

          return buildCubit();
        },
        act: (cubit) => cubit.fetch(),
        expect: () => [
          const ProfileScreenLoadingState(),
          ProfileScreenSuccessState(userInfo: userInfoTest),
        ],
      );

      blocTest<ProfileScreenCubit, ProfileScreenState>(
        'run fetch unsuccessfully',
        build: () {
          when(() => cqrs.get<UserInfoDTO>(any(that: isA<UserInfo>())))
              .thenThrow(Exception());

          return buildCubit();
        },
        act: (cubit) => cubit.fetch(),
        expect: () => [
          const ProfileScreenLoadingState(),
          const ProfileScreenErrorState(),
        ],
      );

      blocTest<ProfileScreenCubit, ProfileScreenState>(
        'run fetch successfully twise',
        build: () {
          when(() => cqrs.get<UserInfoDTO>(any(that: isA<UserInfo>())))
              .thenAnswer((_) async => userInfoTest);
          return buildCubit();
        },
        act: (cubit) async {
          await cubit.fetch();
          await cubit.fetch();
        },
        expect: () => [
          const ProfileScreenLoadingState(),
          ProfileScreenSuccessState(userInfo: userInfoTest),
          ProfileScreenLoadingState(userInfo: userInfoTest),
          ProfileScreenSuccessState(userInfo: userInfoTest),
        ],
      );

      blocTest<ProfileScreenCubit, ProfileScreenState>(
        'run updateProfile successfully',
        build: () {
          when(() => cqrs.run(any<IRemoteCommand>(that: isA<UpdateProfile>())))
              .thenAnswer((_) async => const CommandResult([]));
          when(() => cqrs.get<UserInfoDTO>(any(that: isA<UserInfo>())))
              .thenAnswer((_) async => userInfoTest);
          return buildCubit();
        },
        act: (cubit) async {
          await cubit.updateProfile();
        },
        expect: () => [
          const ProfileScreenLoadingState(),
          ProfileScreenSuccessState(userInfo: userInfoTest),
        ],
      );

      blocTest<ProfileScreenCubit, ProfileScreenState>(
        'run updateProfile unsuccessfully',
        build: () {
          when(() => cqrs.run(any<IRemoteCommand>(that: isA<UpdateProfile>())))
              .thenThrow(Exception());
          when(() => cqrs.get<UserInfoDTO>(any(that: isA<UserInfo>())))
              .thenAnswer((_) async => userInfoTest);
          return buildCubit();
        },
        act: (cubit) async {
          await cubit.updateProfile();
        },
        expect: () => [
          const ProfileScreenLoadingState(),
          const ProfileScreenErrorState(),
        ],
      );

      blocTest<ProfileScreenCubit, ProfileScreenState>(
        'run updateProfile successfully twise',
        build: () {
          when(() => cqrs.get<UserInfoDTO>(any(that: isA<UserInfo>())))
              .thenAnswer((_) async => userInfoTest);
          when(() => cqrs.run(any<IRemoteCommand>(that: isA<UpdateProfile>())))
              .thenAnswer((_) async => const CommandResult([]));

          return buildCubit();
        },
        act: (cubit) async {
          await cubit.updateProfile();
          await cubit.updateProfile();
        },
        expect: () => [
          const ProfileScreenLoadingState(userInfo: null),
          ProfileScreenSuccessState(userInfo: userInfoTest),
          ProfileScreenLoadingState(userInfo: userInfoTest),
          ProfileScreenSuccessState(userInfo: userInfoTest),
        ],
      );
    },
  );
}
