import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotex/const/color.dart';
import 'package:quotex/const/text.dart';
import 'package:quotex/nav_manager.dart';
import 'package:quotex/terms/domain/bloc/term_bloc.dart';
import 'package:quotex/widgets/calc_button.dart';
import 'package:quotex/widgets/pop/cup_picker.dart';

class TestLose extends StatelessWidget {
  static const String routeName = '/lose';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const TestLose());
  }

  const TestLose({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocBuilder<TermsBloc, TermsState>(
        buildWhen: (previous, current) =>
            previous.model.testModel != current.model.testModel,
        builder: (context, state) {
          final test = state.model.testModel;
          return Column(
            children: [
              Image.asset('assets/images/lose.png'),
              const SizedBox(height: 20),
              Container(
                width: 72,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(40)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    '+0',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white.withOpacity(0.5),
                  )
                ]),
              ),
              const SizedBox(height: 5),
              const Text(
                'Unfortunately test failed!',
                style: termTitleStyte,
              ),
              const SizedBox(height: 10),
              Text(
                '${state.model.testModel.timeRecord} minutes',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
              const SizedBox(height: 30),
              TestResultStatItem(
                result: '${test.rightAnswear}',
                title: 'Correct answers',
              ),
              const SizedBox(height: 10),
              TestResultStatItem(
                result: '${test.skipAnswear}',
                title: 'Missed',
              ),
              const SizedBox(height: 10),
              TestResultStatItem(
                result: test.timeRecord,
                title: 'Time record',
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SheetItem(
                  title: 'My answers',
                  time: '',
                  func: () {
                    MyNavigatorManager.instance.ansPush();
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CalcButton(
                  text: 'To main',
                  gradic: gradientButtonGreen,
                  function: () {
                    MyNavigatorManager.instance.simulatorPop();
                    context.read<TermsBloc>().add(ResetTestEvent());
                  },
                ),
              )
            ],
          );
        },
      ),
    ));
  }
}

class TestResultStatItem extends StatelessWidget {
  const TestResultStatItem(
      {super.key, required this.result, required this.title});

  final String result;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withOpacity(0.25))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.25)),
              ),
            ),
            Text(
              result,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ), //right answear
          ]),
        ),
      ),
    );
  }
}
