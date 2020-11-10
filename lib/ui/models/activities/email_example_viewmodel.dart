import 'package:flutter/material.dart';
import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/services/email_service.dart';
import 'package:stacked/stacked.dart';

class EmailExampleViewModel extends BaseViewModel {

  EmailService emailService = locator<EmailService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final String key = "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";

  void sendUserEmail() async {
    print('Sending email...');
    emailService.sendEmail(emailController.text, 'isaacemailservice@gmail.com', subjectController.text, bodyController.text);
  }



}