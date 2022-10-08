import 'package:bloc_test/bloc_test.dart';
import 'package:cqrs/contracts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/profile_screen/profile_screen_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../register_fallback_values.dart';
import '../test_data.dart';

void main() {
  group(
    'ProfileScreenCubit',
    () {
      late MockAppCQRS cqrs;

      setUpAll(registerFallbackValues);

      setUp(() {
        cqrs = MockAppCQRS();
      });

      ProfileScreenCubit buildCubit() => ProfileScreenCubit(
            cqrs: cqrs,
          );

      blocTest<ProfileScreenCubit, ProfileScreenState>(
        'emit initial ProfileScreenState on the start',
        build: buildCubit,
        verify: (cubit) =>
            expect(cubit.state, const ProfileScreenStateInitial()),
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
          const ProfileScreenStateLoading(),
          ProfileScreenStateSuccess(userInfo: userInfoTest),
        ],
      );

      // blocTest<ProfileScreenCubit, ProfileScreenState>(
      //   'run fetch unsuccessfully',
      //   build: () {
      //     when(() => cqrs.get<UserInfoDTO>(any(that: isA<UserInfo>())))
      //         .thenThrow(Exception());

      //     return buildCubit();
      //   },
      //   act: (cubit) => cubit.fetch(),
      //   expect: () => [
      //     const ProfileScreenStateLoading(),
      //     const ProfileScreenErrorState(error: ''),
      //   ],
      // );

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
          const ProfileScreenStateLoading(),
          ProfileScreenStateSuccess(userInfo: userInfoTest),
          ProfileScreenStateLoading(userInfo: userInfoTest),
          ProfileScreenStateSuccess(userInfo: userInfoTest),
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
          const ProfileScreenStateLoading(),
          ProfileScreenStateSuccess(userInfo: userInfoTest),
        ],
      );

      // blocTest<ProfileScreenCubit, ProfileScreenState>(
      //   'run updateProfile unsuccessfully',
      //   build: () {
      //     when(() => cqrs.run(any<IRemoteCommand>(that: isA<UpdateProfile>())))
      //         .thenThrow(Exception());
      //     when(() => cqrs.get<UserInfoDTO>(any(that: isA<UserInfo>())))
      //         .thenAnswer((_) async => userInfoTest);
      //     return buildCubit();
      //   },
      //   act: (cubit) async {
      //     await cubit.updateProfile();
      //   },
      //   expect: () => [
      //     const ProfileScreenStateLoading(),
      //     const ProfileScreenErrorState(),
      //   ],
      // );

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
          const ProfileScreenStateLoading(),
          ProfileScreenStateSuccess(userInfo: userInfoTest),
          ProfileScreenStateLoading(userInfo: userInfoTest),
          ProfileScreenStateSuccess(userInfo: userInfoTest),
        ],
      );
    },
  );
}
