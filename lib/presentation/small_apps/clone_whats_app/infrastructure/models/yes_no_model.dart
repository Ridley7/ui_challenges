import 'package:flutter_ui_challenges/presentation/small_apps/clone_whats_app/domain/entities/message.dart';

class YesNoModel{
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json){
    return YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"]
    );
  }

  Message toMessageEntity(){
    return Message(
        text: answer == 'yes' ? "Si" : "No",
        imageUrl: image,
        fromWho: FromWho.theirs
    );
  }
}
