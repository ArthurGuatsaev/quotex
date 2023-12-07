// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotex/const/color.dart';
import 'package:quotex/const/text.dart';
import 'package:quotex/lessons/domain/bloc/lesson_bloc.dart';
import 'package:quotex/terms/domain/bloc/term_bloc.dart';
import 'package:quotex/widgets/drawer.dart';

class AchievPage extends StatelessWidget {
  const AchievPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.7,
          child: const MyDrawer()),
      appBar: AppBar(
        title: const Text(
          'Achievements',
          style: appBarTitleStyte,
        ),
        centerTitle: true,
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
      body: BlocBuilder<LessonBloc, LessonState>(
        buildWhen: (previous, current) =>
            previous.model.finishedLessons != current.model.finishedLessons,
        builder: (context, state) {
          return BlocBuilder<TermsBloc, TermsState>(
            buildWhen: (previous, current) => previous.count != current.count,
            builder: (context, countState) {
              final count = countState.count;
              return ListView(
                children: [
                  AchievItem(
                    bonus: 10,
                    isC: state.model.finishedLessons.length > 1,
                    text: 'Read 2 lessons',
                    start: 0,
                    end: 2,
                    value: state.model.finishedLessons.length,
                  ),
                  AchievItem(
                    bonus: 15,
                    isC: state.model.finishedLessons.length > 4,
                    text: 'Read 5 lessons',
                    start: 2,
                    end: 5,
                    value: state.model.finishedLessons.length,
                  ),
                  AchievItem(
                    bonus: 60,
                    isC: state.model.finishedLessons.length > 9,
                    text: 'Read 10 lessons',
                    start: 5,
                    end: 10,
                    value: state.model.finishedLessons.length,
                  ),
                  AchievItem(
                    bonus: 20,
                    isC: count > 4,
                    text: 'Pass the test 5 times',
                    start: 0,
                    end: 5,
                    value: count,
                  ),
                  AchievItem(
                    bonus: 30,
                    isC: count > 9,
                    text: 'Pass the test 10 times',
                    start: 5,
                    end: 10,
                    value: count,
                  ),
                  AchievItem(
                    bonus: 50,
                    isC: count > 14,
                    text: 'Pass the test 15 times',
                    start: 10,
                    end: 15,
                    value: count,
                  ),
                  AchievItem(
                    bonus: 80,
                    isC: count > 29,
                    text: 'Pass the test 30 times',
                    start: 15,
                    end: 30,
                    value: count,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class AchievItem extends StatelessWidget {
  final bool isC;
  final int? start;
  final int? end;
  final int value;
  final int bonus;
  final String text;
  const AchievItem({
    Key? key,
    required this.isC,
    required this.value,
    this.start,
    this.end,
    required this.bonus,
    required this.text,
  }) : super(key: key);
  Color get loadingColor {
    return isC ? Colors.amber : Colors.blue;
  }

  double get loadValue {
    if (end != null) {
      if (value > start! && value < end!) {
        return (value - start!) / (end! - start!);
      }
      if (value > start! && value > end!) {
        return 1;
      }
      if (value <= start!) {
        return 0;
      }
    }
    return 1;
  }

  Widget get firstRow {
    if (!isC) {
      return Row(
        children: [
          Text(
            '$start',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.5)),
          ),
          const Spacer(),
          Text('$end',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.5))),
        ],
      );
    } else {
      return Text(
        'Received',
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.5)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 118,
        decoration: BoxDecoration(
            border: Border.all(
                color: isC ? const Color(0xFFFFB803) : Colors.transparent),
            borderRadius: BorderRadius.circular(8),
            color: secondBackgroundColor),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: SizedBox(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    text,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            ),
          ),
          Container(
            height: 54,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white.withOpacity(0.05)),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Container(
                    width: 72,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFB803),
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '+$bonus',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                          )
                        ]),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      firstRow,
                      const SizedBox(height: 5),
                      LinearProgressIndicator(
                        color: loadingColor,
                        backgroundColor: Colors.white.withOpacity(0.1),
                        value: loadValue,
                      )
                    ],
                  ))
                ],
              ),
            )),
          ),
        ]),
      ),
    );
  }
}
