import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotex/const/color.dart';
import 'package:quotex/nav_manager.dart';
import 'package:quotex/terms/domain/bloc/term_bloc.dart';
import 'package:quotex/widgets/calc_button.dart';
import 'package:quotex/widgets/close_button.dart';

showSheetCustomEntity(
    {required BuildContext context,
    required int entity,
    required Function(int value) func}) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return Material(
        child: Container(
          color: const Color(0xFF282C3A),
          height: 400,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12, top: 20, right: 12, bottom: 40),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(
                children: [
                  Expanded(
                    child: Text(
                      'Number of cards',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  VCloseButton()
                ],
              ),
              SizedBox(
                height: 200,
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                          pickerTextStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.5)))),
                  child: BlocBuilder<TermsBloc, TermsState>(
                    buildWhen: (previous, current) =>
                        previous.model.favoriteTerms.length !=
                        current.model.favoriteTerms.length,
                    builder: (context, state) {
                      return CupertinoPicker(
                        magnification: 1.22,
                        squeeze: 1.2,
                        useMagnifier: true,
                        itemExtent: 31,
                        scrollController: FixedExtentScrollController(
                          initialItem: 0,
                        ),
                        onSelectedItemChanged: func,
                        children: List.generate(
                            state.model.favoriteTerms.length,
                            (index) => Center(
                                  child: Text('${index + 1}'),
                                )),
                      );
                    },
                  ),
                ),
              ),
              CalcButton(
                text: 'Start',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                gradic: gradientButtonGreen,
                function: () {
                  context.read<TermsBloc>().add(StartTestEvent());
                  MyNavigatorManager.instance.testPush();
                },
              )
            ]),
          ),
        ),
      );
    },
  );
}
