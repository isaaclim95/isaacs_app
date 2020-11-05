import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class EmailExampleViewModel extends BaseViewModel {

  final TextEditingController emailController = TextEditingController();
  final String port = "25";
  final String username = "apikey";
  final String password = "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";

  void sendUserEmail() async {
    print('Sending email...');
    print(emailController.text);
    sendEmail('isaaclim95@gmail.com', 'You\'ve been invited to use InspectionApp',
        'bruh');
  }

  // Uses sendgrid api to send user an email
  void sendEmail(String email, String subject, String emailBody) async {
    Map<String, String> headers = new Map();
    headers["Authorization"] =
    "Bearer $password";
    headers["Content-Type"] = "application/json";

    var url = 'https://api.sendgrid.com/v3/mail/send';
    var response = await http.post(url,
        headers: headers,
        body:
        "{\n          \"personalizations\": [\n            {\n              "
            "\"to\": [\n                {\n                  "
            "\"email\": \"isaaclim95@gmail.com\"\n                },\n                {\n                  "
            "\"email\": \"info@paraspace.com.au\"\n                }\n              ]\n            }\n          ],\n          "
            "\"from\": {\n            \"email\": \"info@paraspace.com.au\"\n          },\n          "
            "\"subject\": \"$subject\",\n          "
            "\"content\": [\n            {\n              "
            "\"type\": \"text\/plain\",\n              "
            "\"value\": \"$emailBody\"\n            }\n          ]\n        }");
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

}