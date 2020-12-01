import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/services/email_service.dart';
import 'package:stacked/stacked.dart';

class EmailExampleViewModel extends BaseViewModel {
  EmailService emailService = locator<EmailService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final String key =
      "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";

  void sendUserEmail() async {
    print('Sending email...');
    setBusy(true);
    var success = await emailService.sendEmail(
        emailController.text,
        'isaacemailservice@gmail.com',
        subjectController.text,
        bodyController.text);
    if (success) {
      Fluttertoast.showToast(
          msg: "Email sent.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Email send failed.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    setBusy(false);
  }
}
