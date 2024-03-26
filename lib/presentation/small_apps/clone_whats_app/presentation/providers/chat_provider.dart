import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_challenges/presentation/small_apps/clone_whats_app/configuration/helpers/get_yes_no_answer.dart';
import 'package:flutter_ui_challenges/presentation/small_apps/clone_whats_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  final chatScrollController = ScrollController();
  List<Message> _messageList = [];

  List<Message> getMessageList(){
    return _messageList;
  }

  Future<void> sendMessage(String text) async{
    //Validamos que no esta en blanco
    if(text.isEmpty) return;

    //Creamos objeto de la clase Message
    Message new_message = Message(text: text, fromWho: FromWho.me);
    _messageList.add(new_message);

    //Si nuestro texto acaba con '?' simulamos una respuesta
    if(text.endsWith('?')){
      theirReply();
    }

    //Notificamos al todo el widget tree
    notifyListeners();
    //Hacemos scroll
    moveScrollToBottom();

  }

  Future<void> theirReply() async{
    final theirMessage = await getYesNoAnswer.getAnswer();
    _messageList.add(theirMessage);

    notifyListeners();
    //Hacemos scroll
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async{
    //Necesitamos esperar un poco ya que flutter se puede
    //liar con el repitando y la animacion del scroll y no
    //queda un comportamiento natural
    Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut
    );
  }
}