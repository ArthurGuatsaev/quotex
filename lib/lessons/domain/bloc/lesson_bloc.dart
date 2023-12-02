// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:quotex/lessons/domain/lessons_repo.dart';
import 'package:quotex/lessons/domain/model/lesson.dart';
import 'package:quotex/lessons/domain/view_model/lesson_vm.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LessonsRepo repository;
  final StreamController<bool> pointController;
  LessonBloc({required this.repository, required this.pointController})
      : super(const LessonState()) {
    pointController.stream.listen(
      (event) {
        if (event) {
          add(GetPointEvent());
        }
      },
    );

    on<SaveLessonEvent>(onSaveLesson);
    on<DeleteLessonEvent>(onDeleteLesson);
    on<GetLessonsEvent>(onGetLessons);
    on<GetSaveLessonsEvent>(onGetSaveLessons);
    on<StartedLessonEvent>(onStartedLesson);
    on<FinishedLessonEvent>(onFinishedLesson);
    on<GetPointEvent>(getPoint);
    on<AddPointEvent>(onAddPoint);
    on<AddFavorLessonEvent>(onAddFavorLesson);
    on<ResetAllDataEvent>(resetAllData);
    on<SetCurrentLessonEvent>(onSetCurrentLesson);
    on<ChangeSortEvent>(changeSort);
  }
  changeSort(ChangeSortEvent event, Emitter<LessonState> emit) async {
    emit(state.copyWith(model: state.model.copyWith(sort: event.sort)));
  }

  getPoint(GetPointEvent event, Emitter<LessonState> emit) async {
    final point = await repository.getPoint();
    emit(state.copyWith(point: point));
  }

  resetAllData(ResetAllDataEvent event, Emitter<LessonState> emit) async {
    await repository.resete();
    final les = await repository.getLessons();
    final model = state.model.getLessons(les);
    return emit(state.copyWith(model: model, point: 20));
  }

  onAddPoint(AddPointEvent event, Emitter<LessonState> emit) async {
    await repository.setPoint(event.point + state.point);
    add(GetPointEvent());
  }

  onSetCurrentLesson(SetCurrentLessonEvent event, Emitter<LessonState> emit) {
    emit(state.copyWith(model: state.model.setCurrentLesson(event.lesson)));
  }

  onSaveLesson(SaveLessonEvent event, Emitter<LessonState> emit) async {
    await repository.saveLesson(event.lesson);
  }

  onDeleteLesson(DeleteLessonEvent event, Emitter<LessonState> emit) async {
    await repository.deleteLesson(event.lesson);
  }

  onGetSaveLessons(GetSaveLessonsEvent event, Emitter<LessonState> emit) async {
    final history = await repository.getLessonHistory();
    final model = state.model.getSaveHistory(history);
    emit(state.copyWith(model: model));
  }

  onGetLessons(GetLessonsEvent event, Emitter<LessonState> emit) async {
    final lessons = repository.lessons ?? [];
    final model = state.model.getLessons(lessons);
    emit(state.copyWith(model: model));
  }

  onFinishedLesson(FinishedLessonEvent event, Emitter<LessonState> emit) {
    final lessons =
        repository.finishedLesson(state.model.lessons, event.lesson);
    final model = state.model.finishedLesson(
        lessons: lessons,
        lesson:
            lessons.where((element) => element.id == event.lesson.id).first);
    emit(state.copyWith(model: model));
    repository.saveLesson(event.lesson);
    add(const AddPointEvent(point: 50));
  }

  onStartedLesson(StartedLessonEvent event, Emitter<LessonState> emit) {
    final lessons = repository.startedLesson(state.model.lessons, event.lesson);
    final model = state.model.startedLesson(lessons);
    emit(state.copyWith(model: model));
    add(SaveLessonEvent(lesson: event.lesson));
  }

  onAddFavorLesson(AddFavorLessonEvent event, Emitter<LessonState> emit) {
    final lessons = [
      ...repository.favorLesson(state.model.lessons, event.lesson)
    ];
    final model = state.model.favorLesson(lessons);
    emit(state.copyWith(model: model));
    add(DeleteLessonEvent(lesson: event.lesson));
    add(SaveLessonEvent(lesson: event.lesson));
  }
}
