import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:quotex/const/color.dart';
import 'package:quotex/const/strings.dart';
import 'package:quotex/const/text.dart';
import 'package:quotex/widgets/drawer.dart';
import 'package:quotex/widgets/pop/pop_up_ios_delete.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final InAppReview inAppReview = InAppReview.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.7,
          child: const MyDrawer()),
      appBar: AppBar(
        title: const Text(
          'Education',
          style: appBarTitleStyte,
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
                onTap: () {
                  context
                      .findAncestorStateOfType<ScaffoldState>()!
                      .openDrawer();
                },
                child: const Icon(Icons.menu, color: Colors.white, size: 25));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: secondBackgroundColor),
              child: Column(children: [
                SettingItem(
                  func: () => inAppReview.requestReview(),
                  title: 'Rate our app',
                ),
                SettingItem(
                  func: () {
                    shareApp(context: context, text: 'share app');
                  },
                  title: 'Share our app',
                ),
                SettingItem(
                  func: () {
                    launchPolicy();
                  },
                  title: 'Usage policy',
                  isD: false,
                )
              ]),
            ),
            const Spacer(),
            CupertinoButton(
              child: const Text(
                'Reset all progress',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFE43F3F)),
              ),
              onPressed: () {
                showMyIosResetDataPop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final String title;
  final Function() func;
  final bool? isD;
  const SettingItem({
    Key? key,
    this.isD,
    required this.title,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: SizedBox(
          height: 52,
          child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: isD != null
                            ? Colors.transparent
                            : Colors.white.withOpacity(0.3)))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        title,
                        style: calcButtonTextStyte,
                      )),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void shareApp({required BuildContext context, required String text}) async {
  final box = context.findRenderObject() as RenderBox;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  IosDeviceInfo info = await deviceInfo.iosInfo;
  if (info.model.toLowerCase().contains("ipad")) {
    Share.share(text,
        subject: appName,
        sharePositionOrigin:
            box.localToGlobal(Offset.zero) & const Size(100, 100));
  } else {
    Share.share(text, subject: appName);
  }
}

void launchPolicy() async {
  final uri = Uri.parse(
      'https://docs.google.com/document/d/1vPQAQkF9CSMsXGVi9ugGWEh4gVbIP-KQ8FVMGh-Mt4o/edit');
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
