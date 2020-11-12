import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tagarela/app/shared/models/config.class.dart';

enum TtsState { playing, stopped, paused, continued }

class Tagarela {
  static Config config = Config();
  FlutterTts flutterTts;
  TtsState ttsState;
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Tagarela() {
    flutterTts = FlutterTts();
    ttsState = TtsState.stopped;
    configureSpeak();
  }
  speak(String palavra) async {
    if (!Tagarela.config.acessible) return;
    configureSpeak();
    if (palavra != '') {
      await _stop();
      await flutterTts.speak(palavra).then((value) {
        return value;
      });
    }
  }

  static saveConfig() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setDouble('config_vol', config.volume);
    prefs.setBool('config_acessible', config.acessible);
    prefs.setDouble('config_pitch', config.pitch);
    prefs.setDouble('config_speech', config.speechRate);
  }

  static getConfig() async {
    //final SharedPreferences prefs = await _prefs;
    _prefs.then((SharedPreferences prefs) {
      final double volume = prefs.getDouble('config_vol');
      if (volume != null)
        config.volume = volume;
      else
        config.volume = 0.5;

      final double pitch = prefs.getDouble('config_pitch');
      if (pitch != null)
        config.pitch = pitch;
      else
        config.pitch = 1;

      final double speechRate = prefs.getDouble('config_speech');
      if (speechRate != null)
        config.speechRate = speechRate;
      else
        config.speechRate = 0.5;

      final bool acessible = prefs.getBool('config_acessible');
      if (acessible != null)
        config.acessible = acessible;
      else
        config.acessible = true;
    });
  }

  configureSpeak() async {
    await flutterTts.setLanguage("pt-BR");
    await flutterTts.setSpeechRate(config.speechRate);
    await flutterTts.setVolume(config.volume);
    await flutterTts.setPitch(config.speechRate);
  }

  initTts() {
    flutterTts.setStartHandler(() {
      ttsState = TtsState.playing;
    });

    flutterTts.setCompletionHandler(() {
      ttsState = TtsState.stopped;
    });
    flutterTts.setCancelHandler(() {
      ttsState = TtsState.stopped;
    });
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) ttsState = TtsState.stopped;
  }
}
