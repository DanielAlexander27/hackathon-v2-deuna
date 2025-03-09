import 'package:flutter/material.dart';
import '../../../../domain/model/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isLastMessage;

  const MessageBubble({
    super.key,
    required this.message,
    this.isLastMessage = false,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;
    final bubbleColor =
        isUser
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondaryContainer;
    final textColor =
        isUser
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onSecondaryContainer;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) _buildAvatar(context),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft:
                      isUser
                          ? const Radius.circular(20)
                          : const Radius.circular(4),
                  bottomRight:
                      isUser
                          ? const Radius.circular(4)
                          : const Radius.circular(20),
                ),
              ),
              child: Text(
                message.content,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(width: 8),
          if (isUser) _buildAvatar(context, isUser: true),
        ],
      ),
    );
  }

  Widget _buildAvatar(BuildContext context, {bool isUser = false}) {
    return CircleAvatar(
      radius: 16,
      backgroundColor:
          isUser
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.tertiaryContainer,
      backgroundImage:
          isUser
              ? null // No ponemos imagen si es usuario
              : AssetImage(
                "assets/images/chasium_logo.jpg",
              ), // Ruta de la imagen del bot
      child:
          isUser
              ? Icon(
                Icons.person,
                size: 18,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              )
              : null, // Si hay imagen, eliminamos el icono para evitar superposición
    );
  }
}
