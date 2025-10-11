import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _flutterTts = FlutterTts();
  bool isSpeaking = false;

  TtsService() {
    // Initialize TTS options
    _flutterTts.setLanguage("hi-IN"); // Change to "en-US" for English
    _flutterTts.setPitch(0.5);
    _flutterTts.setSpeechRate(0.7);

    // Listen to TTS events
    _flutterTts.setStartHandler(() {
      isSpeaking = true;
    });
    _flutterTts.setCompletionHandler(() {
      isSpeaking = false;
    });
    _flutterTts.setCancelHandler(() {
      isSpeaking = false;
    });
  }

  Future<void> speak(String text) async {
    if (text.isNotEmpty) {
      await _flutterTts.speak(text);
    }
  }

  Future<void> stop() async {
    await _flutterTts.stop();
    isSpeaking = false;
  }

  void dispose() {
    _flutterTts.stop();
  }
}
