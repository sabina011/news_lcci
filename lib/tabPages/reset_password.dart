import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../HTTPPackages/api_services.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late FlutterSecureStorage storage;
  ApiService _apiService = ApiService('https://lekhnathcci.org.np/api/');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _reset() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
    }
  }

  Widget buildLoginButton() {
    return Center(
      child: GestureDetector(
        onTap: _reset,
        child: Container(
          width: 250,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const Center(
            child: Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderText('Reset Password', 28),
                  const SizedBox(height: 40),
                  _buildTextField(
                    _emailController, 'Email Id', validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email Id';
                    }
                    return null;
                  },
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    _passwordController, 'Password', isPassword: true, validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    _confirmPasswordController, 'Confirm Password', isPassword: true, validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password again';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  ),
                  SizedBox(height: 80),
                  buildLoginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText,
      {bool isPassword = false, String? Function(String?)? validate}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ? !_showPassword : false,
      validator: validate,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: 'Enter your $labelText',
        enabledBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        hintStyle: const TextStyle(color: Colors.black),
        labelStyle: const TextStyle(color: Colors.black),
        suffixIcon: isPassword ? IconButton(
          icon: Icon(
            _showPassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
        )
            : null,
      ),
      style: const TextStyle(color: Colors.black),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(14.0),
    );
  }

  Widget _buildHeaderText(String text, double fontSize,
      [Color textColor = Colors.black]) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );
  }
}
