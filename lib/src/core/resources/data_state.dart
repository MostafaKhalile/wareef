import 'package:dio/dio.dart';

/*
the wrapper class,
which wraps our entire network response with DataState
so we can have two states either the response
is a successful or failed with error of type DioError. 
*/

abstract class DataState<T> {
  final T? data;
  final DioError? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioError error) : super(error: error);
}
