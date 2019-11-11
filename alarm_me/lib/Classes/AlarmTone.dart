
import 'package:assets_audio_player/assets_audio_player.dart';
class AlarmTone{
String remainder;
final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
AlarmTone(this.remainder);

void open() {
    assetsAudioPlayer.open(
      AssetsAudio(
        asset: 'ringTone.mp3',
        folder: "assets/ring_tones/",
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