// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetGeneralCollection on Isar {
  IsarCollection<int, General> get generals => this.collection();
}

const GeneralSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'General',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'nbGames',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'bingoPlaque',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'bingoKta',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'bingoExplo',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'bingoWin',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'bingoAlcool',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'cardList',
        type: IsarType.objectList,
        target: 'CardList',
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, General>(
    serialize: serializeGeneral,
    deserialize: deserializeGeneral,
    deserializeProperty: deserializeGeneralProp,
  ),
  embeddedSchemas: [CardListSchema],
);

@isarProtected
int serializeGeneral(IsarWriter writer, General object) {
  IsarCore.writeLong(writer, 1, object.nbGames);
  IsarCore.writeLong(writer, 2, object.bingoPlaque);
  IsarCore.writeLong(writer, 3, object.bingoKta);
  IsarCore.writeLong(writer, 4, object.bingoExplo);
  IsarCore.writeLong(writer, 5, object.bingoWin);
  IsarCore.writeLong(writer, 6, object.bingoAlcool);
  {
    final list = object.cardList;
    final listWriter = IsarCore.beginList(writer, 7, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeCardList(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  return object.id;
}

@isarProtected
General deserializeGeneral(IsarReader reader) {
  final object = General();
  object.id = IsarCore.readId(reader);
  object.nbGames = IsarCore.readLong(reader, 1);
  object.bingoPlaque = IsarCore.readLong(reader, 2);
  object.bingoKta = IsarCore.readLong(reader, 3);
  object.bingoExplo = IsarCore.readLong(reader, 4);
  object.bingoWin = IsarCore.readLong(reader, 5);
  object.bingoAlcool = IsarCore.readLong(reader, 6);
  {
    final length = IsarCore.readList(reader, 7, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        object.cardList = const <CardList>[];
      } else {
        final list = List<CardList>.filled(length, CardList(), growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = CardList();
            } else {
              final embedded = deserializeCardList(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        object.cardList = list;
      }
    }
  }
  return object;
}

@isarProtected
dynamic deserializeGeneralProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readLong(reader, 1);
    case 2:
      return IsarCore.readLong(reader, 2);
    case 3:
      return IsarCore.readLong(reader, 3);
    case 4:
      return IsarCore.readLong(reader, 4);
    case 5:
      return IsarCore.readLong(reader, 5);
    case 6:
      return IsarCore.readLong(reader, 6);
    case 7:
      {
        final length = IsarCore.readList(reader, 7, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <CardList>[];
          } else {
            final list =
                List<CardList>.filled(length, CardList(), growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = CardList();
                } else {
                  final embedded = deserializeCardList(objectReader);
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
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _GeneralUpdate {
  bool call({
    required int id,
    int? nbGames,
    int? bingoPlaque,
    int? bingoKta,
    int? bingoExplo,
    int? bingoWin,
    int? bingoAlcool,
  });
}

class _GeneralUpdateImpl implements _GeneralUpdate {
  const _GeneralUpdateImpl(this.collection);

  final IsarCollection<int, General> collection;

  @override
  bool call({
    required int id,
    Object? nbGames = ignore,
    Object? bingoPlaque = ignore,
    Object? bingoKta = ignore,
    Object? bingoExplo = ignore,
    Object? bingoWin = ignore,
    Object? bingoAlcool = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (nbGames != ignore) 1: nbGames as int?,
          if (bingoPlaque != ignore) 2: bingoPlaque as int?,
          if (bingoKta != ignore) 3: bingoKta as int?,
          if (bingoExplo != ignore) 4: bingoExplo as int?,
          if (bingoWin != ignore) 5: bingoWin as int?,
          if (bingoAlcool != ignore) 6: bingoAlcool as int?,
        }) >
        0;
  }
}

sealed class _GeneralUpdateAll {
  int call({
    required List<int> id,
    int? nbGames,
    int? bingoPlaque,
    int? bingoKta,
    int? bingoExplo,
    int? bingoWin,
    int? bingoAlcool,
  });
}

class _GeneralUpdateAllImpl implements _GeneralUpdateAll {
  const _GeneralUpdateAllImpl(this.collection);

  final IsarCollection<int, General> collection;

  @override
  int call({
    required List<int> id,
    Object? nbGames = ignore,
    Object? bingoPlaque = ignore,
    Object? bingoKta = ignore,
    Object? bingoExplo = ignore,
    Object? bingoWin = ignore,
    Object? bingoAlcool = ignore,
  }) {
    return collection.updateProperties(id, {
      if (nbGames != ignore) 1: nbGames as int?,
      if (bingoPlaque != ignore) 2: bingoPlaque as int?,
      if (bingoKta != ignore) 3: bingoKta as int?,
      if (bingoExplo != ignore) 4: bingoExplo as int?,
      if (bingoWin != ignore) 5: bingoWin as int?,
      if (bingoAlcool != ignore) 6: bingoAlcool as int?,
    });
  }
}

extension GeneralUpdate on IsarCollection<int, General> {
  _GeneralUpdate get update => _GeneralUpdateImpl(this);

  _GeneralUpdateAll get updateAll => _GeneralUpdateAllImpl(this);
}

sealed class _GeneralQueryUpdate {
  int call({
    int? nbGames,
    int? bingoPlaque,
    int? bingoKta,
    int? bingoExplo,
    int? bingoWin,
    int? bingoAlcool,
  });
}

class _GeneralQueryUpdateImpl implements _GeneralQueryUpdate {
  const _GeneralQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<General> query;
  final int? limit;

  @override
  int call({
    Object? nbGames = ignore,
    Object? bingoPlaque = ignore,
    Object? bingoKta = ignore,
    Object? bingoExplo = ignore,
    Object? bingoWin = ignore,
    Object? bingoAlcool = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (nbGames != ignore) 1: nbGames as int?,
      if (bingoPlaque != ignore) 2: bingoPlaque as int?,
      if (bingoKta != ignore) 3: bingoKta as int?,
      if (bingoExplo != ignore) 4: bingoExplo as int?,
      if (bingoWin != ignore) 5: bingoWin as int?,
      if (bingoAlcool != ignore) 6: bingoAlcool as int?,
    });
  }
}

extension GeneralQueryUpdate on IsarQuery<General> {
  _GeneralQueryUpdate get updateFirst =>
      _GeneralQueryUpdateImpl(this, limit: 1);

  _GeneralQueryUpdate get updateAll => _GeneralQueryUpdateImpl(this);
}

class _GeneralQueryBuilderUpdateImpl implements _GeneralQueryUpdate {
  const _GeneralQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<General, General, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? nbGames = ignore,
    Object? bingoPlaque = ignore,
    Object? bingoKta = ignore,
    Object? bingoExplo = ignore,
    Object? bingoWin = ignore,
    Object? bingoAlcool = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (nbGames != ignore) 1: nbGames as int?,
        if (bingoPlaque != ignore) 2: bingoPlaque as int?,
        if (bingoKta != ignore) 3: bingoKta as int?,
        if (bingoExplo != ignore) 4: bingoExplo as int?,
        if (bingoWin != ignore) 5: bingoWin as int?,
        if (bingoAlcool != ignore) 6: bingoAlcool as int?,
      });
    } finally {
      q.close();
    }
  }
}

extension GeneralQueryBuilderUpdate
    on QueryBuilder<General, General, QOperations> {
  _GeneralQueryUpdate get updateFirst =>
      _GeneralQueryBuilderUpdateImpl(this, limit: 1);

  _GeneralQueryUpdate get updateAll => _GeneralQueryBuilderUpdateImpl(this);
}

extension GeneralQueryFilter
    on QueryBuilder<General, General, QFilterCondition> {
  QueryBuilder<General, General, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<General, General, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<General, General, QAfterFilterCondition> idGreaterThanOrEqualTo(
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

  QueryBuilder<General, General, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<General, General, QAfterFilterCondition> idLessThanOrEqualTo(
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

  QueryBuilder<General, General, QAfterFilterCondition> idBetween(
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

  QueryBuilder<General, General, QAfterFilterCondition> nbGamesEqualTo(
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

  QueryBuilder<General, General, QAfterFilterCondition> nbGamesGreaterThan(
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

  QueryBuilder<General, General, QAfterFilterCondition>
      nbGamesGreaterThanOrEqualTo(
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

  QueryBuilder<General, General, QAfterFilterCondition> nbGamesLessThan(
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

  QueryBuilder<General, General, QAfterFilterCondition>
      nbGamesLessThanOrEqualTo(
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

  QueryBuilder<General, General, QAfterFilterCondition> nbGamesBetween(
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

  QueryBuilder<General, General, QAfterFilterCondition> bingoPlaqueEqualTo(
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

  QueryBuilder<General, General, QAfterFilterCondition> bingoPlaqueGreaterThan(
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

  QueryBuilder<General, General, QAfterFilterCondition>
      bingoPlaqueGreaterThanOrEqualTo(
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

  QueryBuilder<General, General, QAfterFilterCondition> bingoPlaqueLessThan(
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

  QueryBuilder<General, General, QAfterFilterCondition>
      bingoPlaqueLessThanOrEqualTo(
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

  QueryBuilder<General, General, QAfterFilterCondition> bingoPlaqueBetween(
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

  QueryBuilder<General, General, QAfterFilterCondition> bingoKtaEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoKtaGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition>
      bingoKtaGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoKtaLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition>
      bingoKtaLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoKtaBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoExploEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoExploGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition>
      bingoExploGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoExploLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition>
      bingoExploLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoExploBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoWinEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoWinGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition>
      bingoWinGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoWinLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition>
      bingoWinLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoWinBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoAlcoolEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoAlcoolGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition>
      bingoAlcoolGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoAlcoolLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition>
      bingoAlcoolLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> bingoAlcoolBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<General, General, QAfterFilterCondition> cardListIsEmpty() {
    return not().cardListIsNotEmpty();
  }

  QueryBuilder<General, General, QAfterFilterCondition> cardListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 7, value: null),
      );
    });
  }
}

extension GeneralQueryObject
    on QueryBuilder<General, General, QFilterCondition> {}

extension GeneralQuerySortBy on QueryBuilder<General, General, QSortBy> {
  QueryBuilder<General, General, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByNbGames() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByNbGamesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoPlaque() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoPlaqueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoKta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoKtaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoExplo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoExploDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoWin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoWinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoAlcool() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> sortByBingoAlcoolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }
}

extension GeneralQuerySortThenBy
    on QueryBuilder<General, General, QSortThenBy> {
  QueryBuilder<General, General, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByNbGames() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByNbGamesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoPlaque() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoPlaqueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoKta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoKtaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoExplo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoExploDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoWin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoWinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoAlcool() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<General, General, QAfterSortBy> thenByBingoAlcoolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }
}

extension GeneralQueryWhereDistinct
    on QueryBuilder<General, General, QDistinct> {
  QueryBuilder<General, General, QAfterDistinct> distinctByNbGames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<General, General, QAfterDistinct> distinctByBingoPlaque() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<General, General, QAfterDistinct> distinctByBingoKta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }

  QueryBuilder<General, General, QAfterDistinct> distinctByBingoExplo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }

  QueryBuilder<General, General, QAfterDistinct> distinctByBingoWin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }

  QueryBuilder<General, General, QAfterDistinct> distinctByBingoAlcool() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6);
    });
  }
}

extension GeneralQueryProperty1 on QueryBuilder<General, General, QProperty> {
  QueryBuilder<General, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<General, int, QAfterProperty> nbGamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<General, int, QAfterProperty> bingoPlaqueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<General, int, QAfterProperty> bingoKtaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<General, int, QAfterProperty> bingoExploProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<General, int, QAfterProperty> bingoWinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<General, int, QAfterProperty> bingoAlcoolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<General, List<CardList>, QAfterProperty> cardListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

extension GeneralQueryProperty2<R> on QueryBuilder<General, R, QAfterProperty> {
  QueryBuilder<General, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<General, (R, int), QAfterProperty> nbGamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<General, (R, int), QAfterProperty> bingoPlaqueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<General, (R, int), QAfterProperty> bingoKtaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<General, (R, int), QAfterProperty> bingoExploProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<General, (R, int), QAfterProperty> bingoWinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<General, (R, int), QAfterProperty> bingoAlcoolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<General, (R, List<CardList>), QAfterProperty>
      cardListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

extension GeneralQueryProperty3<R1, R2>
    on QueryBuilder<General, (R1, R2), QAfterProperty> {
  QueryBuilder<General, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<General, (R1, R2, int), QOperations> nbGamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<General, (R1, R2, int), QOperations> bingoPlaqueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<General, (R1, R2, int), QOperations> bingoKtaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<General, (R1, R2, int), QOperations> bingoExploProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<General, (R1, R2, int), QOperations> bingoWinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<General, (R1, R2, int), QOperations> bingoAlcoolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<General, (R1, R2, List<CardList>), QOperations>
      cardListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}
