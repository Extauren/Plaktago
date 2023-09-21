// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGameCollection on Isar {
  IsarCollection<Game> get games => this.collection();
}

const GameSchema = CollectionSchema(
  name: r'Game',
  id: -6261407721091271860,
  properties: {
    r'bingoCardList': PropertySchema(
      id: 0,
      name: r'bingoCardList',
      type: IsarType.objectList,
      target: r'BingoCard',
    ),
    r'bingoType': PropertySchema(
      id: 1,
      name: r'bingoType',
      type: IsarType.byte,
      enumMap: _GamebingoTypeEnumValueMap,
    ),
    r'date': PropertySchema(
      id: 2,
      name: r'date',
      type: IsarType.string,
    ),
    r'gameNumber': PropertySchema(
      id: 3,
      name: r'gameNumber',
      type: IsarType.long,
    ),
    r'hour': PropertySchema(
      id: 4,
      name: r'hour',
      type: IsarType.string,
    ),
    r'isAlcool': PropertySchema(
      id: 5,
      name: r'isAlcool',
      type: IsarType.bool,
    ),
    r'nbShot': PropertySchema(
      id: 6,
      name: r'nbShot',
      type: IsarType.long,
    ),
    r'points': PropertySchema(
      id: 7,
      name: r'points',
      type: IsarType.long,
    ),
    r'time': PropertySchema(
      id: 8,
      name: r'time',
      type: IsarType.string,
    )
  },
  estimateSize: _gameEstimateSize,
  serialize: _gameSerialize,
  deserialize: _gameDeserialize,
  deserializeProp: _gameDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'BingoCard': BingoCardSchema},
  getId: _gameGetId,
  getLinks: _gameGetLinks,
  attach: _gameAttach,
  version: '3.1.0+1',
);

int _gameEstimateSize(
  Game object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bingoCardList.length * 3;
  {
    final offsets = allOffsets[BingoCard]!;
    for (var i = 0; i < object.bingoCardList.length; i++) {
      final value = object.bingoCardList[i];
      bytesCount += BingoCardSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.date.length * 3;
  bytesCount += 3 + object.hour.length * 3;
  bytesCount += 3 + object.time.length * 3;
  return bytesCount;
}

void _gameSerialize(
  Game object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<BingoCard>(
    offsets[0],
    allOffsets,
    BingoCardSchema.serialize,
    object.bingoCardList,
  );
  writer.writeByte(offsets[1], object.bingoType.index);
  writer.writeString(offsets[2], object.date);
  writer.writeLong(offsets[3], object.gameNumber);
  writer.writeString(offsets[4], object.hour);
  writer.writeBool(offsets[5], object.isAlcool);
  writer.writeLong(offsets[6], object.nbShot);
  writer.writeLong(offsets[7], object.points);
  writer.writeString(offsets[8], object.time);
}

Game _gameDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Game(
    bingoCardList: reader.readObjectList<BingoCard>(
          offsets[0],
          BingoCardSchema.deserialize,
          allOffsets,
          BingoCard(),
        ) ??
        [],
    bingoType: _GamebingoTypeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
        BingoType.plaque,
    date: reader.readString(offsets[2]),
    gameNumber: reader.readLong(offsets[3]),
    hour: reader.readString(offsets[4]),
    id: id,
    isAlcool: reader.readBool(offsets[5]),
    nbShot: reader.readLong(offsets[6]),
    points: reader.readLong(offsets[7]),
    time: reader.readString(offsets[8]),
  );
  return object;
}

P _gameDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<BingoCard>(
            offset,
            BingoCardSchema.deserialize,
            allOffsets,
            BingoCard(),
          ) ??
          []) as P;
    case 1:
      return (_GamebingoTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          BingoType.plaque) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _GamebingoTypeEnumValueMap = {
  'plaque': 0,
  'kta': 1,
  'exploration': 2,
};
const _GamebingoTypeValueEnumMap = {
  0: BingoType.plaque,
  1: BingoType.kta,
  2: BingoType.exploration,
};

