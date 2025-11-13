import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_bangla_translate/translatorcontroller.dart';

class TranslatedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const TranslatedText(this.text, {super.key, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    final langCtrl = Get.find<LanguageController>();

    return Obx(
      () => FutureBuilder<String>(
        future: langCtrl.translateText(text),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text(text, style: style, textAlign: textAlign);
          }
          if (!snapshot.hasData) {
            return Text(text, style: style, textAlign: textAlign);
          }
          return Text(snapshot.data!, style: style, textAlign: textAlign);
        },
      ),
    );
  }
}
