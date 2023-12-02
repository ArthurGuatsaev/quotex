// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTermsModelCollection on Isar {
  IsarCollection<TermsModel> get termsModels => this.collection();
}

const TermsModelSchema = CollectionSchema(
  name: r'TermsModel',
  id: -4838954719763825579,
  properties: {
    r'answears': PropertySchema(
      id: 0,
      name: r'answears',
      type: IsarType.stringList,
    ),
    r'category': PropertySchema(
      id: 1,
      name: r'category',
      type: IsarType.string,
    ),
    r'isFavorite': PropertySchema(
      id: 2,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'rightDescription': PropertySchema(
      id: 4,
      name: r'rightDescription',
      type: IsarType.string,
    ),
    r'wrongDescriptionOne': PropertySchema(
      id: 5,
      name: r'wrongDescriptionOne',
      type: IsarType.string,
    ),
    r'wrongDescriptionThree': PropertySchema(
      id: 6,
      name: r'wrongDescriptionThree',
      type: IsarType.string,
    ),
    r'wrongDescriptionTwo': PropertySchema(
      id: 7,
      name: r'wrongDescriptionTwo',
      type: IsarType.string,
    )
  },
  estimateSize: _termsModelEstimateSize,
  serialize: _termsModelSerialize,
  deserialize: _termsModelDeserialize,
  deserializeProp: _termsModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _termsModelGetId,
  getLinks: _termsModelGetLinks,
  attach: _termsModelAttach,
  version: '3.1.0+1',
);

int _termsModelEstimateSize(
  TermsModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.answears.length * 3;
  {
    for (var i = 0; i < object.answears.length; i++) {
      final value = object.answears[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rightDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.wrongDescriptionOne;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.wrongDescriptionThree;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.wrongDescriptionTwo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _termsModelSerialize(
  TermsModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.answears);
  writer.writeString(offsets[1], object.category);
  writer.writeBool(offsets[2], object.isFavorite);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.rightDescription);
  writer.writeString(offsets[5], object.wrongDescriptionOne);
  writer.writeString(offsets[6], object.wrongDescriptionThree);
  writer.writeString(offsets[7], object.wrongDescriptionTwo);
}

TermsModel _termsModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TermsModel(
    category: reader.readStringOrNull(offsets[1]),
    id: id,
    isFavorite: reader.readBoolOrNull(offsets[2]),
    name: reader.readStringOrNull(offsets[3]),
    rightDescription: reader.readStringOrNull(offsets[4]),
    wrongDescriptionOne: reader.readStringOrNull(offsets[5]),
    wrongDescriptionThree: reader.readStringOrNull(offsets[6]),
    wrongDescriptionTwo: reader.readStringOrNull(offsets[7]),
  );
  return object;
}

P _termsModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _termsModelGetId(TermsModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _termsModelGetLinks(TermsModel object) {
  return [];
}

void _termsModelAttach(IsarCollection<dynamic> col, Id id, TermsModel object) {
  object.id = id;
}

extension TermsModelQueryWhereSort
    on QueryBuilder<TermsModel, TermsModel, QWhere> {
  QueryBuilder<TermsModel, TermsModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TermsModelQueryWhere
    on QueryBuilder<TermsModel, TermsModel, QWhereClause> {
  QueryBuilder<TermsModel, TermsModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<TermsModel, TermsModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterWhereClause> idBetween(
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

extension TermsModelQueryFilter
    on QueryBuilder<TermsModel, TermsModel, QFilterCondition> {
  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      answearsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answears',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      answearsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answears',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      answearsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answears',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      answearsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answears',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      answearsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'answears',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      answearsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'answears',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      answearsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answears',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      answearsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answears',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      answearsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answears',
        value: '',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      answearsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answears',
        value: '',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      answearsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answears',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      answearsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answears',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      answearsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answears',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      answearsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answears',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      answearsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answears',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      answearsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answears',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> categoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      categoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> categoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> categoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> categoryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> categoryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      isFavoriteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isFavorite',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      isFavoriteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isFavorite',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> isFavoriteEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      rightDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rightDescription',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      rightDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rightDescription',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      rightDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rightDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      rightDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rightDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      rightDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rightDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      rightDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rightDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      rightDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rightDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      rightDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rightDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      rightDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rightDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      rightDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rightDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      rightDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rightDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      rightDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rightDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionOneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wrongDescriptionOne',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionOneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wrongDescriptionOne',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionOneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wrongDescriptionOne',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionOneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wrongDescriptionOne',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionOneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wrongDescriptionOne',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionOneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wrongDescriptionOne',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionOneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wrongDescriptionOne',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionOneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wrongDescriptionOne',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionOneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wrongDescriptionOne',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionOneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wrongDescriptionOne',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionOneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wrongDescriptionOne',
        value: '',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionOneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wrongDescriptionOne',
        value: '',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionThreeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wrongDescriptionThree',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionThreeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wrongDescriptionThree',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionThreeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wrongDescriptionThree',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionThreeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wrongDescriptionThree',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionThreeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wrongDescriptionThree',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionThreeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wrongDescriptionThree',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionThreeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wrongDescriptionThree',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionThreeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wrongDescriptionThree',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionThreeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wrongDescriptionThree',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionThreeMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wrongDescriptionThree',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionThreeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wrongDescriptionThree',
        value: '',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionThreeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wrongDescriptionThree',
        value: '',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionTwoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wrongDescriptionTwo',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionTwoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wrongDescriptionTwo',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionTwoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wrongDescriptionTwo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionTwoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wrongDescriptionTwo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionTwoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wrongDescriptionTwo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionTwoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wrongDescriptionTwo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionTwoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wrongDescriptionTwo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionTwoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wrongDescriptionTwo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionTwoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wrongDescriptionTwo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionTwoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wrongDescriptionTwo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionTwoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wrongDescriptionTwo',
        value: '',
      ));
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterFilterCondition>
      wrongDescriptionTwoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wrongDescriptionTwo',
        value: '',
      ));
    });
  }
}

