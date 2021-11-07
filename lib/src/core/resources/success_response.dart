import 'package:equatable/equatable.dart';

class SuccessResponse extends Equatable {
  final String? message;
  final Map<String, dynamic>? data;

  const SuccessResponse({this.message, this.data});

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      SuccessResponse(
        message: json['message'] as String?,
        data:
            json['data'] == null ? null : json['data'] as Map<String, dynamic>,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data,
      };

  SuccessResponse copyWith({
    String? message,
    Map<String, dynamic>? data,
  }) {
    return SuccessResponse(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [message, data];
}
