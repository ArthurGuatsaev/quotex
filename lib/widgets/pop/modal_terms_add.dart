import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quotex/const/color.dart';
import 'package:quotex/nav_manager.dart';
import 'package:quotex/terms/domain/bloc/term_bloc.dart';
import 'package:quotex/terms/domain/model/terms_model.dart';
import 'package:quotex/widgets/calc_button.dart';
import 'package:quotex/widgets/text_field.dart';

Future showModalSheetTermsAdd({
  required BuildContext context,
  required TextEditingController nameController,
  required TextEditingController descController,
}) async {
  return showCupertinoModalBottomSheet(
    context: context,
    builder: (context) => ConstrainedBox(
      constraints: BoxConstraints.loose(Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * 0.8)),
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: secondBackgroundColor),
          child: Padding(
            padding: const EdgeInsets.only(right: 12, left: 12, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Center(child: Image.asset('assets/images/tire.png')),
                const SizedBox(height: 30),
                const Center(
                    child: Text(
                  'New term',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VTextField(
                      hint: 'Name',
                      controller: nameController,
                      inputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15),
                    VTextField(
                      controller: descController,
                      hint: 'Definition',
                      maxLines: 10,
                      hight: 300,
                    ),
                    const SizedBox(height: 15),
                    BlocBuilder<TermsBloc, TermsState>(
                      buildWhen: (previous, current) =>
                          previous.date != current.date,
                      builder: (context, state) {
                        return CalcButton(
                          text: 'Create',
                          gradic: gradientActiveTermsCategory,
                          function: () {
                            if (nameController.text.isEmpty ||
                                descController.text.isEmpty) {
                              return;
                            }
                            final term = TermsModel(
                              category: 'custom',
                              date: DateTime(state.date!.year,
                                  state.date!.month, state.date!.day),
                              isFavorite: false,
                              name: nameController.text,
                              rightDescription: descController.text,
                              wrongDescriptionOne: 'Stocks',
                              wrongDescriptionThree: 'ETF',
                              wrongDescriptionTwo: 'Forex',
                            );
                            context
                                .read<TermsBloc>()
                                .add(AddFavorTermEvent(term: term));
                            nameController.clear();
                            descController.clear();
                            MyNavigatorManager.instance.simulatorPop();
                          },
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
