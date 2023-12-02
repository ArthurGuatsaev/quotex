import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotex/const/text.dart';
import 'package:quotex/lessons/domain/bloc/lesson_bloc.dart';
import 'package:quotex/lessons/view/lessons_page.dart';
import 'package:quotex/widgets/drawer.dart';

class FavorLessons extends StatelessWidget {
  const FavorLessons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.7,
          child: const MyDrawer()),
      appBar: AppBar(
        title: const Text(
          'Favorites',
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
            previous.model.favoriteLessons.length !=
            current.model.favoriteLessons.length,
        builder: (context, state) {
          if (state.model.favoriteLessons.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                  ),
                  Image.asset(
                    'assets/images/lupa.png',
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Empty',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "You don't have favorite lessons in your favorites",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.7)),
                      )),
                    ],
                  )
                ],
              ),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount: state.model.favoriteLessons.length,
                itemBuilder: (context, index) {
                  return LessonItem(
                    isN: true,
                    lesson: state.model.favoriteLessons[index],
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.84,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
