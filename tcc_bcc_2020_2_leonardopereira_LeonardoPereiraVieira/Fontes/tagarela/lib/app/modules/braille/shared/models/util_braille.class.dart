import 'package:shared_preferences/shared_preferences.dart';

class ConfigBraille {
  static bool _slide;

  static Future<bool> getSlide() async {
    if (_slide != null) return _slide;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool slide = prefs.getBool('slide_braille');
    if (slide != null)
      _slide = slide;
    else
      _slide = false;
    return _slide;
  }

  static setSlide(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _slide = value;
    prefs.setBool('slide_braille', _slide);
  }
}
