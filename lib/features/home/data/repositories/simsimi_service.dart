// simsimi_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> getSimSimiResponse(String userText) async {
  const String apiKey = 'W.9OkuiJRShJSrSlmz~JSTqIoB1JIwVguVgHBk1t';
  const String apiUrl = 'https://wsapi.simsimi.com/190410/talk';

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
      'x-api-key': apiKey,
    },
    body: jsonEncode({
      'utext': userText,
      'lang': 'kh',
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['atext'] ?? "Sorry, I didn't understand that.";
  } else {
    return 'Error: ${response.statusCode} - ${response.reasonPhrase}';
  }
}
