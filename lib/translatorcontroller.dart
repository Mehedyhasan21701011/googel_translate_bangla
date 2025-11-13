
import 'package:get/get.dart';
import 'package:google_bangla_translate/traslatorservice.dart';

class LanguageController extends GetxController {
  var currentLang = 'en'.obs;

  void changeLanguage(String langCode) {
    currentLang.value = langCode;
  }

  // Translate text dynamically using Google API
  Future<String> translateText(String text) async {
    if (currentLang.value == 'en') return text; // default English
    return await GoogleTranslateService.translate(text, currentLang.value);
  }
}
