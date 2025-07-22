import 'package:flutter/material.dart';
import 'package:my_house_design/presentation/widgets/message.dart';
import 'package:my_house_design/presentation/widgets/assistance_message_widget.dart';
import 'package:my_house_design/presentation/widgets/chat_provider.dart';
import 'package:my_house_design/presentation/widgets/my_message_widget.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    super.key,
    required this.scrollController,
    required this.chatProvider,
  });

  final ScrollController scrollController;
  final ChatProvider chatProvider;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        itemCount: chatProvider.inChatMessages.length,
        itemBuilder: (context, index) {
          final message = 
              chatProvider.inChatMessages[index];
          return message.role.name == Role.user.name 
              ? MyMessageWidget(message: message) 
              : AssistanceMessageWidget(
                  message: message.message.toString());
        },
                      );
  }
}