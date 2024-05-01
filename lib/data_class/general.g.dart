// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGeneralCollection on Isar {
  IsarCollection<General> get generals => this.collection();
}

const GeneralSchema = CollectionSchema(
  name: r'General',
  id: 3338436836839990578,
  properties: {
    r'bingoChantier': PropertySchema(
      id: 0,
      name: r'bingoChantier',
      type: IsarType.long,
    ),
    r'bingoExplo': PropertySchema(
      id: 1,
      name: r'bingoExplo',
      type: IsarType.long,
    ),
    r'bingoKta': PropertySchema(
      id: 2,
      name: r'bingoKta',
      type: IsarType.long,
    ),
    r'bingoPlaque': PropertySchema(
      id: 3,
      name: r'bingoPlaque',
      type: IsarType.long,
    ),
    r'bingoWin': PropertySchema(
      id: 4,
      name: r'bingoWin',
      type: IsarType.long,
    ),
    r'cardList': PropertySchema(
      id: 5,
      name: r'cardList',
      type: IsarType.objectList,
      target: r'CardList',
    ),
    r'nbGames': PropertySchema(
      id: 6,
      name: r'nbGames',
      type: IsarType.long,
    ),
    r'nbLines': PropertySchema(
      id: 7,
      name: r'nbLines',
      type: IsarType.long,
    ),
    r'nbPoints': PropertySchema(
      id: 8,
      name: r'nbPoints',
      type: IsarType.long,
    )
  },
  estimateSize: _generalEstimateSize,
  serialize: _generalSerialize,
  deserialize: _generalDeserialize,
  deserializeProp: _generalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'CardList': CardListSchema},
  getId: _generalGetId,
  getLinks: _generalGetLinks,
  attach: _generalAttach,
  version: '3.1.0+1',
);

int _generalEstimateSize(
  General object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cardList.length * 3;
  {
    final offsets = allOffsets[CardList]!;
    for (var i = 0; i < object.cardList.length; i++) {
      final value = object.cardList[i];
      bytesCount += CardListSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _generalSerialize(
  General object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bingoChantier);
  writer.writeLong(offsets[1], object.bingoExplo);
  writer.writeLong(offsets[2], object.bingoKta);
  writer.writeLong(offsets[3], object.bingoPlaque);
  writer.writeLong(offsets[4], object.bingoWin);
  writer.writeObjectList<CardList>(
    offsets[5],
    allOffsets,
    CardListSchema.serialize,
    object.cardList,
  );
  writer.writeLong(offsets[6], object.nbGames);
  writer.writeLong(offsets[7], object.nbLines);
  writer.writeLong(offsets[8], object.nbPoints);
}

General _generalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = General();
  object.bingoChantier = reader.readLong(offsets[0]);
  object.bingoExplo = reader.readLong(offsets[1]);
  object.bingoKta = reader.readLong(offsets[2]);
  object.bingoPlaque = reader.readLong(offsets[3]);
  object.bingoWin = reader.readLong(offsets[4]);
  object.cardList = reader.readObjectList<CardList>(
        offsets[5],
        CardListSchema.deserialize,
        allOffsets,
        CardList(),
      ) ??
      [];
  object.id = id;
  object.nbGames = reader.readLong(offsets[6]);
  object.nbLines = reader.readLong(offsets[7]);
  object.nbPoints = reader.readLong(offsets[8]);
  return object;
}

P _generalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readObjectList<CardList>(
            offset,
            CardListSchema.deserialize,
            allOffsets,
            CardList(),
          ) ??
          []) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _generalGetId(General object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _generalGetLinks(General object) {
  return [];
}

void _generalAttach(IsarCollection<dynamic> col, Id id, General object) {
  object.id = id;
}

extension GeneralQueryWhereSort on QueryBuilder<General, General, QWhere> {
  QueryBuilder<General, General, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GeneralQueryWhere on QueryBuilder<General, General, QWhereClause> {
  QueryBuilder<General, General, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<General, General, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<General, General, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<General, General, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<General, General, QAfterWhereClause> idBetween(
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

extension GeneralQueryFilter
    on QueryBuilder<General, General, QFilterCondition> {
  QueryBuilder<General, General, QAfterFilterCondition> bingoChantierEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bingoChantier',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition>
      bingoChantierGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bingoChantier',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoChantierLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bingoChantier',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoChantierBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bingoChantier',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoExploEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bingoExplo',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoExploGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bingoExplo',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoExploLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bingoExplo',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoExploBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bingoExplo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoKtaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bingoKta',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoKtaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bingoKta',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoKtaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bingoKta',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoKtaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bingoKta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoPlaqueEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bingoPlaque',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoPlaqueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bingoPlaque',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoPlaqueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bingoPlaque',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoPlaqueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bingoPlaque',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoWinEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bingoWin',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoWinGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bingoWin',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoWinLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bingoWin',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoWinBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bingoWin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> cardListLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cardList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> cardListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cardList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> cardListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cardList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> cardListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cardList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition>
      cardListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cardList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> cardListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cardList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<General, General, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<General, General, QAfterFilterCondition> idBetween(
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

  QueryBuilder<General, General, QAfterFilterCondition> nbGamesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nbGames',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> nbGamesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nbGames',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> nbGamesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nbGames',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> nbGamesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nbGames',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> nbLinesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nbLines',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> nbLinesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nbLines',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> nbLinesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nbLines',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> nbLinesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nbLines',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> nbPointsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nbPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> nbPointsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nbPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> nbPointsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nbPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> nbPointsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nbPoints',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GeneralQueryObject
    on QueryBuilder<General, General, QFilterCondition> {
  QueryBuilder<General, General, QAfterFilterCondition> cardListElement(
      FilterQuery<CardList> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'cardList');
    });
  }
}

extension GeneralQueryLinks
    on QueryBuilder<General, General, QFilterCondition> {}

extension GeneralQuerySortBy on QueryBuilder<General, General, QSortBy> {
  QueryBuilder<General, General, QAfterSortBy> sortByBingoChantier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoChantier', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoChantierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoChantier', Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoExplo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoExplo', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoExploDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoExplo', Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoKta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoKta', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoKtaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoKta', Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoPlaque() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoPlaque', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoPlaqueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoPlaque', Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoWin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoWin', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoWinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoWin', Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByNbGames() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbGames', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByNbGamesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbGames', Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByNbLines() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbLines', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByNbLinesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbLines', Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByNbPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbPoints', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByNbPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbPoints', Sort.desc);
    });
  }
}

