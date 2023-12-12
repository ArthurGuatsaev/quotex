// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quotex/const/color.dart';
import 'package:quotex/const/text.dart';
import 'package:quotex/home/home_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: secondBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 100),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Menu',
            style: menuTitle,
          ),
          const SizedBox(height: 20),
          MenuItem(
            title: 'Terms',
            image: 'assets/images/term.png',
            func: () {
              context
                  .read<HomeBloc>()
                  .add(const ChangeHomeIndexEvent(homeIndex: 0));
              context.findAncestorStateOfType<ScaffoldState>()!.closeDrawer();
            },
          ),
          MenuItem(
            title: 'Selected terms',
            image: 'assets/images/selected.png',
            func: () {
              context
                  .read<HomeBloc>()
                  .add(const ChangeHomeIndexEvent(homeIndex: 1));
              context.findAncestorStateOfType<ScaffoldState>()!.closeDrawer();
            },
          ),
          MenuItem(
            title: 'Achievements',
            image: 'assets/images/achiev.png',
            func: () {
              context
                  .read<HomeBloc>()
                  .add(const ChangeHomeIndexEvent(homeIndex: 2));
              context.findAncestorStateOfType<ScaffoldState>()!.closeDrawer();
            },
          ),
          MenuItem(
            title: 'Education',
            image: 'assets/images/education.png',
            func: () {
              context
                  .read<HomeBloc>()
                  .add(const ChangeHomeIndexEvent(homeIndex: 3));
              context.findAncestorStateOfType<ScaffoldState>()!.closeDrawer();
            },
          ),
          MenuItem(
            title: 'Podcasts',
            image: 'assets/images/podcast.png',
            func: () {
              context
                  .read<HomeBloc>()
                  .add(const ChangeHomeIndexEvent(homeIndex: 4));
              context.findAncestorStateOfType<ScaffoldState>()!.closeDrawer();
            },
          ),
          MenuItem(
            title: 'Calendar',
            image: 'assets/images/calend.png',
            func: () {
              context
                  .read<HomeBloc>()
                  .add(const ChangeHomeIndexEvent(homeIndex: 5));
              context.findAncestorStateOfType<ScaffoldState>()!.closeDrawer();
            },
          ),
          MenuItem(
            title: 'Settings',
            image: 'assets/images/settings.png',
            isD: false,
            func: () {
              context
                  .read<HomeBloc>()
                  .add(const ChangeHomeIndexEvent(homeIndex: 6));
              context.findAncestorStateOfType<ScaffoldState>()!.closeDrawer();
            },
          ),
        ]),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final String image;
  final Function() func;
  final bool? isD;
  const MenuItem({
    Key? key,
    this.isD,
    required this.title,
    required this.image,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(image),
              const SizedBox(width: 10),
              Expanded(
                  child: Text(
                title,
                style: calcButtonTextStyte,
              )),
              const Icon(
                Icons.navigate_next,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 10),
          isD != null
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Divider(
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
        ],
      ),
    );
  }
}
