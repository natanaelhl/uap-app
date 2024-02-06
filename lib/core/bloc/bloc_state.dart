abstract class BlocState<T> {
  final T? data;

  BlocState({
    required this.data,
  });
}

class BlocStableState<T> extends BlocState<T> {
  BlocStableState({super.data});
}

class BlocEmptyState<T> extends BlocState {
  BlocEmptyState({super.data});
}

class BlocErrorState<T> extends BlocState<T> {
  BlocErrorState({super.data});
}

class BlocLoadingState<T> extends BlocState {
  BlocLoadingState({super.data});
}
