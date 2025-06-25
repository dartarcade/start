// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:start/modules/todos/tables/todos_table.drift.dart' as i1;
import 'package:uuid/uuid_value.dart' as i2;
import 'package:drift_postgres/drift_postgres.dart' as i3;
import 'package:start/modules/todos/tables/todos_table.dart' as i4;
import 'package:drift/src/runtime/query_builder/query_builder.dart' as i5;

typedef $$TodosTableTableCreateCompanionBuilder = i1.TodosTableCompanion
    Function({
  i0.Value<i2.UuidValue> id,
  i0.Value<i3.PgDateTime> createdAt,
  i0.Value<i3.PgDateTime> updatedAt,
  required String title,
  required String description,
  i0.Value<bool> completed,
  i0.Value<int> rowid,
});
typedef $$TodosTableTableUpdateCompanionBuilder = i1.TodosTableCompanion
    Function({
  i0.Value<i2.UuidValue> id,
  i0.Value<i3.PgDateTime> createdAt,
  i0.Value<i3.PgDateTime> updatedAt,
  i0.Value<String> title,
  i0.Value<String> description,
  i0.Value<bool> completed,
  i0.Value<int> rowid,
});

class $$TodosTableTableFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$TodosTableTable> {
  $$TodosTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<i2.UuidValue> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<i3.PgDateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<i3.PgDateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get description => $composableBuilder(
      column: $table.description,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => i0.ColumnFilters(column));
}

class $$TodosTableTableOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$TodosTableTable> {
  $$TodosTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<i2.UuidValue> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<i3.PgDateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<i3.PgDateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<bool> get completed => $composableBuilder(
      column: $table.completed,
      builder: (column) => i0.ColumnOrderings(column));
}

class $$TodosTableTableAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.$TodosTableTable> {
  $$TodosTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<i2.UuidValue> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<i3.PgDateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  i0.GeneratedColumn<i3.PgDateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  i0.GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  i0.GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  i0.GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);
}

class $$TodosTableTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i1.$TodosTableTable,
    i1.TodosTableData,
    i1.$$TodosTableTableFilterComposer,
    i1.$$TodosTableTableOrderingComposer,
    i1.$$TodosTableTableAnnotationComposer,
    $$TodosTableTableCreateCompanionBuilder,
    $$TodosTableTableUpdateCompanionBuilder,
    (
      i1.TodosTableData,
      i0.BaseReferences<i0.GeneratedDatabase, i1.$TodosTableTable,
          i1.TodosTableData>
    ),
    i1.TodosTableData,
    i0.PrefetchHooks Function()> {
  $$TodosTableTableTableManager(
      i0.GeneratedDatabase db, i1.$TodosTableTable table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$$TodosTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$$TodosTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$$TodosTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<i2.UuidValue> id = const i0.Value.absent(),
            i0.Value<i3.PgDateTime> createdAt = const i0.Value.absent(),
            i0.Value<i3.PgDateTime> updatedAt = const i0.Value.absent(),
            i0.Value<String> title = const i0.Value.absent(),
            i0.Value<String> description = const i0.Value.absent(),
            i0.Value<bool> completed = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.TodosTableCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            title: title,
            description: description,
            completed: completed,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            i0.Value<i2.UuidValue> id = const i0.Value.absent(),
            i0.Value<i3.PgDateTime> createdAt = const i0.Value.absent(),
            i0.Value<i3.PgDateTime> updatedAt = const i0.Value.absent(),
            required String title,
            required String description,
            i0.Value<bool> completed = const i0.Value.absent(),
            i0.Value<int> rowid = const i0.Value.absent(),
          }) =>
              i1.TodosTableCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            title: title,
            description: description,
            completed: completed,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TodosTableTableProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i1.$TodosTableTable,
    i1.TodosTableData,
    i1.$$TodosTableTableFilterComposer,
    i1.$$TodosTableTableOrderingComposer,
    i1.$$TodosTableTableAnnotationComposer,
    $$TodosTableTableCreateCompanionBuilder,
    $$TodosTableTableUpdateCompanionBuilder,
    (
      i1.TodosTableData,
      i0.BaseReferences<i0.GeneratedDatabase, i1.$TodosTableTable,
          i1.TodosTableData>
    ),
    i1.TodosTableData,
    i0.PrefetchHooks Function()>;