extension TermsModelQueryObject
    on QueryBuilder<TermsModel, TermsModel, QFilterCondition> {}

extension TermsModelQueryLinks
    on QueryBuilder<TermsModel, TermsModel, QFilterCondition> {}

extension TermsModelQuerySortBy
    on QueryBuilder<TermsModel, TermsModel, QSortBy> {
  QueryBuilder<TermsModel, TermsModel, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy> sortByRightDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rightDescription', Sort.asc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy>
      sortByRightDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rightDescription', Sort.desc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy>
      sortByWrongDescriptionOne() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongDescriptionOne', Sort.asc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy>
      sortByWrongDescriptionOneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongDescriptionOne', Sort.desc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy>
      sortByWrongDescriptionThree() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongDescriptionThree', Sort.asc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy>
      sortByWrongDescriptionThreeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongDescriptionThree', Sort.desc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy>
      sortByWrongDescriptionTwo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongDescriptionTwo', Sort.asc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy>
      sortByWrongDescriptionTwoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongDescriptionTwo', Sort.desc);
    });
  }
}

extension TermsModelQuerySortThenBy
    on QueryBuilder<TermsModel, TermsModel, QSortThenBy> {
  QueryBuilder<TermsModel, TermsModel, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy> thenByRightDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rightDescription', Sort.asc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy>
      thenByRightDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rightDescription', Sort.desc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy>
      thenByWrongDescriptionOne() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongDescriptionOne', Sort.asc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy>
      thenByWrongDescriptionOneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongDescriptionOne', Sort.desc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy>
      thenByWrongDescriptionThree() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongDescriptionThree', Sort.asc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy>
      thenByWrongDescriptionThreeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongDescriptionThree', Sort.desc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy>
      thenByWrongDescriptionTwo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongDescriptionTwo', Sort.asc);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QAfterSortBy>
      thenByWrongDescriptionTwoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongDescriptionTwo', Sort.desc);
    });
  }
}

extension TermsModelQueryWhereDistinct
    on QueryBuilder<TermsModel, TermsModel, QDistinct> {
  QueryBuilder<TermsModel, TermsModel, QDistinct> distinctByAnswears() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'answears');
    });
  }

  QueryBuilder<TermsModel, TermsModel, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<TermsModel, TermsModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QDistinct> distinctByRightDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rightDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QDistinct> distinctByWrongDescriptionOne(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wrongDescriptionOne',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QDistinct>
      distinctByWrongDescriptionThree({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wrongDescriptionThree',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TermsModel, TermsModel, QDistinct> distinctByWrongDescriptionTwo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wrongDescriptionTwo',
          caseSensitive: caseSensitive);
    });
  }
}

extension TermsModelQueryProperty
    on QueryBuilder<TermsModel, TermsModel, QQueryProperty> {
  QueryBuilder<TermsModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TermsModel, List<String>, QQueryOperations> answearsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answears');
    });
  }

  QueryBuilder<TermsModel, String?, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<TermsModel, bool?, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<TermsModel, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<TermsModel, String?, QQueryOperations>
      rightDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rightDescription');
    });
  }

  QueryBuilder<TermsModel, String?, QQueryOperations>
      wrongDescriptionOneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wrongDescriptionOne');
    });
  }

  QueryBuilder<TermsModel, String?, QQueryOperations>
      wrongDescriptionThreeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wrongDescriptionThree');
    });
  }

  QueryBuilder<TermsModel, String?, QQueryOperations>
      wrongDescriptionTwoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wrongDescriptionTwo');
    });
  }
}
