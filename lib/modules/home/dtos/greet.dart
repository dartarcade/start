import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:luthor/luthor.dart';

part 'greet.freezed.dart';
part 'greet.g.dart';

@luthor
@freezed
class GreetRequest with _$GreetRequest {
  const factory GreetRequest({
    @HasMin(1) required String name,
  }) = _GreetRequest;

  factory GreetRequest.fromJson(Map<String, dynamic> json) =>
      _$GreetRequestFromJson(json);
}

@freezed
class GreetResponse with _$GreetResponse {
  const factory GreetResponse({
    required String message,
  }) = _GreetResponse;

  factory GreetResponse.fromJson(Map<String, dynamic> json) =>
      _$GreetResponseFromJson(json);
}
