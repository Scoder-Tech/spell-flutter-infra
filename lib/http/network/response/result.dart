import 'failure.dart';

typedef Success<R, T> = R Function(T data);
typedef Error<R> = R Function(Failure error);

class Result<T> {
  Result._();

  factory Result.success(T data) = SuccessState<T>;
  factory Result.error(Failure error) = FailureState;

  bool get isSuccess => this is SuccessState<T>;
  bool get isError => this is FailureState<T>;

  T get data => (this as SuccessState).value;
  Failure get error => (this as FailureState).e;

  R result<R>(Success<R, T> success, Error<R> error) {
    if (isSuccess) {
      return success((this as SuccessState).value);
    }
    return error((this as FailureState).error);
  }
}

class SuccessState<T> extends Result<T> {
  SuccessState(this.value) : super._();

  final T value;
}

class FailureState<T> extends Result<T> {
  FailureState(this.e) : super._();

  final Failure e;
}
