import 'package:flutter/material.dart';
import 'package:tonytony_mobile/view/widgets/login_widget.dart';
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
        _controller!.setLooping(false);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SizedBox.expand(
        child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
                //nullチェックしてる
                width: _controller?.value.size.width ?? 0,
                height: _controller?.value.size.height ?? 0,
                child: VideoPlayer(_controller!))),
      ),
      LoginWidget(),
    ]));
  }
}
