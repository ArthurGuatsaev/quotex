import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:quotex/lessons/domain/lessons_repo.dart';
import 'package:quotex/loading/domain/model/failed_model.dart';
import 'package:quotex/loading/domain/model/loading_model.dart';
import 'package:quotex/loading/domain/repositories/check_repo.dart';
import 'package:quotex/loading/domain/repositories/loading_repo.dart';
import 'package:quotex/loading/domain/repositories/remote_confige.dart';
import 'package:quotex/loading/domain/repositories/services_repo.dart';
import 'package:quotex/nav_manager.dart';
import 'package:quotex/podcast/domain/repository/podcast_repository.dart';
import 'package:quotex/terms/domain/repo/terms_repository.dart';

part 'load_event.dart';
part 'load_state.dart';

class LoadBloc extends Bloc<LoadEvent, LoadState> {
  final StreamController<VLoading> controller = StreamController();
  LoadingRepo? loadingRepo;
  FirebaseRemote? firebaseRemote;
  MyCheckRepo? checkRepo;
  LessonsRepo? lessonRepo;
  VServices? servicesRepo;
  VTermsRepository? termsRepository;
  PodcastRepository? podcastRepository;
  LoadBloc({
    this.loadingRepo,
    this.firebaseRemote,
    this.checkRepo,
    this.servicesRepo,
    this.podcastRepository,
    this.termsRepository,
    this.lessonRepo,
  }) : super(LoadState()) {
    controller.stream.listen(
      (event) {
        print(event);
        add(LoadingProgressEvent(event: event));
      },
    );
    on<OnBoardCheckEvent>(onOnboardInit);
    on<FirebaseRemoteInitEvent>(onFirebaseRemoteInit);
    on<CheckRepoInitEvent>(onCheckRepoInit);
    on<LessonsRepoInitEvent>(onLessonsRepoInit);
    on<LoadingProgressEvent>(onLoadingProgressEvent);
    on<ChangeOnbIndicatorEvent>(onChangeOnbIndicatorIndex);
    on<TermRepoInitEvent>(onTermRepoInit);
    on<PodcastRepoInitEvent>(onPodcastRepoInit);
  }
  onLoadingProgressEvent(
      LoadingProgressEvent event, Emitter<LoadState> emit) async {
    final loadList = [...state.loadingList];
    loadList.add(event.event);
    emit(state.copyWith(loadingList: loadList));
    if (loadList.length == 3) {
      if (loadList.contains(VLoading.firstShowTrue)) {
        MyNavigatorManager.instance.homePush();
        MyNavigatorManager.instance.unworkBPush();
      } else {
        MyNavigatorManager.instance.homePush();
      }
      // final url = firebaseRemote?.url ?? 'https://youtube.com/';
      // final tg = firebaseRemote?.tg ?? 'https://telegram.com/';
      // if (state.loadingList.contains(VLoading.finanseModeTrue)) {
      //   if (state.loadingList.contains(VLoading.firstShowTrue)) {
      //     MyNavigatorManager.instance.finPush(url);
      //     MyNavigatorManager.instance.workBPush(tg);
      //   } else {
      //     MyNavigatorManager.instance.finPush(url);
      //     if (state.loadingList.contains(VLoading.tgTrue)) {
      //       MyNavigatorManager.instance.telegaPush(telegaParam(tg));
      //     }
      //   }
      // } else {
      //   if (state.loadingList.contains(VLoading.firstShowTrue)) {
      //     MyNavigatorManager.instance.homePush();
      //     MyNavigatorManager.instance.unworkBPush();
      //   } else {
      //     MyNavigatorManager.instance.homePush();
      //   }
      // }
    }
  }

  onOnboardInit(OnBoardCheckEvent event, Emitter<LoadState> emit) async {
    if (loadingRepo == null) return;
    try {
      await loadingRepo!.getIsFirstShow(controller: controller);
      await loadingRepo!.isFinanseMode(
          isDead: event.isDead,
          controller: controller,
          isChargh: event.isChargh,
          isVpn: event.isVpn,
          procentChargh: event.procentChargh,
          udid: event.udid);
      if (state.loadingList.contains(VLoading.finanseModeFalse)) {
        await servicesRepo!.logAmplitude();
      }
    } catch (e) {
      emit(state.copyWith(
          status: StatusLoadState.failed,
          failed: const VFailed(message: 'No internet connection')));
    }
  }

  onFirebaseRemoteInit(
      FirebaseRemoteInitEvent event, Emitter<LoadState> emit) async {
    try {
      if (firebaseRemote == null) return;
      await servicesRepo!.initApphud(controller: controller);
      // await servicesRepo!.initOneSignal(controller: controller);
      await servicesRepo!.initAmplitude(controller: controller);
      await firebaseRemote!.initialize(
          streamController: controller, userId: servicesRepo!.userId);
      add(CheckRepoInitEvent(
        isDead: firebaseRemote!.isDead,
      ));
    } catch (e) {
      emit(state.copyWith(
          status: StatusLoadState.failed,
          failed: const VFailed(message: 'No internet connection')));
    }
  }

  onCheckRepoInit(CheckRepoInitEvent event, Emitter<LoadState> emit) async {
    if (checkRepo == null) return;
    try {
      await checkRepo!.checkBattery(streamController: controller);
      await checkRepo!.checkVpn(streamController: controller);
      await checkRepo!.checkDeviceInfo(streamController: controller);
      add(OnBoardCheckEvent(
          isDead: event.isDead,
          isChargh: checkRepo!.isChargh ?? false,
          isVpn: checkRepo!.isVpn!,
          procentChargh: checkRepo!.procentChargh ?? 70,
          udid: checkRepo!.udid!));
    } catch (_) {
      // print('check error');
    }
  }

  onLessonsRepoInit(LessonsRepoInitEvent event, Emitter<LoadState> emit) async {
    await loadingRepo!.getIsFirstShow(controller: controller); // this is delete
    if (lessonRepo == null) return;
    try {
      await lessonRepo!.getLessons(controller: controller);
    } catch (_) {}
  }

  onTermRepoInit(TermRepoInitEvent event, Emitter<LoadState> emit) async {
    if (lessonRepo == null) return;
    try {
      await termsRepository!.getSelectedHistory(controller: controller);
    } catch (_) {}
  }

  onPodcastRepoInit(PodcastRepoInitEvent event, Emitter<LoadState> emit) async {
    if (podcastRepository == null) return;
    try {
      await podcastRepository!.getPodcast(controller: controller);
    } catch (_) {}
  }

  onChangeOnbIndicatorIndex(
      ChangeOnbIndicatorEvent event, Emitter<LoadState> emit) {
    emit(state.copyWith(onboardIndex: event.index));
  }
}
