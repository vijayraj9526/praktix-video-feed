abstract class VideoEvent {}

class LoadVideos extends VideoEvent {}

class UnlockVideo extends VideoEvent {
  final int videoId;
  UnlockVideo(this.videoId);
}

class ToggleLikeVideo extends VideoEvent {
  final int videoId;
  ToggleLikeVideo(this.videoId);
}

class ToggleSaveVideo extends VideoEvent {
  final int videoId;
  ToggleSaveVideo(this.videoId);
}
