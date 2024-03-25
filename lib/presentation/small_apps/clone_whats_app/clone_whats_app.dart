import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/presentation/small_apps/clone_whats_app/widgets/message_input_box.dart';
import 'package:flutter_ui_challenges/presentation/small_apps/clone_whats_app/widgets/my_message_bubble.dart';
import 'package:flutter_ui_challenges/presentation/small_apps/clone_whats_app/widgets/their_message_bubble.dart';

class CloneWhatsApp extends StatelessWidget {
  const CloneWhatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi amor ♥️"),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://64.media.tumblr.com/avatar_23141709bed6_128.pnj"),
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return (index % 2 == 0)
                            ? const TheirMessageBubble()
                            : const MyMessageBubble();
                      }
                  )
              ),

              const MessageInputBox()
            ],
          ),
        ),
      ),
    );
  }
}


