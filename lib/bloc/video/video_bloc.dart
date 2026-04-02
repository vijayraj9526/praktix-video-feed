import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/video_repository.dart';
import 'video_event.dart';
import 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoRepository repository;

  VideoBloc(this.repository) : super(VideoState([])) {
    on<LoadVideos>((event, emit) {
      emit(VideoState(repository.fetchVideos()));
    });

    on<UnlockVideo>((event, emit) {
      final updated = state.videos.map((video) {
        if (video.id == event.videoId) {
          return video.copyWith(isUnlocked: true);
        }
        return video;
      }).toList();

      emit(VideoState(updated));
    });

    on<ToggleLikeVideo>((event, emit) {
      final updated = state.videos.map((video) {
        if (video.id == event.videoId) {
          return video.copyWith(isLiked: !video.isLiked);
        }
        return video;
      }).toList();

      emit(VideoState(updated));
    });

    on<ToggleSaveVideo>((event, emit) {
      final updated = state.videos.map((video) {
        if (video.id == event.videoId) {
          return video.copyWith(isSaved: !video.isSaved);
        }
        return video;
      }).toList();

      emit(VideoState(updated));
    });
  }
}
