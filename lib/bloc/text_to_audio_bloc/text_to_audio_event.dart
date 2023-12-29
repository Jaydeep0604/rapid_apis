import 'package:equatable/equatable.dart';
import 'package:rapid_apis/model/text_to_audio_model.dart';

abstract class TextToAudioEvent extends Equatable {}

class FetchAudioLanguage extends TextToAudioEvent {
  @override
  List<Object?> get props => [];
}

class FetchAudioEvent extends TextToAudioEvent {
  String langCode;
  FetchAudioEvent({required this.langCode});
  @override
  List<Object?> get props => [];
}

class SubmitTextEvent extends TextToAudioEvent {
  TextToAudioModel textToAudioModel;
  SubmitTextEvent({required this.textToAudioModel});
  @override
  List<Object?> get props => [textToAudioModel];
}
