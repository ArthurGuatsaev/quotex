import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotex/calendar/view/calendar_week.dart';
import 'package:quotex/const/color.dart';
import 'package:quotex/const/text.dart';
import 'package:quotex/terms/domain/bloc/term_bloc.dart';
import 'package:quotex/widgets/calc_button.dart';
import 'package:quotex/widgets/drawer.dart';
import 'package:quotex/widgets/pop/modal_terms_add.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late final TextEditingController nameController = TextEditingController();
  late final TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.7,
          child: const MyDrawer()),
      appBar: AppBar(
        title: const Text(
          'Podcasts',
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
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 55,
                child: CalendarWeek(),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<TermsBloc, TermsState>(
                  buildWhen: (previous, current) =>
                      previous.termForDate != current.termForDate,
                  builder: (context, state) {
                    if (state.termForDate.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 200),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Empty',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Text(
                                "You don't have any terms added yet on this day",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white.withOpacity(0.7)),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 100, right: 100, bottom: 60),
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: CalcButton(
                                    function: () => showModalSheetTermsAdd(
                                        context: context,
                                        nameController: nameController,
                                        descController: descController),
                                    text: 'New term',
                                    gradic: gradientActiveTermsCategory,
                                  )),
                            )
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                        itemCount: state.termForDate.length,
                        itemBuilder: (context, index) {
                          final term = state.termForDate[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 2),
                              decoration: BoxDecoration(
                                  color: secondBackgroundColor,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    term.name!,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    term.rightDescription!,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white.withOpacity(0.7)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              )
            ],
          ),
          BlocBuilder<TermsBloc, TermsState>(
            buildWhen: (previous, current) =>
                previous.termForDate != current.termForDate,
            builder: (context, state) {
              if (state.termForDate.isEmpty) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding:
                    const EdgeInsets.only(left: 100, right: 100, bottom: 60),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CalcButton(
                        text: 'New term',
                        gradic: gradientActiveTermsCategory,
                        function: () => showModalSheetTermsAdd(
                            context: context,
                            nameController: nameController,
                            descController: descController))),
              );
            },
          )
        ],
      ),
    );
  }
}
