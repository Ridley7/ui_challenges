import 'package:flutter/material.dart';

class MessageInputBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageInputBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: (){
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
      )
    );

    return TextFormField(
      onTapOutside: (event){
        focusNode.unfocus();
      },
      focusNode: focusNode,
      decoration: inputDecoration,
      controller: textController,
      onFieldSubmitted: (value){
        textController.clear();
        focusNode.requestFocus();

        //Aqui enviamos mensaje
        onValue(value);
      },
    );
  }
}
