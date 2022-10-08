import 'package:cqrs/contracts.dart';
import 'package:furniture_shop/cqrs/app_cqrs.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';
import 'package:login_client/login_client.dart';
import 'package:mocktail/mocktail.dart';

class MockAppCQRS extends Mock implements AppCQRS {}

class MockAuthCubit extends Mock implements AuthCubit {}

class IRemoteCommandFake extends Mock implements IRemoteCommand {}

class ResourceOwnerPasswordStrategyFake extends Mock
    implements ResourceOwnerPasswordStrategy {}

void registerFallbackValues() {
  registerFallbackValue(IRemoteCommandFake());
  registerFallbackValue(ResourceOwnerPasswordStrategyFake());
  registerFallbackValue(UserInfo());
  registerFallbackValue(UpdateProfile());
}
