import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotex/const/color.dart';
import 'package:quotex/const/text.dart';
import 'package:quotex/home/home_bloc.dart';
import 'package:quotex/lessons/domain/bloc/lesson_bloc.dart';
import 'package:quotex/lessons/domain/model/lesson.dart';
import 'package:quotex/lessons/domain/view_model/lesson_vm.dart';
import 'package:quotex/nav_manager.dart';
import 'package:quotex/widgets/drawer.dart';

class LessonsPage extends StatelessWidget {
  const LessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            width: MediaQuery.of(context).size.width * 0.7,
            child: const MyDrawer()),
        appBar: AppBar(
          title: const Text(
            'Education',
            style: appBarTitleStyte,
          ),
          centerTitle: true,
          actions: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: GestureDetector(
                    onTap: () => context
                        .read<HomeBloc>()
                        .add(const ChangeHomeIndexEvent(homeIndex: 5)),
                    child: const Icon(Icons.favorite_border,
                        color: Colors.white, size: 22)),
              ),
            )
          ],
          leading: Builder(
            builder: (context) {
              return GestureDetector(
                  onTap: () {
                    context
                        .findAncestorStateOfType<ScaffoldState>()!
                        .openDrawer();
                  },
                  child: const Icon(Icons.menu, color: Colors.white, size: 25));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: BlocBuilder<LessonBloc, LessonState>(
                  buildWhen: (previous, current) =>
                      previous.model.startedLessons !=
                      current.model.startedLessons,
                  builder: (context, state) {
                    return state.model.startedLessons.isEmpty
                        ? const SizedBox.shrink()
                        : SizedBox(
                            height: MediaQuery.of(context).size.height < 700
                                ? MediaQuery.of(context).size.height * 0.4
                                : MediaQuery.of(context).size.height * 0.36,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    'Continue reading',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.32,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          state.model.startedLessons.length,
                                      itemBuilder: (context, index) {
                                        if (MediaQuery.of(context).size.height <
                                            700) {
                                          return LessonItem(
                                            isN: false,
                                            lesson: state
                                                .model.startedLessons[index],
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.80,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.28,
                                          );
                                        }
                                        return LessonItem(
                                          isN: false,
                                          lesson:
                                              state.model.startedLessons[index],
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.29,
                                        );
                                      }),
                                ),
                              ],
                            ),
                          );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: BlocBuilder<LessonBloc, LessonState>(
                  buildWhen: (previous, current) =>
                      previous.model.startedLessons !=
                      current.model.startedLessons,
                  builder: (context, state) {
                    return SizedBox(
                      child: state.model.startedLessons.isEmpty
                          ? const SizedBox.shrink()
                          : const SizedBox(height: 20),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    height: 50,
                    child: BlocBuilder<LessonBloc, LessonState>(
                      buildWhen: (previous, current) =>
                          previous.model.sort != current.model.sort,
                      builder: (context, state) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () => context.read<LessonBloc>().add(
                                    const ChangeSortEvent(sort: SortLevel.all),
                                  ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                margin: const EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.5)),
                                  gradient: state.model.sort == SortLevel.all
                                      ? gradientActiveTermsCategory
                                      : gradientActiveTermsCategoryTransparrent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  'All',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => context.read<LessonBloc>().add(
                                    const ChangeSortEvent(
                                        sort: SortLevel.begin),
                                  ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                margin: const EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: state.model.sort == SortLevel.begin
                                      ? gradientActiveTermsCategory
                                      : gradientActiveTermsCategoryTransparrent,
                                ),
                                child: const Text(
                                  'Beginners',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => context.read<LessonBloc>().add(
                                    const ChangeSortEvent(
                                        sort: SortLevel.advanced),
                                  ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                margin: const EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: state.model.sort ==
                                          SortLevel.advanced
                                      ? gradientActiveTermsCategory
                                      : gradientActiveTermsCategoryTransparrent,
                                ),
                                child: const Text(
                                  'Advanced',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              BlocBuilder<LessonBloc, LessonState>(
                buildWhen: (previous, current) =>
                    previous.model.lessons != current.model.lessons ||
                    previous.model.sort != current.model.sort,
                builder: (context, state) {
                  return SliverList.builder(
                    itemCount: state.model.sortedList.length,
                    itemBuilder: (context, index) {
                      return LessonItem(
                        isN: true,
                        lesson: state.model.sortedList[index],
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width * 0.84,
                      );
                    },
                  );
                },
              )
            ],
          ),
        ));
  }
}

