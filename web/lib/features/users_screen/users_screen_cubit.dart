import 'package:cqrs/cqrs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/utils/table_section.dart';
import 'package:logging/logging.dart';

part 'users_screen_cubit.freezed.dart';

class UsersScreenCubit extends Cubit<UsersScreenState> {
  UsersScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const UsersScreenStateReady());

  final CQRS _cqrs;
  final _logger = Logger('UsersScreenCubit');

  Future<void> fetch({int page = 0}) async {
    final state = this.state;

    if (state is! UsersScreenStateReady) {
      return;
    }

    if (page != 0) {
      if (page < 0 || page >= (state.totalCount - 1) / pageSize) {
        return;
      }
    }

    try {
      final result = await _cqrs.get(
        AllUsers(
          pageNumber: page,
          pageSize: pageSize,
        ),
      );

      emit(
        state.copyWith(
          currentPage: page,
          totalCount: result.totalCount,
          users: {
            ...state.users,
            page: result.items,
          },
        ),
      );
    } catch (err, st) {
      _logger.severe(err, st);

      emit(
        UsersScreenStateError(
          error: err.toString(),
        ),
      );
    }
  }

  Future<void> banUser(String userId) async {
    final state = this.state;

    if (state is! UsersScreenStateReady) {
      return;
    }

    try {
      await _cqrs.run(BanUser(userId: userId));
    } catch (err, st) {
      _logger.severe('Could not ban user', err, st);
    }
  }

  Future<void> unbanUser(String userId) async {
    final state = this.state;

    if (state is! UsersScreenStateReady) {
      return;
    }

    try {
      await _cqrs.run(UnbanUser(userId: userId));
    } catch (err, st) {
      _logger.severe('Could not unban user', err, st);
    }
  }
}

@freezed
class UsersScreenState with _$UsersScreenState {
  const factory UsersScreenState.ready({
    @Default(<int, List<UserInfoDTO>>{}) Map<int, List<UserInfoDTO>> users,
    @Default(0) int currentPage,
    @Default(0) int totalCount,
  }) = UsersScreenStateReady;
  const factory UsersScreenState.error({
    required String error,
  }) = UsersScreenStateError;
}

extension UsersScreenStateReadyEx on UsersScreenStateReady {
  List<UserInfoDTO> get currentPageUsers => users[currentPage] ?? [];
}
