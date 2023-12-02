// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quotex/widgets/calc_button.dart';

class VBaseBoard extends StatelessWidget {
  final VBoardParam boardParam;
  const VBaseBoard({
    Key? key,
    required this.boardParam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              boardParam.image,
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.43,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: boxColor),
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 15, left: 15, bottom: 60),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      // BlocBuilder<LoadBloc, LoadState>(
                      //   buildWhen: (previous, current) =>
                      //       previous.onboardIndex != current.onboardIndex,
                      //   builder: (context, state) {
                      //     return MyCheckBox(
                      //       index: state.onboardIndex,
                      //     );
                      //   },
                      // ),
                      const SizedBox(height: 10),
                      Text(
                        boardParam.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        child: DecoratedBox(
                          decoration:
                              const BoxDecoration(color: Color(0xFF191B27)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: Text(
                              boardParam.body,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 48,
                        child: CalcButton(
                            text: boardParam.buttonText,
                            function: boardParam.function,
                            fontSize: 16,
                            gradic: _gradient,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class VBoardParam {
  final String? tg;
  final String image;
  final String title;
  final String body;
  final String buttonText;
  final Function()? function;
  VBoardParam({
    this.tg,
    this.function,
    required this.image,
    required this.title,
    required this.body,
    required this.buttonText,
  });
}

const boxColor = Color(0xFF282C3A);
final _gradient = LinearGradient(colors: [
  const Color(0xFF016AC9),
  const Color(0xFF2393F9),
]);
