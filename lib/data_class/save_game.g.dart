// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_game.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CardListSchema = Schema(
  name: r'CardList',
  id: 6760919190412545069,
  properties: {
    r'cardName': PropertySchema(
      id: 0,
      name: r'cardName',
      type: IsarType.string,
    ),
    r'desc': PropertySchema(
      id: 1,
      name: r'desc',
      type: IsarType.string,
    ),
    r'difficulty': PropertySchema(
      id: 2,
      name: r'difficulty',
      type: IsarType.byte,
      enumMap: _CardListdifficultyEnumValueMap,
    ),
    r'nbCheck': PropertySchema(
      id: 3,
      name: r'nbCheck',
      type: IsarType.long,
    ),
    r'nbPlayed': PropertySchema(
      id: 4,
      name: r'nbPlayed',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 5,
      name: r'type',
      type: IsarType.byteList,
      enumMap: _CardListtypeEnumValueMap,
    )
  },
  estimateSize: _cardListEstimateSize,
  serialize: _cardListSerialize,
  deserialize: _cardListDeserialize,
  deserializeProp: _cardListDeserializeProp,
);

int _cardListEstimateSize(
  CardList object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cardName.length * 3;
  bytesCount += 3 + object.desc.length * 3;
  {
    final value = object.type;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  return bytesCount;
}

void _cardListSerialize(
  CardList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cardName);
  writer.writeString(offsets[1], object.desc);
  writer.writeByte(offsets[2], object.difficulty.index);
  writer.writeLong(offsets[3], object.nbCheck);
  writer.writeLong(offsets[4], object.nbPlayed);
  writer.writeByteList(offsets[5], object.type?.map((e) => e.index).toList());
}

CardList _cardListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CardList(
    cardName: reader.readStringOrNull(offsets[0]) ?? "",
    desc: reader.readStringOrNull(offsets[1]) ?? "",
    difficulty:
        _CardListdifficultyValueEnumMap[reader.readByteOrNull(offsets[2])] ??
            Difficulty.unknow,
    nbCheck: reader.readLongOrNull(offsets[3]) ?? 0,
    nbPlayed: reader.readLongOrNull(offsets[4]) ?? 0,
    type: reader
        .readByteList(offsets[5])
        ?.map((e) => _CardListtypeValueEnumMap[e] ?? BingoType.plaque)
        .toList(),
  );
  return object;
}

P _cardListDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 2:
      return (_CardListdifficultyValueEnumMap[reader.readByteOrNull(offset)] ??
          Difficulty.unknow) as P;
    case 3:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 4:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 5:
      return (reader
          .readByteList(offset)
          ?.map((e) => _CardListtypeValueEnumMap[e] ?? BingoType.plaque)
          .toList()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CardListdifficultyEnumValueMap = {
  'easy': 0,
  'medium': 1,
  'hard': 2,
  'unknow': 3,
};
const _CardListdifficultyValueEnumMap = {
  0: Difficulty.easy,
  1: Difficulty.medium,
  2: Difficulty.hard,
  3: Difficulty.unknow,
};
const _CardListtypeEnumValueMap = {
  'plaque': 0,
  'kta': 1,
  'exploration': 2,
  'chantier': 3,
};
const _CardListtypeValueEnumMap = {
  0: BingoType.plaque,
  1: BingoType.kta,
  2: BingoType.exploration,
  3: BingoType.chantier,
};

extension CardListQueryFilter
    on QueryBuilder<CardList, CardList, QFilterCondition> {
  QueryBuilder<CardList, CardList, QAfterFilterCondition> cardNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> cardNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> cardNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> cardNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> cardNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cardName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> cardNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cardName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> cardNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cardName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> cardNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cardName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> cardNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardName',
        value: '',
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> cardNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cardName',
        value: '',
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> descEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> descGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> descLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> descBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'desc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> descStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> descEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> descContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'desc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> descMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'desc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> descIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desc',
        value: '',
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> descIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'desc',
        value: '',
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> difficultyEqualTo(
      Difficulty value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'difficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> difficultyGreaterThan(
    Difficulty value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'difficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> difficultyLessThan(
    Difficulty value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'difficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> difficultyBetween(
    Difficulty lower,
    Difficulty upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'difficulty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> nbCheckEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nbCheck',
        value: value,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> nbCheckGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nbCheck',
        value: value,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> nbCheckLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nbCheck',
        value: value,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> nbCheckBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nbCheck',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> nbPlayedEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nbPlayed',
        value: value,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> nbPlayedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nbPlayed',
        value: value,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> nbPlayedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nbPlayed',
        value: value,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> nbPlayedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nbPlayed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> typeElementEqualTo(
      BingoType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition>
      typeElementGreaterThan(
    BingoType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> typeElementLessThan(
    BingoType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> typeElementBetween(
    BingoType lower,
    BingoType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> typeLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'type',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'type',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'type',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> typeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'type',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> typeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'type',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CardList, CardList, QAfterFilterCondition> typeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'type',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension CardListQueryObject
    on QueryBuilder<CardList, CardList, QFilterCondition> {}
