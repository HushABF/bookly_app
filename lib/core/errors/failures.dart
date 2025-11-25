import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioExcpetion) {
    switch (dioExcpetion.type) {
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
          dioExcpetion.response!.statusCode!,
          dioExcpetion.response,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Cancel error');

      case DioExceptionType.connectionError:
        return ServerFailure('Connection error with Api Server');

      case DioExceptionType.unknown:
        if (dioExcpetion.message!.contains('SocketException')) {
          return ServerFailure('No Internet connection');
        }
        return ServerFailure('Unkown error try again');
      default:
        return ServerFailure('OOps');
    }
  }

  factory ServerFailure.fromResponse(int statudCode, dynamic response) {
    if (statudCode == 400 || statudCode == 401 || statudCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statudCode == 404) {
      return ServerFailure('your request not found');
    } else if (statudCode == 500) {
      return ServerFailure('Internal server error, try later');
    } else {
      return ServerFailure('Error , try again');
    }
  }
}
