// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetGameCollection on Isar {
  IsarCollection<int, Game> get games => this.collection();
}

const GameSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'Game',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'gameNumber',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'points',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'bingoType',
        type: IsarType.byte,
        enumMap: {"plaque": 0, "kta": 1, "exploration": 2},
      ),
      IsarPropertySchema(
        name: 'date',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'hour',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'time',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'isAlcool',
        type: IsarType.bool,
      ),
      IsarPropertySchema(
        name: 'nbShot',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'favorite',
        type: IsarType.bool,
      ),
      IsarPropertySchema(
        name: 'bingoCards',
        type: IsarType.objectList,
        target: 'BingoCard',
      ),
      IsarPropertySchema(
        name: 'mode',
        type: IsarType.byte,
        enumMap: {"random": 0, "personalize": 1},
      ),
      IsarPropertySchema(
        name: 'isPlaying',
        type: IsarType.bool,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, Game>(
    serialize: serializeGame,
    deserialize: deserializeGame,
    deserializeProperty: deserializeGameProp,
  ),
  embeddedSchemas: [BingoCardSchema],
);

@isarProtected
int serializeGame(IsarWriter writer, Game object) {
  IsarCore.writeLong(writer, 1, object.gameNumber);
  IsarCore.writeLong(writer, 2, object.points);
  IsarCore.writeByte(writer, 3, object.bingoType.index);
  IsarCore.writeString(writer, 4, object.date);
  IsarCore.writeString(writer, 5, object.hour);
  IsarCore.writeString(writer, 6, object.time);
  IsarCore.writeBool(writer, 7, object.isAlcool);
  IsarCore.writeLong(writer, 8, object.nbShot);
  IsarCore.writeBool(writer, 9, object.favorite);
  {
    final list = object.bingoCards;
    final listWriter = IsarCore.beginList(writer, 10, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeBingoCard(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  IsarCore.writeByte(writer, 11, object.mode.index);
  IsarCore.writeBool(writer, 12, object.isPlaying);
  return object.id;
}

@isarProtected
Game deserializeGame(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final int _gameNumber;
  {
    final value = IsarCore.readLong(reader, 1);
    if (value == -9223372036854775808) {
      _gameNumber = -1;
    } else {
      _gameNumber = value;
    }
  }
  final int _points;
  {
    final value = IsarCore.readLong(reader, 2);
    if (value == -9223372036854775808) {
      _points = 0;
    } else {
      _points = value;
    }
  }
  final BingoType _bingoType;
  {
    if (IsarCore.readNull(reader, 3)) {
      _bingoType = BingoType.plaque;
    } else {
      _bingoType =
          _gameBingoType[IsarCore.readByte(reader, 3)] ?? BingoType.plaque;
    }
  }
  final String _date;
  _date = IsarCore.readString(reader, 4) ?? "";
  final String _hour;
  _hour = IsarCore.readString(reader, 5) ?? "";
  final String _time;
  _time = IsarCore.readString(reader, 6) ?? "";
  final bool _isAlcool;
  _isAlcool = IsarCore.readBool(reader, 7);
  final int _nbShot;
  {
    final value = IsarCore.readLong(reader, 8);
    if (value == -9223372036854775808) {
      _nbShot = -1;
    } else {
      _nbShot = value;
    }
  }
  final bool _favorite;
  _favorite = IsarCore.readBool(reader, 9);
  final List<BingoCard> _bingoCards;
  {
    final length = IsarCore.readList(reader, 10, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        _bingoCards = const <BingoCard>[];
      } else {
        final list =
            List<BingoCard>.filled(length, BingoCard(), growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = BingoCard();
            } else {
              final embedded = deserializeBingoCard(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        _bingoCards = list;
      }
    }
  }
  final Mode _mode;
  {
    if (IsarCore.readNull(reader, 11)) {
      _mode = Mode.random;
    } else {
      _mode = _gameMode[IsarCore.readByte(reader, 11)] ?? Mode.random;
    }
  }
  final bool _isPlaying;
  _isPlaying = IsarCore.readBool(reader, 12);
  final object = Game(
    id: _id,
    gameNumber: _gameNumber,
    points: _points,
    bingoType: _bingoType,
    date: _date,
    hour: _hour,
    time: _time,
    isAlcool: _isAlcool,
    nbShot: _nbShot,
    favorite: _favorite,
    bingoCards: _bingoCards,
    mode: _mode,
    isPlaying: _isPlaying,
  );
  return object;
}

@isarProtected
dynamic deserializeGameProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      {
        final value = IsarCore.readLong(reader, 1);
        if (value == -9223372036854775808) {
          return -1;
        } else {
          return value;
        }
      }
    case 2:
      {
        final value = IsarCore.readLong(reader, 2);
        if (value == -9223372036854775808) {
          return 0;
        } else {
          return value;
        }
      }
    case 3:
      {
        if (IsarCore.readNull(reader, 3)) {
          return BingoType.plaque;
        } else {
          return _gameBingoType[IsarCore.readByte(reader, 3)] ??
              BingoType.plaque;
        }
      }
    case 4:
      return IsarCore.readString(reader, 4) ?? "";
    case 5:
      return IsarCore.readString(reader, 5) ?? "";
    case 6:
      return IsarCore.readString(reader, 6) ?? "";
    case 7:
      return IsarCore.readBool(reader, 7);
    case 8:
      {
        final value = IsarCore.readLong(reader, 8);
        if (value == -9223372036854775808) {
          return -1;
        } else {
          return value;
        }
      }
    case 9:
      return IsarCore.readBool(reader, 9);
    case 10:
      {
        final length = IsarCore.readList(reader, 10, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <BingoCard>[];
          } else {
            final list =
                List<BingoCard>.filled(length, BingoCard(), growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = BingoCard();
                } else {
                  final embedded = deserializeBingoCard(objectReader);
                  IsarCore.freeReader(objectReader);
                  list[i] = embedded;
                }
              }
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    case 11:
      {
        if (IsarCore.readNull(reader, 11)) {
          return Mode.random;
        } else {
          return _gameMode[IsarCore.readByte(reader, 11)] ?? Mode.random;
        }
      }
    case 12:
      return IsarCore.readBool(reader, 12);
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _GameUpdate {
  bool call({
    required int id,
    int? gameNumber,
    int? points,
    BingoType? bingoType,
    String? date,
    String? hour,
    String? time,
    bool? isAlcool,
    int? nbShot,
    bool? favorite,
    Mode? mode,
    bool? isPlaying,
  });
}

class _GameUpdateImpl implements _GameUpdate {
  const _GameUpdateImpl(this.collection);

  final IsarCollection<int, Game> collection;

  @override
  bool call({
    required int id,
    Object? gameNumber = ignore,
    Object? points = ignore,
    Object? bingoType = ignore,
    Object? date = ignore,
    Object? hour = ignore,
    Object? time = ignore,
    Object? isAlcool = ignore,
    Object? nbShot = ignore,
    Object? favorite = ignore,
    Object? mode = ignore,
    Object? isPlaying = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (gameNumber != ignore) 1: gameNumber as int?,
          if (points != ignore) 2: points as int?,
          if (bingoType != ignore) 3: bingoType as BingoType?,
          if (date != ignore) 4: date as String?,
          if (hour != ignore) 5: hour as String?,
          if (time != ignore) 6: time as String?,
          if (isAlcool != ignore) 7: isAlcool as bool?,
          if (nbShot != ignore) 8: nbShot as int?,
          if (favorite != ignore) 9: favorite as bool?,
          if (mode != ignore) 11: mode as Mode?,
          if (isPlaying != ignore) 12: isPlaying as bool?,
        }) >
        0;
  }
}

sealed class _GameUpdateAll {
  int call({
    required List<int> id,
    int? gameNumber,
    int? points,
    BingoType? bingoType,
    String? date,
    String? hour,
    String? time,
    bool? isAlcool,
    int? nbShot,
    bool? favorite,
    Mode? mode,
    bool? isPlaying,
  });
}

class _GameUpdateAllImpl implements _GameUpdateAll {
  const _GameUpdateAllImpl(this.collection);

  final IsarCollection<int, Game> collection;

  @override
  int call({
    required List<int> id,
    Object? gameNumber = ignore,
    Object? points = ignore,
    Object? bingoType = ignore,
    Object? date = ignore,
    Object? hour = ignore,
    Object? time = ignore,
    Object? isAlcool = ignore,
    Object? nbShot = ignore,
    Object? favorite = ignore,
    Object? mode = ignore,
    Object? isPlaying = ignore,
  }) {
    return collection.updateProperties(id, {
      if (gameNumber != ignore) 1: gameNumber as int?,
      if (points != ignore) 2: points as int?,
      if (bingoType != ignore) 3: bingoType as BingoType?,
      if (date != ignore) 4: date as String?,
      if (hour != ignore) 5: hour as String?,
      if (time != ignore) 6: time as String?,
      if (isAlcool != ignore) 7: isAlcool as bool?,
      if (nbShot != ignore) 8: nbShot as int?,
      if (favorite != ignore) 9: favorite as bool?,
      if (mode != ignore) 11: mode as Mode?,
      if (isPlaying != ignore) 12: isPlaying as bool?,
    });
  }
}

extension GameUpdate on IsarCollection<int, Game> {
  _GameUpdate get update => _GameUpdateImpl(this);

  _GameUpdateAll get updateAll => _GameUpdateAllImpl(this);
}

sealed class _GameQueryUpdate {
  int call({
    int? gameNumber,
    int? points,
    BingoType? bingoType,
    String? date,
    String? hour,
    String? time,
    bool? isAlcool,
    int? nbShot,
    bool? favorite,
    Mode? mode,
    bool? isPlaying,
  });
}

class _GameQueryUpdateImpl implements _GameQueryUpdate {
  const _GameQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<Game> query;
  final int? limit;

  @override
  int call({
    Object? gameNumber = ignore,
    Object? points = ignore,
    Object? bingoType = ignore,
    Object? date = ignore,
    Object? hour = ignore,
    Object? time = ignore,
    Object? isAlcool = ignore,
    Object? nbShot = ignore,
    Object? favorite = ignore,
    Object? mode = ignore,
    Object? isPlaying = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (gameNumber != ignore) 1: gameNumber as int?,
      if (points != ignore) 2: points as int?,
      if (bingoType != ignore) 3: bingoType as BingoType?,
      if (date != ignore) 4: date as String?,
      if (hour != ignore) 5: hour as String?,
      if (time != ignore) 6: time as String?,
      if (isAlcool != ignore) 7: isAlcool as bool?,
      if (nbShot != ignore) 8: nbShot as int?,
      if (favorite != ignore) 9: favorite as bool?,
      if (mode != ignore) 11: mode as Mode?,
      if (isPlaying != ignore) 12: isPlaying as bool?,
    });
  }
}

extension GameQueryUpdate on IsarQuery<Game> {
  _GameQueryUpdate get updateFirst => _GameQueryUpdateImpl(this, limit: 1);

  _GameQueryUpdate get updateAll => _GameQueryUpdateImpl(this);
}

class _GameQueryBuilderUpdateImpl implements _GameQueryUpdate {
  const _GameQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<Game, Game, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? gameNumber = ignore,
    Object? points = ignore,
    Object? bingoType = ignore,
    Object? date = ignore,
    Object? hour = ignore,
    Object? time = ignore,
    Object? isAlcool = ignore,
    Object? nbShot = ignore,
    Object? favorite = ignore,
    Object? mode = ignore,
    Object? isPlaying = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (gameNumber != ignore) 1: gameNumber as int?,
        if (points != ignore) 2: points as int?,
        if (bingoType != ignore) 3: bingoType as BingoType?,
        if (date != ignore) 4: date as String?,
        if (hour != ignore) 5: hour as String?,
        if (time != ignore) 6: time as String?,
        if (isAlcool != ignore) 7: isAlcool as bool?,
        if (nbShot != ignore) 8: nbShot as int?,
        if (favorite != ignore) 9: favorite as bool?,
        if (mode != ignore) 11: mode as Mode?,
        if (isPlaying != ignore) 12: isPlaying as bool?,
      });
    } finally {
      q.close();
    }
  }
}

