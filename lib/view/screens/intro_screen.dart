import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final video = 'assets/IMG_4065.mp4';
  VideoPlayerController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset(video)
      ..initialize().then((_) {
        _controller!.play();
        _controller!.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SizedBox(child: VideoPlayer(_controller!)));
  }
}