class LessonItem extends StatelessWidget {
  final Lesson lesson;
  final double height;
  final double width;
  final bool isN;
  const LessonItem(
      {super.key,
      required this.lesson,
      required this.height,
      required this.width,
      required this.isN});

  Widget get statusButton {
    if (isN) {
      return Column(
        children: [
          const SizedBox(height: 5),
          SizedBox(
            height: 48,
            child: BlocBuilder<LessonBloc, LessonState>(
              buildWhen: (previous, current) => previous.point != current.point,
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: state.point >= lesson.quality!
                      ? _MyButtonOpened(lesson)
                      : const _MyButtonClosed(),
                );
              },
            ),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget get isFavor {
    return BlocBuilder<LessonBloc, LessonState>(
      builder: (context, state) {
        if (lesson.isFavorite!) {
          return const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 22,
          );
        } else {
          return Icon(
            Icons.favorite_border,
            color: Colors.white.withOpacity(0.5),
            size: 22,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (lesson.status == LessonStatus.locked) {
          return;
        }
        if (lesson.status == LessonStatus.open) {
          context.read<LessonBloc>().add(StartedLessonEvent(
              lesson: lesson.copyWith(status: LessonStatus.started)));
        }
        context.read<LessonBloc>().add(
              SetCurrentLessonEvent(
                lesson: lesson.copyWith(status: LessonStatus.started),
              ),
            );
        MyNavigatorManager.instance.lessonPush();
      },
      child: AspectRatio(
        aspectRatio: width / height,
        child: Container(
          margin: const EdgeInsets.only(right: 12, top: 12, left: 12),
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: secondBackgroundColor),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height < 700
                    ? height * 0.52
                    : height * 0.52,
                child: lesson.image == null
                    ? const SizedBox()
                    : Image.asset(
                        lesson.image!,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth,
                      ),
              ),
              Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical:
                            MediaQuery.of(context).size.height < 700 ? 3 : 7),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white.withOpacity(0.25)),
                                child: Text(
                                  lesson.level!,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                )),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {
                                  context.read<LessonBloc>().add(
                                      AddFavorLessonEvent(
                                          lesson: lesson.copyWith(
                                              isFavorite:
                                                  !lesson.isFavorite!)));
                                },
                                child: isFavor)
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height < 700
                                ? 3
                                : 10),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              lesson.title!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height < 700
                                          ? 15
                                          : 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                lesson.description!,
                                maxLines:
                                    MediaQuery.of(context).size.height < 700
                                        ? 1
                                        : 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height < 700
                                            ? 11
                                            : 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white.withOpacity(0.5)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              statusButton,
            ],
          ),
        ),
      ),
    );
  }
}

class _MyButtonClosed extends StatelessWidget {
  const _MyButtonClosed({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          height: 52,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white.withOpacity(0.15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.lock,
                    size: 25,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Lesson closed',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                        BlocBuilder<LessonBloc, LessonState>(
                          buildWhen: (previous, current) =>
                              previous.point != current.point,
                          builder: (context, state) {
                            return Text('${state.point}/30 points',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14));
                          },
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MyButtonOpened extends StatelessWidget {
  final Lesson lesson;
  const _MyButtonOpened(this.lesson);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (lesson.status == LessonStatus.open) {
            context.read<LessonBloc>().add(StartedLessonEvent(
                lesson: lesson.copyWith(status: LessonStatus.started)));
          }
          context.read<LessonBloc>().add(
                SetCurrentLessonEvent(
                  lesson: lesson.copyWith(status: LessonStatus.started),
                ),
              );
          MyNavigatorManager.instance.lessonPush();
        },
        child: SizedBox(
          height: 52,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white.withOpacity(0.15)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.library_books_outlined,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Center(
                    child: Text('Read',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
