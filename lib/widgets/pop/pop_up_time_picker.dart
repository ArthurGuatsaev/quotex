import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotex/const/color.dart';
import 'package:quotex/terms/domain/bloc/term_bloc.dart';
import 'package:quotex/widgets/calc_button.dart';
import 'package:quotex/widgets/close_button.dart';
import 'package:quotex/widgets/pop/pop_cupertino_entity.dart';

showSheetCustomTime(
    {required BuildContext context, required Function(Duration value) func}) {
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
                      'Custom difficulty',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  VCloseButton()
                ],
              ),
              CupertinoTheme(
                data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                        pickerTextStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.7)))),
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.ms,
                  initialTimerDuration: const Duration(minutes: 20),
                  onTimerDurationChanged: func,
                ),
              ),
              CalcButton(
                text: 'Continue',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                gradic: gradientButtonGreen,
                function: () {
                  showSheetCustomEntity(
                    context: context,
                    entity: 100,
                    func: (value) => context
                        .read<TermsBloc>()
                        .add(ChangeTestEntityEvent(entity: value + 1)),
                  );
                },
              )
            ]),
          ),
        ),
      );
    },
  );
}
