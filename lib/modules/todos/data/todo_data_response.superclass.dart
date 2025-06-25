// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: invalid_annotation_target

part of 'todo_data_response.dart';

// **************************************************************************
// SuperclassGenerator
// **************************************************************************

@freezed
@Luthor()
abstract class $TodoDataResponse with _$$TodoDataResponse {
  const factory $TodoDataResponse({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String title,
    required String description,
    required bool completed,
  }) = _$TodoDataResponse;

  factory $TodoDataResponse.fromJson(Map<String, dynamic> json) =>
      _$$TodoDataResponseFromJson(json);
}
