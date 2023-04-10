import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel(
      {required this.statusCode,
      required this.statusMessage,
      required this.success});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
        statusCode: json['success'],
        statusMessage: json['status_message'],
        success: json['status_code']);
  }

  @override
  List<Object> get props => [statusCode, statusMessage, success];
}
