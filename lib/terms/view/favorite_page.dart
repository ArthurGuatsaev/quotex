import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotex/const/color.dart';
import 'package:quotex/const/text.dart';
import 'package:quotex/terms/domain/bloc/term_bloc.dart';
import 'package:quotex/widgets/calc_button.dart';
import 'package:quotex/widgets/drawer.dart';
import 'package:quotex/widgets/pop/cup_picker.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.7,
          child: const MyDrawer()),
      appBar: AppBar(
        title: const Text(
          'Selected terms',
          style: appBarTitleStyte,
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<TermsBloc, TermsState>(
            buildWhen: (previous, current) =>
                previous.model.favoriteTerms != current.model.favoriteTerms,
            builder: (context, state) {
              if (state.model.favoriteTerms.isEmpty) {
                return const SizedBox.shrink();
              }
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    '${state.model.favoriteTerms.length} terms',
                    style: appBarActionTextStyte,
                  ),
                ),
              );
            },
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
      body: BlocBuilder<TermsBloc, TermsState>(
        buildWhen: (previous, current) =>
            previous.model.favoriteTerms != current.model.favoriteTerms,
        builder: (context, state) {
          if (state.model.favoriteTerms.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.27,
                  ),
                  const Text(
                    'Empty',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "You don't have any terms added to your favorites yet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.7)),
                  )
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 100, left: 10),
            child: Column(children: [
              const ItemsPageView(),
              const SizedBox(height: 20),
              CalcButton(
                text: 'Start testing',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                function: () => showSheet(context),
                color: Colors.white,
                gradic: gradientButtonGreen,
              )
            ]),
          );
        },
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
          buildWhen: (previous, current) =>
              previous.model.favoriteTerms != current.model.favoriteTerms,
          listener: (context, state) {},
          builder: (context, state) {
            final favor = state.model.favoriteTerms;
            return PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (var i = 0; i < favor.length; i++)
                  GestureDetector(
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
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        context.read<TermsBloc>().add(
                                            RemoveFavoriteEvent(
                                                term: state
                                                    .model.favoriteTerms[i]));
                                      },
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    favor[i].name!,
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
                                        controller.previousPage(
                                            duration: const Duration(
                                                milliseconds: 250),
                                            curve: Curves.linear);
                                      },
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.4),
                                        radius:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Center(
                                            child: Icon(
                                              Icons.chevron_left_sharp,
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
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 250),
                                            curve: Curves.linear);
                                      },
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.4),
                                        radius:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Center(
                                            child: Icon(
                                              Icons.navigate_next_outlined,
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
                                    favor[i].rightDescription!,
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
                                        controller.previousPage(
                                            duration: const Duration(
                                                milliseconds: 250),
                                            curve: Curves.linear);
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        radius:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Center(
                                            child: Icon(
                                              Icons.chevron_left_sharp,
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
                                        controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 250),
                                            curve: Curves.linear);
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        radius:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Center(
                                            child: Icon(
                                              Icons.navigate_next_outlined,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
