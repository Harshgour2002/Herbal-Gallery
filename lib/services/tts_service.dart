import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/foundation.dart'; // for ValueNotifier

class TtsService {
  final FlutterTts _flutterTts = FlutterTts();

  // 👇 Use ValueNotifier instead of plain bool
  final ValueNotifier<bool> isSpeaking = ValueNotifier(false);

  TtsService() {
    // Initialize TTS options
    _flutterTts.setLanguage("hi-IN"); // or "en-US" for English
    _flutterTts.setPitch(1.0);
    _flutterTts.setSpeechRate(0.5);

    // Listen to TTS events
    _flutterTts.setStartHandler(() {
      isSpeaking.value = true;
    });

    _flutterTts.setCompletionHandler(() {
      isSpeaking.value = false;
    });

    _flutterTts.setCancelHandler(() {
      isSpeaking.value = false;
    });
  }

  Future<void> speak(String text) async {
    if (text.isNotEmpty) {
      await _flutterTts.speak(text);
      isSpeaking.value = true;
    }
  }

  Future<void> stop() async {
    await _flutterTts.stop();
    isSpeaking.value = false;
  }

  void dispose() {
    _flutterTts.stop();
    isSpeaking.dispose();
  }
}
