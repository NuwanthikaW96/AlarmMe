// import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
class Alarm{
String remainder;
final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
Alarm(this.remainder);

void open() {
    assetsAudioPlayer.open(
      AssetsAudio(
        asset: 'ringTone.mp3',
        folder: "assets/configuration_files/ring_tones/",
      ),
    );
  }
  // void _playPause() {
    
  //   _assetsAudioPlayer.playOrPause();
  // }
void stop() {
    assetsAudioPlayer.stop();
  }
}