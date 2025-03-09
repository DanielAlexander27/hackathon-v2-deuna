import 'package:hackathon_v2_deuna/port/service/chat_bot_service.dart';
import 'package:hackathon_v2_deuna/providers/dependencies/dependencies.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/model/message.dart';

part 'chat_bot_view_model.g.dart';

@Riverpod(keepAlive: true)
class ChatBotViewModel extends _$ChatBotViewModel {
  late final ChatBotService chatBotService;

  @override
  ChatBotUiState build() {
    chatBotService = ref.read(chatBotserviceProvider);
    return ChatBotUiState();
  }

  Future<void> sendMessage(String input) async {
    if (input.trim().isEmpty) return;

    // Add user message
    final userMessage = Message(content: input, isUser: true);

    state = ChatBotUiState(
      messages: [...state.messages, userMessage],
      isLoading: true,
    );

    try {
      final response = await chatBotService.generateMessage(input);
      // Add bot message
      final botMessage = Message(content: response, isUser: false);
      _addMessage(botMessage);
    } catch (e) {
      // Add error message
      final errorMessage = Message(
        content: 'Sorry, I encountered an error: ${e.toString()}',
        isUser: false,
      );
      _addMessage(errorMessage);
    } finally {
      state = state.copy(isLoading: false);
    }
  }

  void _addMessage(Message message) {
    state = state.copy(messages: [...state.messages, message]);
  }

  void clearChat() {
    state = ChatBotUiState();
  }
}

class ChatBotUiState {
  final List<Message> messages;
  final bool isLoading;

  ChatBotUiState({this.messages = const [], this.isLoading = false});

  ChatBotUiState copy({List<Message>? messages, bool? isLoading}) =>
      ChatBotUiState(
        messages: messages ?? this.messages,
        isLoading: isLoading ?? this.isLoading,
      );
}
