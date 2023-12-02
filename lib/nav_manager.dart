import 'package:flutter/cupertino.dart';
import 'package:quotex/lessons/view/lesson_read.dart';
import 'package:quotex/loading/view/ui/onboard/unwork_onb.dart';
import 'package:quotex/loading/view/ui/onboard/widgets/base_onb.dart';
import 'package:quotex/loading/view/ui/onboard/widgets/teleg_board.dart';
import 'package:quotex/loading/view/ui/onboard/work_onb.dart';
import 'package:quotex/pages/finic.dart';
import 'package:quotex/pages/home.dart';
import 'package:quotex/splash.dart';
import 'package:quotex/terms/view/answear_page.dart';
import 'package:quotex/terms/view/terms_test.dart';
import 'package:quotex/terms/view/test_lose.dart';
import 'package:quotex/terms/view/test_win.dart';
import 'package:quotex/widgets/pop/pop_up_ios_delete.dart';

class MyNavigatorManager {
  MyNavigatorManager._();
  static MyNavigatorManager instance = MyNavigatorManager._();
  final key = GlobalKey<NavigatorState>();
  late NavigatorState postState;
  NavigatorState? get nav => key.currentState;

  Future<void> postPop() async {
    postState.pop();
  }

  Future<void> simulatorPop() async {
    nav!.pop();
  }

  Future<void> errorPop(String message) async {
    showErrorPop(nav!.context, message);
  }

  Future<void> simulatorPush() async {
    nav!.pushNamed('/simulator');
  }

  Future<void> testPush() async {
    nav!.pushNamedAndRemoveUntil('/test', ModalRoute.withName('/home'));
  }

  Future<void> homePush() async {
    nav!.pushReplacementNamed('/home');
  }

  Future<void> finPush(String url) async {
    nav!.pushReplacementNamed('/fin', arguments: url);
  }

  Future<void> unworkBPush() async {
    nav!.pushNamed('/unwork');
  }

  Future<void> workBPush(String tg) async {
    nav!.pushNamed('/work', arguments: tg);
  }

  Future<void> telegaPush(VBoardParam param) async {
    nav!.pushNamed('/tg', arguments: param);
  }

  Future<void> winPush() async {
    nav!.pushReplacementNamed('/win');
  }

  Future<void> ansPush() async {
    nav!.pushNamed('/ans');
  }

  Future<void> losePush() async {
    nav!.pushReplacementNamed('/lose');
  }

  Future<void> lessonPush() async {
    nav!.pushNamed('/lesson');
  }

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return SplashPage.route();
      case '/win':
        return TestWin.route();
      case '/lesson':
        return LessonRead.route();
      case '/ans':
        return AnswearPage.route();
      case '/lose':
        return TestLose.route();
      case '/unwork':
        return VUnWorkOnb.route();
      case '/work':
        final tg = settings.arguments as String;
        return VWorkOnb.route(tg);
      case '/tg':
        final tg = settings.arguments as VBoardParam;
        return VBoardTelega.route(tg);
      case '/fin':
        final url = settings.arguments as String;
        return FinicPage.route(url);
      case '/home':
        return HomePage.route();
      case '/test':
        return TermsTest.route();
      default:
        return HomePage.route();
    }
  }
}
