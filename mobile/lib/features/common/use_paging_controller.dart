import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

PagingController<K, T> usePagingController<K, T>({
  required void Function(K pageKey) fetchPage,
  required K firstPageKey,
  required K Function(List<T>) getNextPageKey,
  required bool hasMore,
  required List<T> items,
  dynamic error,
}) {
  final pagingController = useMemoized(
    () => PagingController<K, T>(
      firstPageKey: firstPageKey,
    ),
    [firstPageKey],
  );
  useEffect(() {
    pagingController.addPageRequestListener(fetchPage);
    return () => pagingController.removePageRequestListener(fetchPage);
  }, [pagingController, fetchPage],);
  useEffect(() {
    if (items.isEmpty && hasMore) {
      pagingController.value = PagingState(
        nextPageKey: firstPageKey,
        error: error,
      );
    } else {
      pagingController.value = PagingState(
        itemList: items,
        nextPageKey: hasMore != false ? getNextPageKey(items) : null,
        error: error,
      );
    }
    return null;
  }, [pagingController, items, hasMore, firstPageKey, getNextPageKey, error],);
  return pagingController;
}
