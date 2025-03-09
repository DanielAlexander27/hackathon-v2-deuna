import 'package:flutter/material.dart';

import '../../../styles/app_colors.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onMessageSubmitted;

  const ChatInput({
    super.key,
    required this.controller,
    required this.onMessageSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 14,
        bottom: MediaQuery.paddingOf(context).bottom,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              minLines: 1,
              maxLines: 2,
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Escribe...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.purple.withValues(alpha: 0.25),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.purple,
              surfaceTintColor: Colors.white,
            ),
            onPressed: () => onMessageSubmitted(controller.text),
            icon: Icon(Icons.send, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}
