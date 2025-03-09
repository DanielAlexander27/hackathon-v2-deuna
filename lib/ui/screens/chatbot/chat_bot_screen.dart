import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_v2_deuna/providers/ui/screens/chat_bot/chat_bot_view_model.dart';
import 'package:hackathon_v2_deuna/ui/screens/chatbot/widgets/chat_messages.dart';
import 'package:hackathon_v2_deuna/ui/screens/chatbot/widgets/chat_input.dart';
import 'package:hackathon_v2_deuna/ui/shared/app_bar_title.dart';
import 'package:hackathon_v2_deuna/ui/styles/app_colors.dart';

import 'widgets/chasium_thinking.dart';

class ChatBotScreen extends ConsumerStatefulWidget {
  const ChatBotScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends ConsumerState<ChatBotScreen> {
  late final TextEditingController _textController;
  late final ScrollController _scrollController;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(chatBotViewModelProvider.notifier);
    final state = ref.watch(chatBotViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        foregroundColor: Colors.white,
        title: const AppBarTitle(text: 'Cashium'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatMessages(
              messages: state.messages,
              controller: _scrollController,
            ),
          ),
          if (_isTyping) ChasiumThinking(),
          ChatInput(
            controller: _textController,
            onMessageSubmitted: (message) {
              _onMessageSubmitted(message, viewModel);
            },
          ),
        ],
      ),
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _onMessageSubmitted(
    String text,
    ChatBotViewModel chatBotViewModel,
  ) async {
    if (text.trim().isEmpty) return;

    _textController.clear();
    setState(() => _isTyping = true);

    await chatBotViewModel.sendMessage(text);

    setState(() => _isTyping = false);

    _scrollToBottom();
  }
}
