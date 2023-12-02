import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quotex/const/strings.dart';
import 'package:quotex/nav_manager.dart';
import 'package:quotex/terms/domain/model/terms_model.dart';
import 'package:quotex/terms/domain/repo/terms_repository.dart';
import 'package:quotex/terms/domain/view_model/terms_vm.dart';
import 'package:quotex/terms/domain/view_model/test_vm.dart';

part 'term_event.dart';
part 'term_state.dart';

class TermsBloc extends Bloc<TermsEvent, TermsState> {
  final VTermsRepository repository;

  Timer? timer;
  TermsBloc({required this.repository})
      : super(TermsState(
            model: TermsViewModel(
                lastTerms: trading.first,
                testModel: VTestViewModel(date: DateTime.now())))) {
    on<GetTermsModelEvent>(onGetTermsModel);
    on<MixedTermsEvent>(onMixedTerms);
    on<RememberedTermEvent>(onRememberedTerm);
    on<AddFavorTermEvent>(onAddFavorTerm);
    on<GetHistoryTermEvent>(onGetHistoryTerm);
    on<AgainTermEvent>(onAgainTerm);
    on<ChangeLastTermEvent>(onChangeLastTerm);
    on<RemoveFavoriteEvent>(onRemoveFavorTerm);
    on<ChangeTestTimeEvent>(onChangeTestTime);
    on<ChangeTestEntityEvent>(onChangeTestEntity);
    on<StartTestEvent>(onStartTest);
    on<StopTestEvent>(onStopTest);
    on<AddAnswearEvent>(onAddAnswear);
    on<ResetTestEvent>(onTestReset);
    on<GetTestCountEvent>(onGetTestCount);
    on<ResetFavoriteEvent>(resetAllFavorTerm);
    on<GetHistoryFirstEvent>(onGetHistoryTermFirst);
    on<CountIncrementEvent>(countIncrement);
    on<ChangeActiveTermsEvent>(onChangeActiveTerms);
    on<SkipQuestionEvent>(onSkipQuestion);
  }
  onChangeActiveTerms(ChangeActiveTermsEvent event, Emitter<TermsState> emit) {
    final model = state.model.chooseActive(event.category);
    emit(state.copyWith(model: model));
  }

  onGetTermsModel(GetTermsModelEvent event, Emitter<TermsState> emit) {
    final model = repository.getModel();
    emit(state.copyWith(model: model));
  }

  onMixedTerms(MixedTermsEvent event, Emitter<TermsState> emit) {
    final model = state.model.mixed();
    emit(state.copyWith(model: model));
  }

  onRememberedTerm(RememberedTermEvent event, Emitter<TermsState> emit) {
    final list = repository.noRemember(
        fogot: state.model.fogotenTerms, term: event.term);
    final model = state.model.noRemember(list);
    emit(state.copyWith(model: model));
  }

  onAgainTerm(AgainTermEvent event, Emitter<TermsState> emit) {
    final model = state.model.againtIteration();
    emit(state.copyWith(model: model));
  }

  onAddFavorTerm(AddFavorTermEvent event, Emitter<TermsState> emit) async {
    await repository.saveTerm(event.term);
    add(GetHistoryTermEvent());
  }

  onRemoveFavorTerm(RemoveFavoriteEvent event, Emitter<TermsState> emit) async {
    await repository.deleteTerm(event.term);
    add(GetHistoryTermEvent());
  }

  resetAllFavorTerm(ResetFavoriteEvent event, Emitter<TermsState> emit) async {
    await repository.resete();
    add(GetHistoryTermEvent());
  }

  onGetHistoryTermFirst(GetHistoryFirstEvent event, Emitter<TermsState> emit) {
    final history = repository.terms ?? [];
    final model = state.model.favorite(history);
    emit(state.copyWith(model: model));
  }

  onGetHistoryTerm(GetHistoryTermEvent event, Emitter<TermsState> emit) async {
    final history = await repository.getSelectedHistory();
    final model = state.model.favorite(history);
    emit(state.copyWith(model: model));
  }

  onChangeTestTime(ChangeTestTimeEvent event, Emitter<TermsState> emit) async {
    final model = state.model.timeChange(event.duration, DateTime.now());
    emit(state.copyWith(model: model));
  }

  onChangeTestEntity(
      ChangeTestEntityEvent event, Emitter<TermsState> emit) async {
    final model = state.model.entityChange(event.entity);
    emit(state.copyWith(model: model));
  }

  onChangeLastTerm(ChangeLastTermEvent event, Emitter<TermsState> emit) async {
    final model = state.model.changeLastTerm(event.term);
    emit(state.copyWith(model: model));
  }

  onStartTest(StartTestEvent event, Emitter<TermsState> emit) async {
    final testList = repository.startTest(
        state.model.favoriteTerms, state.model.testModel.entity);
    emit(state.copyWith(model: state.model.startTest(testList)));
    timer = Timer(Duration(seconds: state.model.testModel.duration), () {
      add(StopTestEvent());
    });
  }

  onStopTest(StopTestEvent event, Emitter<TermsState> emit) async {
    if (timer != null) {
      timer!.cancel();
    }
    if (repository.stopTest(state.model.testModel)) {
      emit(state.copyWith(
          model: state.model.copyWith(
              testModel:
                  state.model.testModel.copyWith(status: TestStatus.win))));
      await repository.setTestCount();
      MyNavigatorManager.instance.winPush();
    } else {
      emit(state.copyWith(
          model: state.model.copyWith(
              testModel:
                  state.model.testModel.copyWith(status: TestStatus.lose))));
      MyNavigatorManager.instance.losePush();
    }
    add(CountIncrementEvent());
  }

  countIncrement(CountIncrementEvent event, Emitter<TermsState> emit) async {
    final count = await repository.getCount();
    emit(state.copyWith(count: count));
  }

  onTestReset(ResetTestEvent event, Emitter<TermsState> emit) async {
    if (timer != null) {
      timer!.cancel();
    }
    final model = state.model.resetTest();
    emit(state.copyWith(model: model));
  }

  onSkipQuestion(SkipQuestionEvent event, Emitter<TermsState> emit) {
    final h = repository.skipQuestion(event.time, state.model.testModel);
    if (h < 0) {
      add(StopTestEvent());
    } else {
      final testModel = state.model.testModel.skipQuestion(h);
      emit(state.copyWith(model: state.model.copyWith(testModel: testModel)));
    }
  }

  onAddAnswear(AddAnswearEvent event, Emitter<TermsState> emit) {
    final test = repository.addTestAnswear(
        test: state.model.testModel, answear: event.result);
    final model = state.model.addTestAnsear(test);
    emit(state.copyWith(model: model));
    add(CountIncrementEvent());
  }

  onGetTestCount(GetTestCountEvent event, Emitter<TermsState> emit) async {
    final count = repository.count ?? 0;
    switch (count) {
      case 5:
        return repository.setPointWithEvent(20);
      case 10:
        return repository.setPointWithEvent(30);
      case 15:
        return repository.setPointWithEvent(50);
      case 30:
        return repository.setPointWithEvent(80);
    }
    emit(state.copyWith(count: count));
  }
}
