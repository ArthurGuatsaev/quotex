import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotex/const/color.dart';
import 'package:quotex/podcast/domain/bloc/podcast_bloc.dart';
import 'package:quotex/podcast/domain/model/podcast_model.dart';
import 'package:quotex/widgets/pop/modal_podcasts.dart';

class PodcastItem extends StatefulWidget {
  final PodcastModel podcast;
  final int index;
  const PodcastItem({super.key, required this.podcast, required this.index});

  @override
  State<PodcastItem> createState() => _PodcastItemState();
}

class _PodcastItemState extends State<PodcastItem> {
  late final controller = PageController(initialPage: widget.index);
  final audio = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: secondBackgroundColor),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context
                .read<PodcastBloc>()
                .add(ChangePodcastIndexEvent(currentIndex: widget.index));
            showModalSheetPodcast(
                context: context,
                controller: controller,
                player: audio,
                index: widget.index);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.podcast.image,
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.1,
                  fit: BoxFit.fitHeight,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox(),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.podcast.title,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    // Text(
                    //   "${widget.podcast.duration}':00",
                    //   style: TextStyle(
                    //       fontSize: 13,
                    //       fontWeight: FontWeight.w600,
                    //       color: Colors.white.withOpacity(0.7)),
                    // ),
                  ],
                ),
              ),
              Image.asset('assets/images/play.png'),
            ]),
          ),
        ),
      ),
    );
  }
}
