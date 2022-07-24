import 'package:bloc/bloc.dart';
import 'package:cqrs/cqrs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:logging/logging.dart';

part 'category_form_body_cubit.freezed.dart';

class CategoryFormBodyCubit extends Cubit<CategoryFormBodyState> {
  CategoryFormBodyCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const CategoryFormBodyStateReady());

  final CQRS _cqrs;
  final _logger = Logger('CategoryFormBodyCubit');

  Future<void> init() async {
    final categories = await _cqrs.get(AllCategories());

    emit(CategoryFormBodyState.ready(
      categories: categories,
    ));
  }

  void updateCategory({
    String? name,
  }) {
    final state = this.state;

    if (state is! CategoryFormBodyStateReady) {
      return;
    }

    emit(state.copyWith(name: name));
  }

  Future<void> createCategory() async {
    final state = this.state;
    if (state is! CategoryFormBodyStateReady) {
      return;
    }

    if (state.categories.map((e) => e.name).contains(state.name)) {
      return;
    }
    try {
      await _cqrs.run(CreateCategory(categoryName: state.name!));
    } catch (err, st) {
      _logger.severe(err, st);
      emit(CategoryFormBodyState.error(error: err.toString()));
    }
  }
}

@freezed
class CategoryFormBodyState with _$CategoryFormBodyState {
  const factory CategoryFormBodyState.ready({
    @Default(<CategoryDTO>[]) List<CategoryDTO> categories,
    String? name,
  }) = CategoryFormBodyStateReady;
  const factory CategoryFormBodyState.error({
    required String error,
  }) = CategoryFormBodyStateError;
}
