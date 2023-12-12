import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotex/const/text.dart';
import 'package:quotex/podcast/domain/bloc/podcast_bloc.dart';
import 'package:quotex/podcast/view/podcast_item.dart';
import 'package:quotex/widgets/drawer.dart';

class PodcastsPage extends StatefulWidget {
  const PodcastsPage({super.key});

  @override
  State<PodcastsPage> createState() => _PodcastsPageState();
}

class _PodcastsPageState extends State<PodcastsPage> {
  @override
  void initState() {
    context.read<PodcastBloc>().add(GetPodcastsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.7,
          child: const MyDrawer()),
      appBar: AppBar(
        title: const Text(
          'Podcasts',
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
        padding: const EdgeInsets.only(bottom: 40, left: 12, right: 12),
        child: BlocBuilder<PodcastBloc, PodcastState>(
          builder: (context, state) {
            return ListView.builder(
                itemCount: state.podcasts.length,
                itemExtent: MediaQuery.of(context).size.height * 0.1,
                itemBuilder: (context, index) {
                  return PodcastItem(
                    podcast: state.podcasts[index],
                    index: index,
                  );
                });
          },
        ),
      ),
    );
  }
}
