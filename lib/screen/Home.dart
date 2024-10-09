import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:lakshapathi/components/MillionaireButton.dart';
import 'package:lakshapathi/models/questionModel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late YoutubePlayerController _controller;
  final videoLink = 'https://youtu.be/NdUy4sNQYGo';

  bool isASelected = false;
  bool isBSelected = false;
  bool isCSelected = false;
  bool isDSelected = false;
  String selectedAnswer = "0";
  int Qindex = 1;
  bool isListVisible = false;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoLink);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: YoutubePlayerFlags(
          hideControls: true,
          hideThumbnail: true,
          mute: false,
          autoPlay: true,
          disableDragSeek: true,
          loop: true,
          isLive: false,
          forceHD: false,
          enableCaption: false,
        ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blue,
            bottomActions: [
              ProgressBar(
                isExpanded: true,
                colors: ProgressBarColors(
                    playedColor: Colors.blue,
                    handleColor: Colors.blue,
                    bufferedColor: Colors.grey[300]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
