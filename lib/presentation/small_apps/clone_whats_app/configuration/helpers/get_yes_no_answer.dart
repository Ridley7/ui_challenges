import 'package:dio/dio.dart';
import 'package:flutter_ui_challenges/presentation/small_apps/clone_whats_app/domain/entities/message.dart';
import 'package:flutter_ui_challenges/presentation/small_apps/clone_whats_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer{
  final _dio = Dio();

  Future<Message> getAnswer() async{
    final response = await _dio.get("https://yesno.wtf/api");

    //Aqui mapeamos la data
    YesNoModel yesNoModel = YesNoModel.fromJson(response.data);

    //Aqui devolvemos el Message
    return yesNoModel.toMessageEntity();
  }



}