// home_screen.dart
import 'package:flutter/material.dart';
import 'package:main_practice/localization/l10n/generated/l10n.dart';
import 'package:main_practice/features/home/presentation/widgets/message_bubble.dart';
import 'package:main_practice/features/home/presentation/widgets/chat_input_field.dart';
import 'package:main_practice/features/home/data/models/message_model.dart';
import 'package:main_practice/features/home/data/repositories/simsimi_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Message> messages = [];

  Future<void> sendMessage(String userText) async {
    setState(() {
      messages.add(Message(sender: 'You', text: userText, time: 'Now', isCurrentUser: true));
    });

    final responseText = await getSimSimiResponse(userText);
    setState(() {
      messages.add(Message(sender: 'SimSimi', text: responseText, time: 'Now', isCurrentUser: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).home_title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(message: messages[index]);
              },
            ),
          ),
          ChatInputField(onSend: sendMessage),
        ],
      ),
    );
  }
}
