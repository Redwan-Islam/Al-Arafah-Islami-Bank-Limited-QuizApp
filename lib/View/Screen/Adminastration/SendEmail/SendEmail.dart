import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quiz/View/Screen/AuthScreen/WelcomeScreen.dart';
import 'package:http/http.dart' as http;

class SendEmail extends StatefulWidget {
  SendEmail({Key? key}) : super(key: key);
  static const String routename = '/SendEmail';

  @override
  State<SendEmail> createState() => _SendEmailState();
}

final nameController = TextEditingController();
final subjectController = TextEditingController();
final emailController = TextEditingController();
final messageController = TextEditingController();

Future sendEmail() async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  const serviceId = "service_ynp1e2s";
  const templateId = "template_czigpwy";
  const userId = "0hRChKddQ5-71cIeV";

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'name': nameController.text,
        'subject': subjectController.text,
        'message': messageController.text,
        'user_email': emailController.text,
      }
    }),
  );
  print(response.statusCode);
}

class _SendEmailState extends State<SendEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Send Email'),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_circle),
                  hintText: 'Enter Name',
                  labelText: 'Enter Name',
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextFormField(
                controller: subjectController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.subject_rounded),
                  hintText: 'Enter Subject',
                  labelText: 'Enter Subject',
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email_rounded),
                  hintText: 'Enter Email',
                  labelText: 'Enter Email',
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextFormField(
                controller: messageController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.message_rounded),
                  hintText: 'Enter Message',
                  labelText: 'Enter Message',
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                  onPressed: () {
                    sendEmail();
                  },
                  child: const Text(
                    'Send Email',
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
