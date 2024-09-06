import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:convert';
import 'dart:math';

import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import '../forget_password/forget_password_otp/forget_password_otp_screen.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({Key? key}) : super(key: key);

  @override
  _SignUpFormWidgetState createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  String? _name, _phone, _email;
  int _randomNumber = 0;

  final TextEditingController _cname = TextEditingController();
  final TextEditingController _cemail = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final supabase = Supabase.instance.client;

  void data() async {
    final response = await supabase.from('profiles').insert({
      'name': _cname.text,
      'email': _cemail.text,
      'phone': _phoneNo.text,
      'password': _password.text,
      //'uid': uid, // Uncomment and use this if you have the 'uid' variable set
    });

    if (response.error != null) {
      print('Error inserting data: ${response.error!.message}');
    } else {
      print('Data inserted successfully: ${response.data}');
    }
  }


  Future<void> _sendOTP() async {
    final phoneNumber = _phoneNo.text;
    _randomNumber = 100000 + Random().nextInt(900000);

    final url = Uri.parse('https://www.fast2sms.com/dev/bulkV2');
    final headers = {
      "authorization":
      "SOtq7kywLeozgV1dhTibYUKJGuxvDspjfH5IX9lNrMWcPR8A64X7vzFlDMWhEQxrCLdym3ie65TuK2Zj",
      "Content-Type": "application/json"
    };

    final body = json.encode({
      "route": "otp",
      "variables_values": _randomNumber.toString(),
      "numbers": phoneNumber,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print('OTP sent successfully');
        // Show success message or navigate
      } else {
        print('Failed to send OTP: ${response.statusCode} ${response.body}');
        // Show error message
      }
    } catch (e) {
      print('Error sending OTP: $e');
      // Show error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _cname,
              decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(Icons.person_outline_rounded)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
                _name = value;
              },
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: _cemail,
              decoration: const InputDecoration(
                  label: Text(tEmail),
                  prefixIcon: Icon(Icons.person_outline_rounded)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return "Please enter valid email";
                }
                return null;
              },
              onSaved: (value) {
                _email = value;
              },
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: _phoneNo,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  label: Text('Phone no'),
                  prefixIcon: Icon(Icons.phone_outlined)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                if (value.length < 10 || value.length > 10) {
                  return "Please enter valid phone number";
                }
                // Additional phone number validation can be added here
                return null;
              },
              onSaved: (value) {
                _phone = value;
              },
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: _password,
              decoration: const InputDecoration(
                  label: Text('Password'),
                  prefixIcon: Icon(Icons.fingerprint_sharp),
                  suffixIcon: Icon(Icons.remove_red_eye_sharp)),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onSaved: (value) {
                _password.text = value!;
              },
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: _confirmPassword,
              decoration: const InputDecoration(
                  label: Text('Confirm Password'),
                  prefixIcon: Icon(Icons.fingerprint),
                  suffixIcon: Icon(Icons.remove_red_eye_sharp)),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _password.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: tFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    _formKey.currentState?.save();
                    data();
                    _sendOTP();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPasswordOtpScreen(
                                otp: _randomNumber.toString())));
                  }
                },
                child: Text(tSignup.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
