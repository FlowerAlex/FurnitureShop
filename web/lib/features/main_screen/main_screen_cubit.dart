import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_screen_cubit.freezed.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit()
      : super(
          const MainScreenReadyState(
            currentSection: MainScreenSection.products,
          ),
        );

  void changeCurrentSection(MainScreenSection currentSection) {
    emit(MainScreenReadyState(currentSection: currentSection));
  }
}

@freezed
class MainScreenState with _$MainScreenState {
  const factory MainScreenState.ready({
    required MainScreenSection currentSection,
  }) = MainScreenReadyState;
}

enum MainScreenSection {
  products,
  categories,
  users,
  orders,
}
