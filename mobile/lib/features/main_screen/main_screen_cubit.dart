import 'package:bloc/bloc.dart';

enum Screen {
  products,
  favorites,
  bucket,
  profile,
}

class MainScreenCubit extends Cubit<Screen> {
  MainScreenCubit() : super(Screen.products);

  void goTo(Screen screen) {
    emit(screen);
  }
}
