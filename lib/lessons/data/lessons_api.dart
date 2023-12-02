import 'dart:async';

import 'package:dio/dio.dart';
import 'package:quotex/const/strings.dart';
import 'package:quotex/lessons/domain/model/lesson.dart';

class LessonApiClient {
  static Future<List<Lesson>> getLessons(
      StreamController<String> errorController) async {
    try {
      final x = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 7),
        receiveTimeout: const Duration(seconds: 7),
      ));
      final response = await x.get(
          'https://$apiDomain/api/v2/lessons/?lang=en&token=b19fa3ad-b80f-49c9-9178-00a64cf5b57c');
      if (response.statusCode == 200) {
        final lessons = response.data!['results'] as List<dynamic>;
        final newLesson =
            lessons.map((e) => e as Map<String, dynamic>).toList();
        final list = newLesson.map((e) {
          final term = Lesson.fromMap(e);
          return term;
        }).toList();
        return list;
      }
      return [];
    } on DioException catch (_) {
      errorController.add('No internet connection');
      return [];
    } catch (e) {
      return [];
    }
  }
}
