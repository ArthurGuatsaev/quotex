import 'dart:async';

import 'package:quotex/loading/domain/model/loading_model.dart';
import 'package:quotex/podcast/data/api_podcast.dart';
import 'package:quotex/podcast/domain/model/podcast_model.dart';

class PodcastRepository {
  final StreamController<String> errorController;
  List<PodcastModel>? podcasts;

  PodcastRepository({required this.errorController});
  Future<List<PodcastModel>> getPodcast(
      {StreamController<VLoading>? controller}) async {
    if (podcasts != null) {
      return podcasts!;
    }
    podcasts =
        await ApiClientPodcast.getPodcast(errorController: errorController) ??
            [];
    controller?.add(VLoading.podcast);
    return podcasts!;
  }
}
