import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotex/const/color.dart';
import 'package:quotex/terms/domain/bloc/term_bloc.dart';

class CalendarWeek extends StatefulWidget {
  const CalendarWeek({super.key});

  @override
  State<CalendarWeek> createState() => _CalendarWeekState();
}

class _CalendarWeekState extends State<CalendarWeek> {
  late final ScrollController controller = ScrollController();
  final double height = 55;
  final initial = DateTime(2023, 11, 11);
  late DateTime dateNow;
  @override
  void initState() {
    dateNow = DateTime.now();
    super.initState();
  }

  void chooseDate(DateTime date) {
    setState(() {
      dateNow = date;
    });
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final offset = DateTime.now().difference(initial).inDays;
      controller.position.jumpTo((offset * height) -
          MediaQuery.of(context).size.width / 2 +
          (height / 2));
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: height,
        controller: controller,
        itemBuilder: (context, index) {
          final day = initial.add(Duration(days: index));
          final active =
              DateTime(dateNow.year, dateNow.month, dateNow.day) == day;
          return GestureDetector(
            onTap: () {
              chooseDate(day);
              context.read<TermsBloc>().add(AddCustomTermsDate(date: day));
            },
            child: Container(
              width: height,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: secondBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: active
                      ? Border.all(color: Colors.blue)
                      : Border.all(color: Colors.transparent)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${day.day}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    day.month.toMonth,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

extension on int {
  String get toMonth {
    switch (this) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return 'Dec';
    }
  }
}