class $TodosTableTable extends i4.TodosTable
    with i0.TableInfo<$TodosTableTable, i1.TodosTableData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodosTableTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<i2.UuidValue> id =
      i0.GeneratedColumn<i2.UuidValue>('id', aliasedName, false,
          type: i3.PgTypes.uuid,
          requiredDuringInsert: false,
          defaultValue: const i5.FunctionCallExpression('gen_random_uuid', []));
  static const i0.VerificationMeta _createdAtMeta =
      const i0.VerificationMeta('createdAt');
  @override
  late final i0.GeneratedColumn<i3.PgDateTime> createdAt =
      i0.GeneratedColumn<i3.PgDateTime>('created_at', aliasedName, false,
          type: i3.PgTypes.timestampWithTimezone,
          requiredDuringInsert: false,
          defaultValue: const i5.FunctionCallExpression('now', []));
  static const i0.VerificationMeta _updatedAtMeta =
      const i0.VerificationMeta('updatedAt');
  @override
  late final i0.GeneratedColumn<i3.PgDateTime> updatedAt =
      i0.GeneratedColumn<i3.PgDateTime>('updated_at', aliasedName, false,
          type: i3.PgTypes.timestampWithTimezone,
          requiredDuringInsert: false,
          defaultValue: const i5.FunctionCallExpression('now', []));
  static const i0.VerificationMeta _titleMeta =
      const i0.VerificationMeta('title');
  @override
  late final i0.GeneratedColumn<String> title = i0.GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks: i0.GeneratedColumn.checkTextLength(
          minTextLength: 1, maxTextLength: 255),
      type: i0.DriftSqlType.string,
      requiredDuringInsert: true);
  static const i0.VerificationMeta _descriptionMeta =
      const i0.VerificationMeta('description');
  @override
  late final i0.GeneratedColumn<String> description =
      i0.GeneratedColumn<String>('description', aliasedName, false,
          additionalChecks: i0.GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 1000),
          type: i0.DriftSqlType.string,
          requiredDuringInsert: true);
  static const i0.VerificationMeta _completedMeta =
      const i0.VerificationMeta('completed');
  @override
  late final i0.GeneratedColumn<bool> completed = i0.GeneratedColumn<bool>(
      'completed', aliasedName, false,
      type: i0.DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultValue: const i5.Constant(false));
  @override
  List<i0.GeneratedColumn> get $columns =>
      [id, createdAt, updatedAt, title, description, completed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todos';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i1.TodosTableData> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i1.TodosTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.TodosTableData(
      id: attachedDatabase.typeMapping
          .read(i3.PgTypes.uuid, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping.read(
          i3.PgTypes.timestampWithTimezone,
          data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping.read(
          i3.PgTypes.timestampWithTimezone,
          data['${effectivePrefix}updated_at'])!,
      title: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}description'])!,
      completed: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.bool, data['${effectivePrefix}completed'])!,
    );
  }

  @override
  $TodosTableTable createAlias(String alias) {
    return $TodosTableTable(attachedDatabase, alias);
  }
}