Id _gameGetId(Game object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _gameGetLinks(Game object) {
  return [];
}

void _gameAttach(IsarCollection<dynamic> col, Id id, Game object) {
  object.id = id;
}

extension GameQueryWhereSort on QueryBuilder<Game, Game, QWhere> {
  QueryBuilder<Game, Game, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GameQueryWhere on QueryBuilder<Game, Game, QWhereClause> {
  QueryBuilder<Game, Game, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Game, Game, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Game, Game, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GameQueryFilter on QueryBuilder<Game, Game, QFilterCondition> {
  QueryBuilder<Game, Game, QAfterFilterCondition> bingoCardListLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bingoCardList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> bingoCardListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bingoCardList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> bingoCardListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bingoCardList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> bingoCardListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bingoCardList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition>
      bingoCardListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bingoCardList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> bingoCardListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bingoCardList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> bingoTypeEqualTo(
      BingoType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bingoType',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> bingoTypeGreaterThan(
    BingoType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bingoType',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> bingoTypeLessThan(
    BingoType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bingoType',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> bingoTypeBetween(
    BingoType lower,
    BingoType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bingoType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> gameNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gameNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> gameNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gameNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> gameNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gameNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> gameNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gameNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hour',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hour',
        value: '',
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> hourIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hour',
        value: '',
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> isAlcoolEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isAlcool',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> nbShotEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nbShot',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> nbShotGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nbShot',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> nbShotLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nbShot',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> nbShotBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nbShot',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pointsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'points',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pointsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'points',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pointsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'points',
        value: value,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> pointsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'points',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'time',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: '',
      ));
    });
  }

  QueryBuilder<Game, Game, QAfterFilterCondition> timeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'time',
        value: '',
      ));
    });
  }
}

extension GameQueryObject on QueryBuilder<Game, Game, QFilterCondition> {
  QueryBuilder<Game, Game, QAfterFilterCondition> bingoCardListElement(
      FilterQuery<BingoCard> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'bingoCardList');
    });
  }
}

extension GameQueryLinks on QueryBuilder<Game, Game, QFilterCondition> {}

extension GameQuerySortBy on QueryBuilder<Game, Game, QSortBy> {
  QueryBuilder<Game, Game, QAfterSortBy> sortByBingoType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoType', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByBingoTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoType', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByGameNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameNumber', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByGameNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameNumber', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByIsAlcool() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAlcool', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByIsAlcoolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAlcool', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByNbShot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbShot', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByNbShotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbShot', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }
}

extension GameQuerySortThenBy on QueryBuilder<Game, Game, QSortThenBy> {
  QueryBuilder<Game, Game, QAfterSortBy> thenByBingoType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoType', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByBingoTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoType', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByGameNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameNumber', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByGameNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameNumber', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByIsAlcool() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAlcool', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByIsAlcoolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAlcool', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByNbShot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbShot', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByNbShotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbShot', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.desc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<Game, Game, QAfterSortBy> thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }
}

extension GameQueryWhereDistinct on QueryBuilder<Game, Game, QDistinct> {
  QueryBuilder<Game, Game, QDistinct> distinctByBingoType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bingoType');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByGameNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gameNumber');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByHour(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hour', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByIsAlcool() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAlcool');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByNbShot() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nbShot');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'points');
    });
  }

  QueryBuilder<Game, Game, QDistinct> distinctByTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time', caseSensitive: caseSensitive);
    });
  }
}

extension GameQueryProperty on QueryBuilder<Game, Game, QQueryProperty> {
  QueryBuilder<Game, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Game, List<BingoCard>, QQueryOperations>
      bingoCardListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bingoCardList');
    });
  }

  QueryBuilder<Game, BingoType, QQueryOperations> bingoTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bingoType');
    });
  }

  QueryBuilder<Game, String, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> gameNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gameNumber');
    });
  }

  QueryBuilder<Game, String, QQueryOperations> hourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hour');
    });
  }

  QueryBuilder<Game, bool, QQueryOperations> isAlcoolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAlcool');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> nbShotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nbShot');
    });
  }

  QueryBuilder<Game, int, QQueryOperations> pointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'points');
    });
  }

  QueryBuilder<Game, String, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }
}
