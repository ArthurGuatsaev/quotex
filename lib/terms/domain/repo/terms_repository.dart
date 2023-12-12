import 'dart:async';

import 'package:isar/isar.dart';
import 'package:quotex/loading/domain/model/loading_model.dart';
import 'package:quotex/nav_manager.dart';
import 'package:quotex/terms/data/terms_api.dart';
import 'package:quotex/terms/domain/model/terms_model.dart';
import 'package:quotex/terms/domain/view_model/terms_vm.dart';
import 'package:quotex/terms/domain/view_model/test_vm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VTermsRepository with VSharedPrefLesson {
  final StreamController<bool> pointController;
  final Isar isar;
  List<TermsModel>? terms;
  int? count;
  VTermsRepository({required this.isar, required this.pointController});
  TermsViewModel getModel(List<TermsModel> custom) {
    return TermsApiClient.getTerms(custom);
  }

  Future<List<TermsModel>> getSelectedHistory(
      {StreamController<VLoading>? controller}) async {
    terms = await isar.termsModels.where().findAll();
    count = await getCount();
    controller?.add(VLoading.terms);
    return terms ?? [];
  }

  Future<void> resete() async {
    await isar.writeTxn(() async {
      await isar.termsModels.clear();
    });
  }

  Future<void> saveTerm(TermsModel term) async {
    await isar.writeTxn(() async {
      await isar.termsModels.put(term);
    });
  }

  Future<void> deleteTerm(TermsModel term) async {
    await isar.writeTxn(() async {
      await isar.termsModels.delete(term.id!);
    });
  }

  List<TermsModel> startTest(List<TermsModel> favorite, int entity) {
    final list = [...favorite];
    list.shuffle();
    return list.getRange(0, entity).toList();
  }

  List<TermsModel> noRemember(
      {required TermsModel term, required List<TermsModel> fogot}) {
    final list = [...fogot, term];
    return list;
  }

  bool stopTest(VTestViewModel test) {
    return test.entity == test.result.length &&
        (test.result.every((element) =>
            element.rightAnswear == element.yourAnswear || element.skip));
  }

  int skipQuestion(int time, VTestViewModel test) {
    final h = test.date.difference(DateTime.now()) +
        Duration(seconds: test.duration - time);
    if (h.inSeconds <= 0) {
      return -1;
    } else {
      return h.inSeconds;
    }
  }

  VTestViewModel addTestAnswear(
      {required VTestViewModel test, required VTestResult answear}) {
    final result = [...test.result];
    result.add(answear);
    if (result.length == test.entity) {
      final hasFalse = result.any((element) =>
          element.rightAnswear != element.yourAnswear && !element.skip);
      final skipLenght = result.where((element) => element.skip).toList();
      if (hasFalse || skipLenght.length > (test.terms.length / 5)) {
        MyNavigatorManager.instance.losePush();
        return test.copyWith(status: TestStatus.lose, result: result);
      } else {
        setTestCount();
        MyNavigatorManager.instance.winPush();
        return test.copyWith(status: TestStatus.win, result: result);
      }
    }
    return test.copyWith(result: result);
  }

  Future<void> setPointWithEvent(int points) async {
    await setPoint(points: points, pointController: pointController);
  }
}

mixin VSharedPrefLesson {
  final String p = 'tests';
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();
  Future<void> setTestCount() async {
    final count = await getCount();
    (await prefs).setInt(p, count + 1);
  }

  Future<void> setPoint(
      {required int points,
      required StreamController<bool> pointController}) async {
    final point = (await prefs).getInt('points') ?? 0;
    (await prefs).setInt('points', point + points);
    pointController.add(true);
  }

  Future<int> getCount() async {
    return (await prefs).getInt(p) ?? 0;
  }

  Future<void> reset() async {
    (await prefs).remove(p);
  }
}