class TodosTableData extends i0.DataClass
    implements i0.Insertable<i1.TodosTableData> {
  final i2.UuidValue id;
  final i3.PgDateTime createdAt;
  final i3.PgDateTime updatedAt;
  final String title;
  final String description;
  final bool completed;
  const TodosTableData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.title,
      required this.description,
      required this.completed});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<i2.UuidValue>(id, i3.PgTypes.uuid);
    map['created_at'] =
        i0.Variable<i3.PgDateTime>(createdAt, i3.PgTypes.timestampWithTimezone);
    map['updated_at'] =
        i0.Variable<i3.PgDateTime>(updatedAt, i3.PgTypes.timestampWithTimezone);
    map['title'] = i0.Variable<String>(title);
    map['description'] = i0.Variable<String>(description);
    map['completed'] = i0.Variable<bool>(completed);
    return map;
  }

  i1.TodosTableCompanion toCompanion(bool nullToAbsent) {
    return i1.TodosTableCompanion(
      id: i0.Value(id),
      createdAt: i0.Value(createdAt),
      updatedAt: i0.Value(updatedAt),
      title: i0.Value(title),
      description: i0.Value(description),
      completed: i0.Value(completed),
    );
  }

  factory TodosTableData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return TodosTableData(
      id: serializer.fromJson<i2.UuidValue>(json['id']),
      createdAt: serializer.fromJson<i3.PgDateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<i3.PgDateTime>(json['updatedAt']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<i2.UuidValue>(id),
      'createdAt': serializer.toJson<i3.PgDateTime>(createdAt),
      'updatedAt': serializer.toJson<i3.PgDateTime>(updatedAt),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  i1.TodosTableData copyWith(
          {i2.UuidValue? id,
          i3.PgDateTime? createdAt,
          i3.PgDateTime? updatedAt,
          String? title,
          String? description,
          bool? completed}) =>
      i1.TodosTableData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        title: title ?? this.title,
        description: description ?? this.description,
        completed: completed ?? this.completed,
      );
  TodosTableData copyWithCompanion(i1.TodosTableCompanion data) {
    return TodosTableData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      completed: data.completed.present ? data.completed.value : this.completed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodosTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, updatedAt, title, description, completed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.TodosTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.title == this.title &&
          other.description == this.description &&
          other.completed == this.completed);
}

class TodosTableCompanion extends i0.UpdateCompanion<i1.TodosTableData> {
  final i0.Value<i2.UuidValue> id;
  final i0.Value<i3.PgDateTime> createdAt;
  final i0.Value<i3.PgDateTime> updatedAt;
  final i0.Value<String> title;
  final i0.Value<String> description;
  final i0.Value<bool> completed;
  final i0.Value<int> rowid;
  const TodosTableCompanion({
    this.id = const i0.Value.absent(),
    this.createdAt = const i0.Value.absent(),
    this.updatedAt = const i0.Value.absent(),
    this.title = const i0.Value.absent(),
    this.description = const i0.Value.absent(),
    this.completed = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  TodosTableCompanion.insert({
    this.id = const i0.Value.absent(),
    this.createdAt = const i0.Value.absent(),
    this.updatedAt = const i0.Value.absent(),
    required String title,
    required String description,
    this.completed = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  })  : title = i0.Value(title),
        description = i0.Value(description);
  static i0.Insertable<i1.TodosTableData> custom({
    i0.Expression<i2.UuidValue>? id,
    i0.Expression<i3.PgDateTime>? createdAt,
    i0.Expression<i3.PgDateTime>? updatedAt,
    i0.Expression<String>? title,
    i0.Expression<String>? description,
    i0.Expression<bool>? completed,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (completed != null) 'completed': completed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.TodosTableCompanion copyWith(
      {i0.Value<i2.UuidValue>? id,
      i0.Value<i3.PgDateTime>? createdAt,
      i0.Value<i3.PgDateTime>? updatedAt,
      i0.Value<String>? title,
      i0.Value<String>? description,
      i0.Value<bool>? completed,
      i0.Value<int>? rowid}) {
    return i1.TodosTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<i2.UuidValue>(id.value, i3.PgTypes.uuid);
    }
    if (createdAt.present) {
      map['created_at'] = i0.Variable<i3.PgDateTime>(
          createdAt.value, i3.PgTypes.timestampWithTimezone);
    }
    if (updatedAt.present) {
      map['updated_at'] = i0.Variable<i3.PgDateTime>(
          updatedAt.value, i3.PgTypes.timestampWithTimezone);
    }
    if (title.present) {
      map['title'] = i0.Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = i0.Variable<String>(description.value);
    }
    if (completed.present) {
      map['completed'] = i0.Variable<bool>(completed.value);
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('completed: $completed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}
