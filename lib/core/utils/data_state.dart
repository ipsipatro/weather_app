abstract class DataState<T> {
  const DataState();
}

class DataSuccess<T> extends DataState<T> {
  final T data;

  const DataSuccess(this.data);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DataSuccess<T> && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class DataError<T> extends DataState<T> {
  final String message;

  const DataError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DataError<T> && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
