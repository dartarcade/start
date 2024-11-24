import 'package:arcade/arcade.dart';
import 'package:luthor/luthor.dart';

typedef SchemaValidationResultMapper<T> = SchemaValidationResult<T> Function(
  Map<String, dynamic> json,
);

extension LuthorExtension<T> on SchemaValidationResultMapper<T> {
  Future<T> withLuthor(RequestContext context) async {
    final body = switch (await context.jsonMap()) {
      BodyParseSuccess(value: final value) => value,
      BodyParseFailure(error: final error) =>
        throw BadRequestException(message: 'Invalid JSON: $error'),
    };

    final result = this(body);
    return switch (result) {
      SchemaValidationSuccess(data: final data) => data,
      SchemaValidationError(data: _, errors: final errors) =>
        throw BadRequestException(message: 'Validation failed', errors: errors),
    };
  }
}
