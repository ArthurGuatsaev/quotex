import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotex/podcast/domain/model/podcast_model.dart';
import 'package:quotex/podcast/domain/repository/podcast_repository.dart';

part 'podcast_event.dart';
part 'podcast_state.dart';

class PodcastBloc extends Bloc<PodcastEvent, PodcastState> {
  final PodcastRepository podRepo;
  PodcastBloc({required this.podRepo}) : super(const PodcastState()) {
    on<GetPodcastsEvent>(getPodcast);
    on<ChangePodcastIndexEvent>(changePodcast);
  }
  getPodcast(GetPodcastsEvent event, Emitter<PodcastState> emit) async {
    final podcast = await podRepo.getPodcast();
    emit(state.copyWith(podcasts: podcast));
  }

  changePodcast(
      ChangePodcastIndexEvent event, Emitter<PodcastState> emit) async {
    if (event.currentIndex < 0 ||
        event.currentIndex >= state.podcasts.length - 1) {
      return;
    }
    emit(state.copyWith(currentIndex: event.currentIndex));
  }
}
