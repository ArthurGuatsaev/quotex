import 'dart:async';

import 'package:dio/dio.dart';
import 'package:quotex/const/strings.dart';
import 'package:quotex/podcast/domain/model/podcast_model.dart';

class ApiClientPodcast {
  static getPodcast({required StreamController<String> errorController}) async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'https://$apiDomain/api/v2/podcasts?token=$apiToken');
      if (response.statusCode == 200) {
        final map = response.data!['rows'] as List<dynamic>;
        return map
            .map((e) => PodcastModel.fromMap(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      errorController.add('No internet connection');
      return [];
    }
  }
}
