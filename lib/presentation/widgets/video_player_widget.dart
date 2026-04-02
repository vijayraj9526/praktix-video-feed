import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  final String? backupAssetPath;

  const VideoPlayerWidget(
    this.url, {
    super.key,
    this.backupAssetPath,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    await _initializeNetworkVideo();
  }

  Future<void> _initializeNetworkVideo() async {
    final controller = VideoPlayerController.networkUrl(Uri.parse(widget.url));
    _controller = controller;

    try {
      await controller.initialize();
      if (!mounted) return;
      controller
        ..setLooping(true)
        ..play();
      setState(() {
        _isInitialized = true;
      });
    } catch (_) {
      await controller.dispose();
      await _initializeBackupVideo();
    }
  }

  Future<void> _initializeBackupVideo() async {
    final assetPath = widget.backupAssetPath;
    if (assetPath == null || assetPath.isEmpty) {
      if (!mounted) return;
      setState(() {
        _errorText = 'Video unavailable';
      });
      return;
    }

    final controller = VideoPlayerController.asset(assetPath);
    _controller = controller;

    try {
      await controller.initialize();
      if (!mounted) return;
      controller
        ..setLooping(true)
        ..play();
      setState(() {
        _isInitialized = true;
        _errorText = null;
      });
    } catch (_) {
      await controller.dispose();
      if (!mounted) return;
      setState(() {
        _errorText = 'Video unavailable (offline backup missing)';
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_errorText != null) {
      return ColoredBox(
        color: Colors.black,
        child: Center(
          child: Text(
            _errorText!,
            style: const TextStyle(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (!_isInitialized || _controller == null) {
      return const ColoredBox(
        color: Colors.black,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final controller = _controller!;

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: controller.value.size.width,
          height: controller.value.size.height,
          child: VideoPlayer(controller),
        ),
      ),
    );
  }
}