extension GameQueryBuilderUpdate on QueryBuilder<Game, Game, QOperations> {
  _GameQueryUpdate get updateFirst =>
      _GameQueryBuilderUpdateImpl(this, limit: 1);

  _GameQueryUpdate get updateAll => _GameQueryBuilderUpdateImpl(this);
}

const _gameBingoType = {
  0: BingoType.plaque,
  1: BingoType.kta,
  2: BingoType.exploration,
};
const _gameMode = {
  0: Mode.random,
  1: Mode.personalize,
};

extension GameQueryFilter on QueryBuilder<Game, Game, QFilterCondition> {
  QueryBuilder<Game, Game, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<Game, Game, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Game, Game, QAfterFilterCondition> idGreaterThanOrEqualTo(
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

  QueryBuilder<Game, Game, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Game, Game, QAfterFilterCondition> idLessThanOrEqualTo(
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

  QueryBuilder<Game, Game, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Game, Game, QAfterFilterCondition> gameNumberEqualTo(
    int value,
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

  QueryBuilder<Game, Game, QAfterFilterCondition> gameNumberGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition>
      gameNumberGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> gameNumberLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> gameNumberLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> gameNumberBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pointsEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pointsGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pointsGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pointsLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pointsLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pointsBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> bingoTypeEqualTo(
    BingoType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> bingoTypeGreaterThan(
    BingoType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> bingoTypeGreaterThanOrEqualTo(
    BingoType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> bingoTypeLessThan(
    BingoType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> bingoTypeLessThanOrEqualTo(
    BingoType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> bingoTypeBetween(
    BingoType lower,
    BingoType upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower.index,
          upper: upper.index,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 4,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 5,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 6,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 6,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> isAlcoolEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> nbShotEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> nbShotGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> nbShotGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> nbShotLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> nbShotLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> nbShotBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 8,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> favoriteEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> bingoCardsIsEmpty() {
    return not().bingoCardsIsNotEmpty();
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> bingoCardsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 10, value: null),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> modeEqualTo(
    Mode value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 11,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> modeGreaterThan(
    Mode value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 11,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> modeGreaterThanOrEqualTo(
    Mode value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 11,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> modeLessThan(
    Mode value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 11,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> modeLessThanOrEqualTo(
    Mode value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 11,
          value: value.index,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> modeBetween(
    Mode lower,
    Mode upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 11,
          lower: lower.index,
          upper: upper.index,
        ),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> isPlayingEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 12,
          value: value,
        ),
      );
    });
  }
}

extension GameQueryObject on QueryBuilder<Game, Game, QFilterCondition> {}

extension GameQuerySortBy on QueryBuilder<Game, Game, QSortBy> {
  QueryBuilder<Game, Game, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByGameNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByGameNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByBingoType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByBingoTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByDateDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByHour(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByHourDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        6,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByTimeDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        6,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByIsAlcool() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByIsAlcoolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByNbShot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByNbShotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, sort: Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9, sort: Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11, sort: Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByIsPlaying() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(12);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByIsPlayingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(12, sort: Sort.desc);
    });
  }
}

extension GameQuerySortThenBy on QueryBuilder<Game, Game, QSortThenBy> {
  QueryBuilder<Game, Game, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByGameNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByGameNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByBingoType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByBingoTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByDateDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByHour(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByHourDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByTimeDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByIsAlcool() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByIsAlcoolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByNbShot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByNbShotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, sort: Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9, sort: Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11, sort: Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByIsPlaying() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(12);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByIsPlayingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(12, sort: Sort.desc);
    });
  }
}

extension GameQueryWhereDistinct on QueryBuilder<Game, Game, QDistinct> {
  QueryBuilder<Game, Game, QAfterDistinct> distinctByGameNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<Game, Game, QAfterDistinct> distinctByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<Game, Game, QAfterDistinct> distinctByBingoType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<Game, Game, QAfterDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Game, Game, QAfterDistinct> distinctByHour(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Game, Game, QAfterDistinct> distinctByTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Game, Game, QAfterDistinct> distinctByIsAlcool() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(7);
    });
  }

  QueryBuilder<Game, Game, QAfterDistinct> distinctByNbShot() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(8);
    });
  }

