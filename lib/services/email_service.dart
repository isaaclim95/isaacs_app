import 'package:http/http.dart' as http;


class EmailService  {

  String key = "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";

  /// Uses the SendGrid api to send an email with subject and body
  void sendEmail(String to, String from, String subject, String body) async {

    Map<String, String> headers = new Map();
    headers["Authorization"] = "Bearer $key";
    headers["Content-Type"] = "application/json";
    var url = 'https://api.sendgrid.com/v3/mail/send';
    var response = await http.post(url,
        headers: headers,
        body:
        "{\n          \"personalizations\": [\n            {\n              "
            "\"to\": [\n                {\n                  "
            "\"email\": \"$to\"\n                },\n                {\n                  "
            "\"email\": \"info@paraspace.com.au\"\n                }\n              ]\n            }\n          ],\n          "
            "\"from\": {\n            \"email\": \"$from\"\n          },\n          "
            "\"subject\": \"$subject\",\n          "
            "\"content\": [\n            {\n              "
            "\"type\": \"text\/plain\",\n              "
            "\"value\": \"$body\"\n            }\n          ]\n        }");
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}