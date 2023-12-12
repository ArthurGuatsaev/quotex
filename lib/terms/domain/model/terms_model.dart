import 'package:isar/isar.dart';
part 'terms_model.g.dart';

@collection
class TermsModel {
  TermsModel({
    this.id,
    this.name,
    this.rightDescription,
    this.wrongDescriptionOne,
    this.wrongDescriptionTwo,
    this.wrongDescriptionThree,
    this.isFavorite,
    this.date,
    this.category,
  });
  Id? id = Isar.autoIncrement;
  String? name;
  String? rightDescription;
  String? wrongDescriptionOne;
  String? wrongDescriptionTwo;
  String? wrongDescriptionThree;
  bool? isFavorite;
  String? category;
  DateTime? date;

  TermsModel copyWith({
    int? id,
    String? name,
    DateTime? date,
    String? rightDescription,
    String? wrongDescriptionOne,
    String? wrongDescriptionTwo,
    String? wrongDescriptionThree,
    bool? isFavorite,
    String? category,
  }) {
    return TermsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      rightDescription: rightDescription ?? this.rightDescription,
      wrongDescriptionOne: wrongDescriptionOne ?? this.wrongDescriptionOne,
      wrongDescriptionTwo: wrongDescriptionTwo ?? this.wrongDescriptionTwo,
      wrongDescriptionThree:
          wrongDescriptionThree ?? this.wrongDescriptionThree,
      isFavorite: isFavorite ?? this.isFavorite,
      category: category ?? this.category,
    );
  }

  @ignore
  List<String> get answears {
    final list = [
      name!,
      wrongDescriptionOne!,
      wrongDescriptionTwo!,
      wrongDescriptionThree!
    ];
    list.shuffle();
    return list;
  }
}
