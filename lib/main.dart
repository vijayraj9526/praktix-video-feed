import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/video/video_bloc.dart';
import 'bloc/video/video_event.dart';
import 'data/repository/video_repository.dart';
import 'presentation/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VideoBloc(VideoRepository())..add(LoadVideos()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
