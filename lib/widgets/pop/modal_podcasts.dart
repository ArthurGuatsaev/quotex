import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quotex/const/color.dart';
import 'package:quotex/podcast/domain/bloc/podcast_bloc.dart';
import 'package:quotex/podcast/domain/model/podcast_model.dart';

Future showModalSheetPodcast({
  required BuildContext context,
  required int index,
  required AudioPlayer player,
  required PageController controller,
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
                BlocBuilder<PodcastBloc, PodcastState>(
                  builder: (context, state) {
                    return ConstrainedBox(
                      constraints: BoxConstraints.loose(
                          Size(MediaQuery.of(context).size.width, 380)),
                      child: PageView(
                        controller: controller,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                            state.podcasts.length,
                            (ind) => PodcastPageViewItem(
                                  podcast: state.podcasts[ind],
                                )),
                      ),
                    );
                  },
                ),
                BlocBuilder<PodcastBloc, PodcastState>(
                  builder: (context, state) {
                    final podcast = state.podcasts[state.currentIndex];
                    return AudioControl(
                      controller: controller,
                      podcast: podcast,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class AudioControl extends StatefulWidget {
  final PageController controller;
  final PodcastModel podcast;
  const AudioControl({
    super.key,
    required this.podcast,
    required this.controller,
  });

  @override
  State<AudioControl> createState() => _AudioControlState();
}

class _AudioControlState extends State<AudioControl> {
  late AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  late final StreamSubscription stateSubscreaption;
  late final StreamSubscription durationSubscreaption;
  late final StreamSubscription positionSubscreaption;
  @override
  void dispose() {
    if (player.state != PlayerState.disposed) {
      stateSubscreaption.cancel();
      durationSubscreaption.cancel();
      positionSubscreaption.cancel();
      player.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    stateSubscreaption = player.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });
    durationSubscreaption = player.onDurationChanged.listen((event) {
      duration = event;
      setState(() {});
    });
    positionSubscreaption = player.onPositionChanged.listen((event) {
      position = event;
      setState(() {});
    });
  }

  String formatTime({required int second}) {
    return '${Duration(seconds: second)}'.split('.')[0].padLeft(8, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTime(second: position.inSeconds),
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
                Text(
                  formatTime(second: duration.inSeconds),
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
            height: 20,
            child: Slider(
              activeColor: Colors.blue,
              value: position.inSeconds.toDouble(),
              onChanged: (value) {
                player.seek(Duration(seconds: value.toInt()));
                player.resume();
              },
              min: 0,
              max: duration.inSeconds.toDouble(),
            )),
        const SizedBox(height: 20),
        SizedBox(
          height: 88,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (player.state != PlayerState.disposed) {
                    player.stop();
                  }
                  context.read<PodcastBloc>().add(ChangePodcastIndexEvent(
                      currentIndex: widget.controller.page!.toInt() - 1));
                  widget.controller.previousPage(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.linear);
                },
                child: Image.asset('assets/images/left.png'),
              ),
              const SizedBox(width: 25),
              GestureDetector(
                onTap: () async {
                  final podcast = widget.podcast;
                  if (player.state == PlayerState.disposed) {
                    player = AudioPlayer();
                  }

                  player.state == PlayerState.playing
                      ? await player.pause()
                      : await player.play(
                          UrlSource(podcast.audio),
                        );
                },
                child: Image.asset('assets/images/player.png',
                    width: 88, height: 88, fit: BoxFit.fitHeight),
              ),
              const SizedBox(width: 25),
              GestureDetector(
                onTap: () {
                  if (player.state != PlayerState.disposed) {
                    player.stop();
                  }
                  widget.controller.nextPage(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.linear);
                  context.read<PodcastBloc>().add(ChangePodcastIndexEvent(
                      currentIndex: widget.controller.page!.toInt() + 1));
                },
                child: Image.asset('assets/images/right.png'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PodcastPageViewItem extends StatelessWidget {
  final PodcastModel podcast;
  const PodcastPageViewItem({super.key, required this.podcast});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                podcast.image,
                width: 250,
                height: 250,
                fit: BoxFit.fitHeight,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              )),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
                child: Text(
              podcast.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )),
          ],
        ),
      ],
    );
  }
}
