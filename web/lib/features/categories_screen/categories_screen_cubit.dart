import 'dart:math';

import 'package:cqrs/cqrs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/utils/table_section.dart';
import 'package:logging/logging.dart';

part 'categories_screen_cubit.freezed.dart';

class CategoriesScreenCubit extends Cubit<CategoriesScreenState> {
  CategoriesScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const CategoriesScreenStateReady());

  final CQRS _cqrs;
  final _logger = Logger('CategoriesScreenCubit');

  Future<void> init() async {
    try {
      final result = await _cqrs.get(
        AllCategories(),
      );

      final categories = result.split(pageSize).asMap();

      emit(
        CategoriesScreenState.ready(
          currentPage: 0,
          totalCount: result.length,
          categories: categories,
        ),
      );
    } catch (err, st) {
      _logger.severe(err, st);

      emit(
        CategoriesScreenStateError(
          error: err.toString(),
        ),
      );
    }
  }

  Future<void> changePage({int page = 0}) async {
    final state = this.state;

    if (state is! CategoriesScreenStateReady) {
      return;
    }

    if (page != 0) {
      if (page < 0 || page * pageSize >= state.totalCount) {
        return;
      }
    }

    emit(
      state.copyWith(
        currentPage: page,
      ),
    );
  }

  Future<void> deleteCategory(String categoryId) async {
    final state = this.state;
    if (state is! CategoriesScreenStateReady) {
      return;
    }

    try {
      await _cqrs.run(DeleteCategory(id: categoryId));
      await init();
    } catch (err, st) {
      _logger.warning(
        'Failed deleting category with categoryId: $categoryId',
        err,
        st,
      );
      emit(CategoriesScreenState.error(error: err.toString()));
    }
  }
}

@freezed
class CategoriesScreenState with _$CategoriesScreenState {
  const factory CategoriesScreenState.ready({
    @Default(<int, List<CategoryDTO>>{}) Map<int, List<CategoryDTO>> categories,
    @Default(0) int currentPage,
    @Default(0) int totalCount,
  }) = CategoriesScreenStateReady;
  const factory CategoriesScreenState.error({
    required String error,
  }) = CategoriesScreenStateError;
}

extension CategoriesScreenStateReadyEx on CategoriesScreenStateReady {
  List<CategoryDTO> get currentPageCategories => categories[currentPage] ?? [];
}

extension ListEx<T> on List<T> {
  List<List<T>> split(int bunchSize) {
    final copy = [...this];
    final res = <List<T>>[];

    while (copy.isNotEmpty) {
      res.add(copy.take(bunchSize).toList());
      copy.removeRange(0, min(bunchSize, copy.length));
    }

    return res;
  }
}
