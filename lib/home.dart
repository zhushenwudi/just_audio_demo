import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

final player = AudioPlayer();

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isPlaying = false;

  @override
  void initState() {
    player.setAudioSource(AudioSource.uri(
        Uri.parse("https://video-file-upload.oss-cn-hangzhou.aliyuncs.com/1.wav")));
    player.setLoopMode(LoopMode.one);

    player.playerStateStream.listen((state) {
      isPlaying = state.playing;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Just Audio Demo"),
      ),
      body: Center(
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    if (player.playing) {
                      player.pause();
                    } else {
                      player.play();
                    }
                  },
                  child: Text(isPlaying ? "pause" : "play"))
            ],
          )),
    );
  }
}