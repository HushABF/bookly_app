import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with Api Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with Api Server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with Api Server');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate timeout with Api Server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Cancel error');

      case DioExceptionType.connectionError:
        return ServerFailure('Connection error with Api Server');

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet connection');
        }
        return ServerFailure('Unknown error, please try again');
      default:
        return ServerFailure('An unexpected error occurred');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('your request not found');
    } else if (statusCode == 429) {
      return ServerFailure('Too many requests. Please try again later.');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, try later');
    } else {
      return ServerFailure('Error , try again');
    }
  }
}
