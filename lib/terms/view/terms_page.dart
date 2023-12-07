import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotex/const/color.dart';
import 'package:quotex/const/text.dart';
import 'package:quotex/lessons/domain/bloc/lesson_bloc.dart';
import 'package:quotex/terms/domain/bloc/term_bloc.dart';
import 'package:quotex/terms/domain/view_model/terms_vm.dart';
import 'package:quotex/widgets/drawer.dart';
import 'package:quotex/widgets/pop/pop_up_ios_delete.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.7,
          child: const MyDrawer()),
      appBar: AppBar(
        title: const Text(
          'Terms',
          style: appBarTitleStyte,
        ),
        centerTitle: true,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: BlocBuilder<LessonBloc, LessonState>(
                buildWhen: (previous, current) =>
                    previous.point != current.point,
                builder: (context, state) {
                  return Text(
                    '${state.point} points',
                    style: appBarActionTextStyte,
                  );
                },
              ),
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
      body: const Padding(
        padding: EdgeInsets.only(bottom: 100, left: 10),
        child: Column(children: [
          CategoriesItem(),
          SizedBox(height: 25),
          ItemsPageView(),
          SizedBox(height: 25),
          BottomRow(),
        ]),
      ),
    );
  }
}

class ItemsPageView extends StatefulWidget {
  const ItemsPageView({
    super.key,
  });

  @override
  State<ItemsPageView> createState() => _ItemsPageViewState();
}

class _ItemsPageViewState extends State<ItemsPageView>
    with TickerProviderStateMixin {
  late final PageController controller = PageController();
  FlipCardController flipCardController = FlipCardController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 5),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.52,
        child: BlocConsumer<TermsBloc, TermsState>(
          listener: (context, state) {
            if (state.model.status == TermStadyStatus.finish) {
              showPopAllStudied(
                  context, state.model.activeTerms.first.category!);
            }
            if (state.model.status == TermStadyStatus.start) {
              controller.jumpTo(1);
            }
          },
          builder: (context, state) {
            final active = state.model.activeTerms;
            return PageView.builder(
              itemCount: active.length,
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () => flipCardController.toggleCard(),
                  child: FlipCard(
                    controller: flipCardController,
                    front: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: itemColor),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  active[i].name!,
                                  style: termTitleStyte,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 33, vertical: 20),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (i < active.length - 1) {
                                        context.read<TermsBloc>().add(
                                            ChangeLastTermEvent(
                                                term: active[i]));
                                      }
                                      if (i == active.length - 1) {
                                        context.read<TermsBloc>().add(
                                              RememberedTermEvent(
                                                  term: active[i]),
                                            );
                                        context
                                            .read<TermsBloc>()
                                            .add(AgainTermEvent());
                                        controller.jumpTo(0);
                                      } else {
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 250),
                                            curve: Curves.linear);
                                        context.read<TermsBloc>().add(
                                              RememberedTermEvent(
                                                  term: active[i]),
                                            );
                                      }
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      child: const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Center(
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Center(
                                          child: Image.asset(
                                              'assets/images/hand.png'))),
                                  GestureDetector(
                                    onTap: () {
                                      if (i < active.length - 1) {
                                        context.read<TermsBloc>().add(
                                            ChangeLastTermEvent(
                                                term: active[i + 1]));
                                      }
                                      if (i == active.length - 1) {
                                        context
                                            .read<TermsBloc>()
                                            .add(AgainTermEvent());
                                        controller.jumpTo(0);
                                      } else {
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 250),
                                            curve: Curves.linear);
                                      }
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      child: const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Center(
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    back: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: itemColor),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  active[i].rightDescription!,
                                  style: termTitleStyte,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 33, vertical: 20),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 250),
                                          curve: Curves.linear);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      child: const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Center(
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Center(
                                          child: Image.asset(
                                              'assets/images/hand.png'))),
                                  GestureDetector(
                                    onTap: () {
                                      if (i < active.length - 1) {
                                        context.read<TermsBloc>().add(
                                            ChangeLastTermEvent(
                                                term: active[i + 1]));
                                      }
                                      if (i == active.length - 1) {
                                        context
                                            .read<TermsBloc>()
                                            .add(AgainTermEvent());
                                        controller.jumpTo(0);
                                      } else {
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 250),
                                            curve: Curves.linear);
                                      }
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      child: const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Center(
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class BottomRow extends StatelessWidget {
  const BottomRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 65, left: 55),
      child: BlocBuilder<TermsBloc, TermsState>(
        builder: (context, state) {
          if (state.model.activeTerms.isEmpty) return const SizedBox();
          final term = state.model.lastTerms;
          return Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (state.model.favoriteTerms
                      .any((element) => element.id == term.id)) {
                    context
                        .read<TermsBloc>()
                        .add(RemoveFavoriteEvent(term: term));
                  } else {
                    context
                        .read<TermsBloc>()
                        .add(AddFavorTermEvent(term: term));
                  }
                },
                child: Row(
                  children: [
                    state.model.favoriteTerms
                            .any((element) => element.id == term.id)
                        ? const Icon(
                            Icons.favorite,
                            size: 25,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border,
                            size: 25, color: Colors.white),
                    const SizedBox(width: 8),
                    const Text('To favorites', style: appBarActionTextStyte),
                  ],
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.restart_alt,
                size: 25,
                color: Colors.white,
              ),
              GestureDetector(
                onTap: () {
                  context.read<TermsBloc>().add(MixedTermsEvent(
                      category: state.model.activeTerms.first.category!));
                },
                child: const Row(
                  children: [
                    SizedBox(width: 8),
                    Text('Restart', style: appBarActionTextStyte),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: BlocBuilder<TermsBloc, TermsState>(
        buildWhen: (previous, current) =>
            previous.model.viewItemsList != current.model.viewItemsList,
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.model.viewItemsList.keys.toList().length,
            itemBuilder: (context, index) {
              final title = state.model.viewItemsList.keys.toList()[index];
              final lenth = state.model.viewItemsList.values.toList()[index];
              final grad = state.model.activeTerms.isNotEmpty &&
                      state.model.activeTerms.first.category ==
                          state.model.viewItemsList.keys.toList()[index]
                  ? gradientActiveTermsCategory
                  : gradientDisActiveTermsCategory;
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () => context
                      .read<TermsBloc>()
                      .add(ChangeActiveTermsEvent(category: index.howCategory)),
                  child: SizedBox(
                    width: 150,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: grad,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/images/doc.png'),
                                    const SizedBox(width: 5),
                                    Text(
                                      '$lenth card',
                                      style: itemTextStyte,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  title,
                                  style: itemBodyTextStyte,
                                ),
                              ])),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

extension on int {
  String get howCategory {
    switch (this) {
      case 0:
        return 'trading';
      case 1:
        return 'stocks';
      case 2:
        return 'readingCharts';
      default:
        return 'trading';
    }
  }
}