extension GeneralQuerySortThenBy
    on QueryBuilder<General, General, QSortThenBy> {
  QueryBuilder<General, General, QAfterSortBy> thenByBingoChantier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoChantier', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoChantierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoChantier', Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoExplo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoExplo', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoExploDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoExplo', Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoKta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoKta', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoKtaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoKta', Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoPlaque() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoPlaque', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoPlaqueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoPlaque', Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoWin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoWin', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoWinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bingoWin', Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByNbGames() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbGames', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByNbGamesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbGames', Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByNbLines() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbLines', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByNbLinesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbLines', Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByNbPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbPoints', Sort.asc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByNbPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nbPoints', Sort.desc);
    });
  }
}

extension GeneralQueryWhereDistinct
    on QueryBuilder<General, General, QDistinct> {
  QueryBuilder<General, General, QDistinct> distinctByBingoChantier() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bingoChantier');
    });
  }

  QueryBuilder<General, General, QDistinct> distinctByBingoExplo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bingoExplo');
    });
  }

  QueryBuilder<General, General, QDistinct> distinctByBingoKta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bingoKta');
    });
  }

  QueryBuilder<General, General, QDistinct> distinctByBingoPlaque() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bingoPlaque');
    });
  }

  QueryBuilder<General, General, QDistinct> distinctByBingoWin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bingoWin');
    });
  }

  QueryBuilder<General, General, QDistinct> distinctByNbGames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nbGames');
    });
  }

  QueryBuilder<General, General, QDistinct> distinctByNbLines() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nbLines');
    });
  }

  QueryBuilder<General, General, QDistinct> distinctByNbPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nbPoints');
    });
  }
}

extension GeneralQueryProperty
    on QueryBuilder<General, General, QQueryProperty> {
  QueryBuilder<General, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<General, int, QQueryOperations> bingoChantierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bingoChantier');
    });
  }

  QueryBuilder<General, int, QQueryOperations> bingoExploProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bingoExplo');
    });
  }

  QueryBuilder<General, int, QQueryOperations> bingoKtaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bingoKta');
    });
  }

  QueryBuilder<General, int, QQueryOperations> bingoPlaqueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bingoPlaque');
    });
  }

  QueryBuilder<General, int, QQueryOperations> bingoWinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bingoWin');
    });
  }

  QueryBuilder<General, List<CardList>, QQueryOperations> cardListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardList');
    });
  }

  QueryBuilder<General, int, QQueryOperations> nbGamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nbGames');
    });
  }

  QueryBuilder<General, int, QQueryOperations> nbLinesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nbLines');
    });
  }

  QueryBuilder<General, int, QQueryOperations> nbPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nbPoints');
    });
  }
}
