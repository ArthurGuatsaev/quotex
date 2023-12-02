import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotex/const/color.dart';
import 'package:quotex/const/text.dart';
import 'package:quotex/nav_manager.dart';
import 'package:quotex/terms/domain/bloc/term_bloc.dart';
import 'package:quotex/terms/domain/model/terms_model.dart';
import 'package:quotex/terms/domain/view_model/test_vm.dart';
import 'package:quotex/widgets/calc_button.dart';
import 'package:quotex/widgets/timer.dart';

class TermsTest extends StatelessWidget {
  static const String routeName = '/test';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const TermsTest());
  }

  const TermsTest({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: BlocBuilder<TermsBloc, TermsState>(
          buildWhen: (previous, current) =>
              previous.model.testModel != current.model.testModel,
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height < 700 ? 10 : 50),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 70,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            MyNavigatorManager.instance.simulatorPop();
                            context.read<TermsBloc>().add(ResetTestEvent());
                          },
                          child: const Icon(
                            Icons.navigate_before,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${state.model.testModel.result.length + 1}/${state.model.testModel.entity}',
                            style: appBarTitleStyte,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 25,
                        ),
                        const SizedBox(width: 5),
                        VTimer(
                            duration: state.model.testModel.duration,
                            date: state.model.testModel.date),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height < 700 ? 5 : 10),
                SizedBox(
                  height: 15,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        minHeight: 5,
                        value: (state.model.testModel.result.length + 1) /
                            state.model.testModel.entity,
                        color: loadingColor,
                        backgroundColor: Colors.white.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height < 700 ? 5 : 12),
                Expanded(
                  child: TestPageView(
                    terms: state.model.testModel.terms,
                  ),
                )
              ]),
            );
          },
        ),
      ),
    );
  }
}

class TestPageView extends StatefulWidget {
  final List<TermsModel> terms;
  const TestPageView({super.key, required this.terms});

  @override
  State<TestPageView> createState() => _TestPageViewState();
}

class _TestPageViewState extends State<TestPageView> {
  late final textController = TextEditingController();
  late final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.terms.length,
      itemBuilder: (context, index) {
        final term = widget.terms[index];
        final answear = [...term.answears];
        textController.text = answear[0];
        return PageItem(
            widget: widget,
            index: index,
            textController: textController,
            answear: answear,
            controller: controller,
            term: term);
      },
    );
  }
}

class PageItem extends StatefulWidget {
  const PageItem({
    super.key,
    required this.widget,
    required this.textController,
    required this.answear,
    required this.index,
    required this.controller,
    required this.term,
  });

  final TestPageView widget;
  final int index;
  final TextEditingController textController;
  final List<String> answear;
  final PageController controller;
  final TermsModel term;

  @override
  State<PageItem> createState() => _PageItemState();
}

class _PageItemState extends State<PageItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Row(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                Expanded(
                    child: Text(
                  widget.widget.terms[widget.index].rightDescription!,
                  style: testItem,
                  textAlign: TextAlign.center,
                )),
              ],
            ),
          ),
        ),
        const Spacer(),
        _SheetItems(
          currentText: widget.textController.text,
          title: widget.answear[0],
          func: () {
            widget.textController.text = widget.answear[0];
            setState(() {});
          },
        ),
        const SizedBox(height: 10),
        _SheetItems(
          currentText: widget.textController.text,
          title: widget.answear[1],
          func: () {
            widget.textController.text = widget.answear[1];
            setState(() {});
          },
        ),
        const SizedBox(height: 10),
        _SheetItems(
          currentText: widget.textController.text,
          title: widget.answear[2],
          func: () {
            widget.textController.text = widget.answear[2];
            setState(() {});
          },
        ),
        const SizedBox(height: 10),
        _SheetItems(
          currentText: widget.textController.text,
          title: widget.answear[3],
          func: () {
            widget.textController.text = widget.answear[3];
            setState(() {});
          },
        ),
        const SizedBox(height: 25),
        BlocBuilder<TermsBloc, TermsState>(
          buildWhen: (previous, current) =>
              previous.model.testModel != current.model.testModel,
          builder: (context, state) {
            return SizedBox(
              height: 114,
              child: DecoratedBox(
                decoration: const BoxDecoration(color: secondBackgroundColor),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, bottom: 50, top: 12),
                  child: Row(
                    children: [
                      Flexible(
                        child: CalcButton(
                            text: 'Skip question',
                            subText:
                                'Fine: -${(state.model.testModel.duration / (state.model.testModel.terms.length - (state.model.testModel.result.length - 1)) + 1).toInt()} sec',
                            gradic: gradientButtonGrey,
                            fontSize: 16,
                            function: () {
                              widget.controller.nextPage(
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.linear);
                              context.read<TermsBloc>().add(SkipQuestionEvent(
                                  time: ((state.model.testModel.duration /
                                                  (state.model.testModel.terms
                                                          .length -
                                                      (state.model.testModel
                                                              .result.length -
                                                          1)) +
                                              1)
                                          .toInt())
                                      .toInt()));
                              context.read<TermsBloc>().add(AddAnswearEvent(
                                  result: VTestResult(
                                      question: widget.term.rightDescription!,
                                      rightAnswear: widget.term.name!,
                                      yourAnswear: '',
                                      skip: true)));
                            },
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: CalcButton(
                          text: 'Next',
                          gradic: gradientButtonGreen,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          function: () {
                            widget.controller.nextPage(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.linear);
                            context.read<TermsBloc>().add(
                                  AddAnswearEvent(
                                    result: VTestResult(
                                        question: widget.term.rightDescription!,
                                        rightAnswear: widget.term.name!,
                                        yourAnswear: widget.textController.text,
                                        skip: false),
                                  ),
                                );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

class _SheetItems extends StatelessWidget {
  final String title;
  final String currentText;
  final Function() func;
  const _SheetItems(
      {required this.title, required this.currentText, required this.func});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
        child: InkWell(
          onTap: func,
          child: SizedBox(
            height: MediaQuery.of(context).size.height < 700 ? 48 : 52,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: title != currentText
                          ? Colors.transparent
                          : Colors.blue),
                  color: Colors.white.withOpacity(0.15)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Text(title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
