class PodcastModel {
  final String image;
  final String title;
  final int duration;
  final String audio;
  final int podId;
  PodcastModel(
      {this.image = '',
      this.audio = '',
      this.duration = 0,
      this.podId = 0,
      this.title = ''});

  PodcastModel copyWith({
    String? image,
    String? title,
    int? duration,
    String? audio,
    int? podId,
  }) {
    return PodcastModel(
      image: image ?? this.image,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      audio: audio ?? this.audio,
      podId: podId ?? this.podId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'title': title,
      'duration': duration,
      'audio': audio,
      'podId': podId,
    };
  }

  factory PodcastModel.fromMap(Map<String, dynamic> map) {
    return PodcastModel(
      image: map['image'] as String,
      title: map['title'] as String,
      duration: map['duration'] as int,
      audio: map['audio'] as String,
      podId: map['id'] as int,
    );
  }
}
