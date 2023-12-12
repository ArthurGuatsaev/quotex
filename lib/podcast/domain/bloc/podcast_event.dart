// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'podcast_bloc.dart';

abstract class PodcastEvent extends Equatable {
  const PodcastEvent();

  @override
  List<Object> get props => [];
}

class GetPodcastsEvent extends PodcastEvent {}

class ChangePodcastIndexEvent extends PodcastEvent {
  final int currentIndex;
  const ChangePodcastIndexEvent({
    required this.currentIndex,
  });
}
