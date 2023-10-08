// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetAppSettingsCollection on Isar {
  IsarCollection<int, AppSettings> get appSettings => this.collection();
}

const AppSettingsSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'AppSettings',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'darkMode',
        type: IsarType.bool,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, AppSettings>(
    serialize: serializeAppSettings,
    deserialize: deserializeAppSettings,
    deserializeProperty: deserializeAppSettingsProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeAppSettings(IsarWriter writer, AppSettings object) {
  IsarCore.writeBool(writer, 1, object.darkMode);
  return object.id;
}

@isarProtected
AppSettings deserializeAppSettings(IsarReader reader) {
  final bool _darkMode;
  {
    if (IsarCore.readNull(reader, 1)) {
      _darkMode = true;
    } else {
      _darkMode = IsarCore.readBool(reader, 1);
    }
  }
  final object = AppSettings(
    darkMode: _darkMode,
  );
  object.id = IsarCore.readId(reader);
  return object;
}

@isarProtected
dynamic deserializeAppSettingsProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      {
        if (IsarCore.readNull(reader, 1)) {
          return true;
        } else {
          return IsarCore.readBool(reader, 1);
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _AppSettingsUpdate {
  bool call({
    required int id,
    bool? darkMode,
  });
}

class _AppSettingsUpdateImpl implements _AppSettingsUpdate {
  const _AppSettingsUpdateImpl(this.collection);

  final IsarCollection<int, AppSettings> collection;

  @override
  bool call({
    required int id,
    Object? darkMode = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (darkMode != ignore) 1: darkMode as bool?,
        }) >
        0;
  }
}

sealed class _AppSettingsUpdateAll {
  int call({
    required List<int> id,
    bool? darkMode,
  });
}

class _AppSettingsUpdateAllImpl implements _AppSettingsUpdateAll {
  const _AppSettingsUpdateAllImpl(this.collection);

  final IsarCollection<int, AppSettings> collection;

  @override
  int call({
    required List<int> id,
    Object? darkMode = ignore,
  }) {
    return collection.updateProperties(id, {
      if (darkMode != ignore) 1: darkMode as bool?,
    });
  }
}

extension AppSettingsUpdate on IsarCollection<int, AppSettings> {
  _AppSettingsUpdate get update => _AppSettingsUpdateImpl(this);

  _AppSettingsUpdateAll get updateAll => _AppSettingsUpdateAllImpl(this);
}

sealed class _AppSettingsQueryUpdate {
  int call({
    bool? darkMode,
  });
}

class _AppSettingsQueryUpdateImpl implements _AppSettingsQueryUpdate {
  const _AppSettingsQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<AppSettings> query;
  final int? limit;

  @override
  int call({
    Object? darkMode = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (darkMode != ignore) 1: darkMode as bool?,
    });
  }
}

extension AppSettingsQueryUpdate on IsarQuery<AppSettings> {
  _AppSettingsQueryUpdate get updateFirst =>
      _AppSettingsQueryUpdateImpl(this, limit: 1);

  _AppSettingsQueryUpdate get updateAll => _AppSettingsQueryUpdateImpl(this);
}

class _AppSettingsQueryBuilderUpdateImpl implements _AppSettingsQueryUpdate {
  const _AppSettingsQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<AppSettings, AppSettings, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? darkMode = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (darkMode != ignore) 1: darkMode as bool?,
      });
    } finally {
      q.close();
    }
  }
}

extension AppSettingsQueryBuilderUpdate
    on QueryBuilder<AppSettings, AppSettings, QOperations> {
  _AppSettingsQueryUpdate get updateFirst =>
      _AppSettingsQueryBuilderUpdateImpl(this, limit: 1);

  _AppSettingsQueryUpdate get updateAll =>
      _AppSettingsQueryBuilderUpdateImpl(this);
}

extension AppSettingsQueryFilter
    on QueryBuilder<AppSettings, AppSettings, QFilterCondition> {
  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition>
      idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterFilterCondition> darkModeEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }
}

extension AppSettingsQueryObject
    on QueryBuilder<AppSettings, AppSettings, QFilterCondition> {}

extension AppSettingsQuerySortBy
    on QueryBuilder<AppSettings, AppSettings, QSortBy> {
  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> sortByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> sortByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }
}

extension AppSettingsQuerySortThenBy
    on QueryBuilder<AppSettings, AppSettings, QSortThenBy> {
  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<AppSettings, AppSettings, QAfterSortBy> thenByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }
}

extension AppSettingsQueryWhereDistinct
    on QueryBuilder<AppSettings, AppSettings, QDistinct> {
  QueryBuilder<AppSettings, AppSettings, QAfterDistinct> distinctByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }
}

extension AppSettingsQueryProperty1
    on QueryBuilder<AppSettings, AppSettings, QProperty> {
  QueryBuilder<AppSettings, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<AppSettings, bool, QAfterProperty> darkModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}

extension AppSettingsQueryProperty2<R>
    on QueryBuilder<AppSettings, R, QAfterProperty> {
  QueryBuilder<AppSettings, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<AppSettings, (R, bool), QAfterProperty> darkModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}

extension AppSettingsQueryProperty3<R1, R2>
    on QueryBuilder<AppSettings, (R1, R2), QAfterProperty> {
  QueryBuilder<AppSettings, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<AppSettings, (R1, R2, bool), QOperations> darkModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }
}
