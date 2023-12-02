// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quotex/terms/domain/model/terms_model.dart';

class VTestViewModel {
  final int duration;
  final DateTime date;
  final int entity;
  final TestStatus status;
  final List<TermsModel> terms;
  final List<VTestResult> result;
  VTestViewModel({
    this.duration = 0,
    this.entity = 1,
    required this.date,
    this.status = TestStatus.initial,
    this.terms = const [],
    this.result = const [],
  });

  VTestViewModel copyWith({
    int? duration,
    DateTime? date,
    int? entity,
    TestStatus? status,
    List<TermsModel>? terms,
    List<VTestResult>? result,
  }) {
    return VTestViewModel(
      duration: duration ?? this.duration,
      date: date ?? this.date,
      status: status ?? this.status,
      entity: entity ?? this.entity,
      terms: terms ?? this.terms,
      result: result ?? this.result,
    );
  }

  int get rightAnswear {
    return result.where((e) => e.rightAnswear == e.yourAnswear).toList().length;
  }

  int get wrongAnswear {
    return result.where((e) => e.rightAnswear != e.yourAnswear).toList().length;
  }

  int get skipAnswear {
    return result.where((e) => e.skip == true).toList().length;
  }

  VTestViewModel skipQuestion(int time) {
    return copyWith(duration: time);
  }

  String get timeRecord {
    final left = DateTime.now().difference(date);
    int minute = 0;
    int second = 0;
    if (left.inMinutes >= 1) {
      minute = left.inMinutes;
      second = left.inSeconds - minute * 60;
    } else {
      second = left.inSeconds;
    }

    final min = '$minute'.length < 2 ? '0$minute' : '$minute';
    final sec = '$second'.length < 2 ? '0$second' : '$second';
    return '$min:$sec';
  }
}

class VTestResult {
  final String question;
  final String yourAnswear;
  final String rightAnswear;
  final bool skip;
  VTestResult({
    required this.question,
    required this.yourAnswear,
    required this.rightAnswear,
    required this.skip,
  });
}

enum TestStatus {
  win,
  lose,
  initial,
}