  QueryBuilder<Game, Game, QAfterDistinct> distinctByFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(9);
    });
  }

  QueryBuilder<Game, Game, QAfterDistinct> distinctByMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(11);
    });
  }

  QueryBuilder<Game, Game, QAfterDistinct> distinctByIsPlaying() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(12);
    });
  }
}

extension GameQueryProperty1 on QueryBuilder<Game, Game, QProperty> {
  QueryBuilder<Game, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Game, int, QAfterProperty> gameNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Game, int, QAfterProperty> pointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Game, BingoType, QAfterProperty> bingoTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Game, String, QAfterProperty> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Game, String, QAfterProperty> hourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Game, String, QAfterProperty> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Game, bool, QAfterProperty> isAlcoolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<Game, int, QAfterProperty> nbShotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<Game, bool, QAfterProperty> favoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<Game, List<BingoCard>, QAfterProperty> bingoCardsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<Game, Mode, QAfterProperty> modeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }

  QueryBuilder<Game, bool, QAfterProperty> isPlayingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(12);
    });
  }
}

extension GameQueryProperty2<R> on QueryBuilder<Game, R, QAfterProperty> {
  QueryBuilder<Game, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Game, (R, int), QAfterProperty> gameNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Game, (R, int), QAfterProperty> pointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Game, (R, BingoType), QAfterProperty> bingoTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Game, (R, String), QAfterProperty> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Game, (R, String), QAfterProperty> hourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Game, (R, String), QAfterProperty> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Game, (R, bool), QAfterProperty> isAlcoolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<Game, (R, int), QAfterProperty> nbShotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<Game, (R, bool), QAfterProperty> favoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<Game, (R, List<BingoCard>), QAfterProperty>
      bingoCardsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<Game, (R, Mode), QAfterProperty> modeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }

  QueryBuilder<Game, (R, bool), QAfterProperty> isPlayingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(12);
    });
  }
}

extension GameQueryProperty3<R1, R2>
    on QueryBuilder<Game, (R1, R2), QAfterProperty> {
  QueryBuilder<Game, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<Game, (R1, R2, int), QOperations> gameNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Game, (R1, R2, int), QOperations> pointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Game, (R1, R2, BingoType), QOperations> bingoTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<Game, (R1, R2, String), QOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<Game, (R1, R2, String), QOperations> hourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<Game, (R1, R2, String), QOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<Game, (R1, R2, bool), QOperations> isAlcoolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<Game, (R1, R2, int), QOperations> nbShotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<Game, (R1, R2, bool), QOperations> favoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<Game, (R1, R2, List<BingoCard>), QOperations>
      bingoCardsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<Game, (R1, R2, Mode), QOperations> modeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }

  QueryBuilder<Game, (R1, R2, bool), QOperations> isPlayingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(12);
    });
  }
}
