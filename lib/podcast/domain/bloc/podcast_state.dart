// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'podcast_bloc.dart';

class PodcastState {
  final List<PodcastModel> podcasts;
  final int currentIndex;
  const PodcastState({this.podcasts = const [], this.currentIndex = 0});

  PodcastState copyWith({
    List<PodcastModel>? podcasts,
    int? currentIndex,
  }) {
    return PodcastState(
      podcasts: podcasts ?? this.podcasts,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
