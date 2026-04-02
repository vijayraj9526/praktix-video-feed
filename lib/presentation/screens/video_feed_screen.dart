import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/video/video_bloc.dart';
import '../../bloc/video/video_state.dart';
import '../widgets/video_item.dart';

class VideoFeedScreen extends StatelessWidget {
  const VideoFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.videos.length,
            itemBuilder: (context, index) {
              return VideoItem(video: state.videos[index]);
            },
          );
        },
      ),
    );
  }
}
