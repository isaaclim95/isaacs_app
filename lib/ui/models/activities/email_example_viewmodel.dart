import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class EmailExampleViewModel extends BaseViewModel {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final String key = "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";

  void sendUserEmail() async {
    print('Sending email...');
    sendEmail(emailController.text, subjectController.text, bodyController.text);
  }

  // Uses sendgrid api to send user an email
  void sendEmail(String email, String subject, String body) async {
    Map<String, String> headers = new Map();
    headers["Authorization"] =
    "Bearer $key";
    headers["Content-Type"] = "application/json";

    var url = 'https://api.sendgrid.com/v3/mail/send';
    var response = await http.post(url,
        headers: headers,
        body:
        "{\n          \"personalizations\": [\n            {\n              "
            "\"to\": [\n                {\n                  "
            "\"email\": \"isaaclim95@gmail.com\"\n                },\n                {\n                  "
            "\"email\": \"info@paraspace.com.au\"\n                }\n              ]\n            }\n          ],\n          "
            "\"from\": {\n            \"email\": \"isaacemailservice@gmail.com\"\n          },\n          "
            "\"subject\": \"$subject\",\n          "
            "\"content\": [\n            {\n              "
            "\"type\": \"text\/plain\",\n              "
            "\"value\": \"$body\"\n            }\n          ]\n        }");
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

}