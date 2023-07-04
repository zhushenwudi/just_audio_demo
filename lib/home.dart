import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

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
    super.initState();
    Uri uri = Uri.parse(
        "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3");
    player.setAudioSource(AudioSource.uri(uri,
        tag: MediaItem(
          id: "id",
          title: "title",
          album: "album",
          artist: "artist",
          artUri: Uri.tryParse(
              "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg"),
        )));
    player.setLoopMode(LoopMode.all);

    player.playerStateStream.listen((state) {
      isPlaying = state.playing;
      setState(() {});
    });
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
