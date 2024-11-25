// message_model.dart
class Message {
  final String sender;
  final String text;
  final String time;
  final bool isCurrentUser;

  Message({
    required this.sender,
    required this.text,
    required this.time,
    required this.isCurrentUser,
  });
}
