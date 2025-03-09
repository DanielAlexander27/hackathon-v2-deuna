import 'package:flutter/material.dart';
import 'package:hackathon_v2_deuna/ui/screens/chatbot/widgets/message_bubble.dart';
import 'package:hackathon_v2_deuna/ui/styles/app_colors.dart';

import '../../../../domain/model/message.dart';

class ChatMessages extends StatelessWidget {
  final List<Message> messages;
  final ScrollController controller;

  const ChatMessages({
    super.key,
    required this.messages,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return messages.isEmpty
        ? _EmptyMessage()
        : ListView.builder(
          controller: controller,
          padding: const EdgeInsets.all(16),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];

            return MessageBubble(
              message: message,
              isLastMessage: index == messages.length - 1,
            );
          },
        );
  }
}

class _EmptyMessage extends StatelessWidget {
  const _EmptyMessage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.chat_bubble_outline, size: 80, color: AppColors.purple),
          const SizedBox(height: 4),
          Text(
            '¿En qué puedo ayudarte hoy?',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.purple,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
