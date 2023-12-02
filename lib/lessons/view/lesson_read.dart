import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotex/const/color.dart';
import 'package:quotex/lessons/domain/bloc/lesson_bloc.dart';
import 'package:quotex/lessons/domain/model/lesson.dart';
import 'package:quotex/nav_manager.dart';

class LessonRead extends StatelessWidget {
  static const String routeName = '/lesson';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const LessonRead());
  }

  const LessonRead({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => MyNavigatorManager.instance.simulatorPop(),
            child: const Icon(
              Icons.navigate_before_sharp,
              color: Colors.white,
              size: 35,
            )),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: BlocBuilder<LessonBloc, LessonState>(
            buildWhen: (previous, current) =>
                previous.model.current?.status != current.model.current?.status,
            builder: (context, state) {
              final lesson = state.model.current ?? state.model.lessons[0];
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          lesson.title!,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  lesson.image != null
                      ? Image.network(lesson.image!)
                      : const SizedBox.shrink(),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        lesson.description!,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.7)),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(lesson.description!,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.7)))),
                    ],
                  ),
                  const SizedBox(height: 20),
                  lesson.status == LessonStatus.finished
                      ? const SizedBox(
                          height: 52,
                          child: _MyButtonClosed(),
                        )
                      : SizedBox(
                          height: 52,
                          child: _MyButtonOpened(
                            lesson: lesson,
                          ),
                        ),
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}

class _MyButtonClosed extends StatelessWidget {
  const _MyButtonClosed();

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Colors.transparent,
      child: SizedBox(
        height: 52,
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: secondBackgroundColor),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  size: 25,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Award received',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                        Text(
                          '+ 50 points',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MyButtonOpened extends StatelessWidget {
  final Lesson lesson;
  const _MyButtonOpened({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.read<LessonBloc>().add(FinishedLessonEvent(
              lesson: lesson.copyWith(status: LessonStatus.finished)));
        },
        child: SizedBox(
          height: 52,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: gradientButtonGreen),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 25,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Center(
                    child: Text('Get 50 points',
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
