import 'package:isar/isar.dart';
part 'lesson.g.dart';

@collection
class Lesson {
  Id? id = Isar.autoIncrement;
  String? title;
  String? image;
  String? description;
  bool? isFavorite;
  @enumerated
  LessonStatus status;
  String? level;
  int? quality;
  Lesson({
    this.id,
    this.title,
    this.quality,
    this.image,
    this.description,
    this.status = LessonStatus.open,
    this.isFavorite,
    this.level,
  });

  Lesson copyWith({
    Id? id,
    String? title,
    String? image,
    LessonStatus? status,
    String? description,
    String? level,
    int? quality,
    bool? isFavorite,
  }) {
    return Lesson(
      id: id ?? this.id,
      quality: quality ?? this.quality,
      title: title ?? this.title,
      image: image ?? this.image,
      status: status ?? this.status,
      description: description ?? this.description,
      level: level ?? this.level,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory Lesson.fromMap(Map<String, dynamic> map) {
    try {
      final image = map['resultImage'];
      final segments = map['resultSegments'] as List<dynamic>;
      final items = segments
          .map(
            (e) => e as Map<String, dynamic>,
          )
          .toList();
      final title = items.first['resultSubTitle'] as String;
      final description = items.first['resultText'] as String;
      const isFavorite = false;
      final level = title.contains('Forex') ? 'Beginners' : 'Advanced';
      final quality = level == 'Beginners' ? 0 : 30;
      return Lesson(
          title: title,
          status: LessonStatus.open,
          image: image,
          description: description,
          isFavorite: isFavorite,
          level: level,
          quality: quality);
    } catch (e) {
      return Lesson(
          title: '',
          image: '',
          description: '',
          level: '',
          isFavorite: false,
          quality: 0,
          status: LessonStatus.open);
    }
  }

  @override
  String toString() =>
      'Lesson(title: $title, image: $image, description: $description)';

  @override
  bool operator ==(covariant Lesson other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.image == image &&
        other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ image.hashCode ^ description.hashCode;

  // List<String> get abc {
  // String init = description ?? '';
  //   List<String> result = [];
  //   for (var i = 0; i < 10; i++) {
  //     int index = init.indexOf('\r\n\r\n');
  //     if (index < 0) break;
  //     String first = init.substring(0, index);
  //     if (init.length > index + 4) index += 4;
  //     init = init.substring(index);
  //     if (first.contains('\n')) first.substring(2);
  //     if (first.length > 20) result.add(first);
  //   }
  //   return result;
  // }
  
}

enum LessonStatus { locked, open, started, finished }
