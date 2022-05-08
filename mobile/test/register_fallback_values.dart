import 'package:cqrs/contracts.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';
import 'package:leancode_contracts/leancode_contracts.dart';
import 'package:login_client/login_client.dart';
import 'package:mocktail/mocktail.dart';

class MockCQRS extends Mock implements CQRS {}

class MockAuthCubit extends Mock implements AuthCubit {}

class IRemoteCommandFake extends Mock implements IRemoteCommand {}

class ResourceOwnerPasswordStrategyFake extends Mock
    implements ResourceOwnerPasswordStrategy {}

class RegisterUserFake extends Mock implements RegisterUser {}

void registerFallbackValues() {
  registerFallbackValue(RegisterUserFake);
  registerFallbackValue(IRemoteCommandFake());
  registerFallbackValue(ResourceOwnerPasswordStrategyFake());
  registerFallbackValue(UserInfo());
  registerFallbackValue(UpdateProfile());
}
