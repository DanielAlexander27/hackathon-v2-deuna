import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_v2_deuna/adapters/service/chat_bot_service_gemini.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../port/service/chat_bot_service.dart';

part 'dependencies.g.dart';

@Riverpod(keepAlive: true)
ChatBotService chatBotservice(Ref ref) {
  return ChatBotServiceGemini();
}
