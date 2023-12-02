import 'dart:async';

import 'package:isar/isar.dart';
import 'package:quotex/lessons/data/lessons_api.dart';
import 'package:quotex/lessons/domain/model/lesson.dart';
import 'package:quotex/loading/domain/model/loading_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LessonsRepo with VSharedPrefLesson {
  final Isar isar;
  final StreamController<String> errorController;
  LessonsRepo({required this.errorController, required this.isar});
  List<Lesson>? lessons;
  Future<List<Lesson>> getLessons(
      {StreamController<VLoading>? controller}) async {
    lessons = await getLessonHistory();
    if (lessons == null || lessons!.isEmpty) {
      lessons = await LessonApiClient.getLessons(errorController);
      if (lessons != null && lessons!.isNotEmpty) {
        await isar.writeTxn(() async {
          await isar.lessons.putAll(lessons!);
        });
      }
    }
    controller == null ? null : controller.add(VLoading.lessons);
    return lessons ?? [];
  }

  Future<List<Lesson>> getLessonHistory() async {
    return await isar.lessons.where().findAll();
  }

  Future<void> resete() async {
    await isar.writeTxn(() async {
      await isar.lessons.clear();
    });
    await sharedReset();
  }

  Future<void> saveLesson(Lesson lesson) async {
    await isar.writeTxn(() async {
      await isar.lessons.put(lesson);
    });
  }

  Future<void> deleteLesson(Lesson lesson) async {
    await isar.writeTxn(() async {
      await isar.lessons.delete(lesson.id!);
    });
  }

  List<Lesson> finishedLesson(List<Lesson> les, Lesson lesson) {
    final lessons = les.map((e) {
      if (e.id == lesson.id) {
        return lesson;
      }
      return e;
    }).toList();
    return lessons;
  }

  List<Lesson> favorLesson(List<Lesson> les, Lesson lesson) {
    final lessons = les.map((e) {
      if (e.id == lesson.id) {
        final newLesson = lesson;
        return newLesson;
      }
      return e;
    }).toList();

    return lessons;
  }

  List<Lesson> startedLesson(List<Lesson> les, Lesson lesson) {
    final lessons = les.map((e) {
      if (e.id == lesson.id) {
        final newLesson = e.copyWith(status: LessonStatus.started);
        print(newLesson.status);
        return newLesson;
      }
      return e;
    }).toList();
    return lessons;
  }
}

mixin VSharedPrefLesson {
  final String p = 'poind';
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();
  Future<void> setPoint(int point) async {
    (await prefs).setInt(p, point);
  }

  Future<int> getPoint() async {
    return (await prefs).getInt(p) ?? 15;
  }

  Future<void> sharedReset() async {
    (await prefs).setInt(p, 20);
    (await prefs).remove('tests');
  }
}
