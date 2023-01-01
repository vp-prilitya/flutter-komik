import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();

  void playAudio() async {
    String audioasset = "assets/audios/background_audio.mp3";
    ByteData bytes = await rootBundle.load(audioasset); //load sound from assets
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await audioPlayer.playBytes(soundbytes);
    if (result == 1) {
      //play success
      print("Sound playing successful.");
    } else {
      print("Error while playing sound.");
    }
  }

  void pauseAudio() async {
    await audioPlayer.pause();
  }

  void resumeAudio() async {
    await audioPlayer.resume();
  }

  sizeWidth(context) {
    final currentWidth = MediaQuery.of(context).size.width;
    var db = 2;
    if (currentWidth < 600) {
      db = 2;
    } else if (currentWidth > 600 && currentWidth < 800) {
      db = 3;
    } else {
      db = 4;
    }

    return db;
  }
}
