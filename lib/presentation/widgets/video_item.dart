import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/video/video_bloc.dart';
import '../../bloc/video/video_event.dart';
import '../../data/models/video_model.dart';
import 'video_player_widget.dart';

class VideoItem extends StatelessWidget {
  final VideoModel video;

  const VideoItem({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoPlayerWidget(
          video.videoUrl,
          backupAssetPath: video.backupVideoAsset,
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.15),
                    Colors.black.withValues(alpha: 0.55),
                  ],
                  stops: [0.55, 0.72, 1.0],
                ),
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 20,
          left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                video.expertName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  shadows: [
                    Shadow(color: Colors.black54, blurRadius: 8, offset: Offset(0, 2)),
                  ],
                ),
              ),
              Text(
                video.expertTitle,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  shadows: [
                    Shadow(color: Colors.black54, blurRadius: 8, offset: Offset(0, 2)),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                video.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  shadows: [
                    Shadow(color: Colors.black54, blurRadius: 8, offset: Offset(0, 2)),
                  ],
                ),
              ),
            ],
          ),
        ),

        Positioned(
          right: 16,
          bottom: 50,
          child: Column(
            children: [
              GestureDetector(
                onTap: () => context.read<VideoBloc>().add(ToggleLikeVideo(video.id)),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.45),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: video.isLiked ? Colors.redAccent : Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => context.read<VideoBloc>().add(ToggleSaveVideo(video.id)),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.45),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.bookmark,
                    color: video.isSaved ? Colors.amber : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),

        if (video.isPremium && !video.isUnlocked)
          Container(
            color: Colors.black.withValues(alpha: 0.6),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock, color: Colors.white, size: 40),
                  const Text('Locked', style: TextStyle(color: Colors.white)),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Unlock Video'),
                          content: Text('Pay EUR ${video.price} (mock)'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.read<VideoBloc>().add(UnlockVideo(video.id));
                                Navigator.pop(context);
                              },
                              child: const Text('Unlock'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Unlock'),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
