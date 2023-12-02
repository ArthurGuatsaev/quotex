import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotex/const/color.dart';
import 'package:quotex/terms/domain/bloc/term_bloc.dart';
import 'package:quotex/terms/domain/view_model/test_vm.dart';

class AnswearPage extends StatelessWidget {
  static const String routeName = '/ans';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const AnswearPage());
  }

  const AnswearPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: backgroundColor,
              elevation: 0)),
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'My answers',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )),
        body: BlocBuilder<TermsBloc, TermsState>(
          buildWhen: (previous, current) =>
              previous.model.testModel.result != current.model.testModel.result,
          builder: (context, state) {
            return ListView.builder(
                itemCount: state.model.testModel.result.length,
                itemBuilder: (context, index) {
                  final question = state.model.testModel.result[index];
                  final entity = state.model.testModel.result.length;
                  return AnswearItem(
                      question: question, index: index + 1, entity: entity);
                });
          },
        ),
      ),
    );
  }
}

class AnswearItem extends StatelessWidget {
  final int index;
  final int entity;
  final VTestResult question;
  const AnswearItem(
      {super.key,
      required this.question,
      required this.index,
      required this.entity});
  Widget get ansIcon {
    if (question.rightAnswear == question.yourAnswear) {
      return const CircleAvatar(
        radius: 20,
        backgroundColor: Colors.green,
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon(
            Icons.done,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return const CircleAvatar(
        radius: 20,
        backgroundColor: Colors.red,
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      );
    }
  }

  Widget get ansWright {
    if (question.rightAnswear == question.yourAnswear) {
      return const SizedBox.shrink();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text('Correct answer',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.5))),
          const SizedBox(height: 8),
          Container(
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white.withOpacity(0.2))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  question.rightAnswear,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )
              ]),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: secondBackgroundColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$index/$entity',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                  child: Text(
                question.question,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Your answer',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.5)),
          ),
          const SizedBox(height: 8),
          Container(
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white.withOpacity(0.2))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  ansIcon,
                  const SizedBox(width: 8),
                  Text(
                    question.yourAnswear,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          ansWright,
        ],
      ),
    );
  }
}
