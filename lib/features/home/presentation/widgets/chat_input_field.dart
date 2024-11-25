// chat_input_field.dart
import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  final Function(String) onSend;

  ChatInputField({required this.onSend});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: Colors.grey[200],
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.add, color: Colors.blue), onPressed: () {}),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Type a message",
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  onSend(value);
                  _controller.clear();
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.blue),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                onSend(_controller.text);
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
