import 'package:flutter/material.dart';
import 'package:quiz/View/Screen/AssetsMaterial/VideosMaterial/VideoPlayerWidget.dart';
import 'package:video_player/video_player.dart';

class VideoAssetPlayer extends StatefulWidget {
  VideoAssetPlayer({Key? key}) : super(key: key);
  static const String routename = '/VideoAssetPlayer';

  @override
  State<VideoAssetPlayer> createState() => _VideoAssetPlayerState();
}

class _VideoAssetPlayerState extends State<VideoAssetPlayer> {
  final assets = 'assets/videos/AV.mp4';
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(assets)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => controller.play());
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = controller.value.volume == 0;
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VideoPlayerWidget(
              controller: controller,
            ),
            const SizedBox(
              height: 32,
            ),
            if (controller != null && controller.value.isInitialized)
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.redAccent,
                child: IconButton(
                    onPressed: () => controller.setVolume(isMuted ? 1 : 0),
                    icon: Icon(
                      isMuted ? Icons.volume_mute : Icons.volume_up,
                      color: Colors.white,
                    )),
              )
          ],
        ),
      ),
    );
  }
}
