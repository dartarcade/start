import 'package:drift_postgres/drift_postgres.dart';
import 'package:json_annotation/json_annotation.dart';

class PgDateTimeConverter extends JsonConverter<PgDateTime, DateTime> {
  const PgDateTimeConverter();

  @override
  PgDateTime fromJson(DateTime json) => PgDateTime(json);

  @override
  DateTime toJson(PgDateTime object) => object.dateTime;
}
