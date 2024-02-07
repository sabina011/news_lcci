import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news/tabPages/reset_password.dart';
import 'package:provider/provider.dart';
import '../HTTPPackages/api_services.dart';
import '../afterlogin/homepage_afterlogin.dart';
import '../providers/userdata_providers.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late FlutterSecureStorage storage;
  final ApiService _apiService = ApiService('https://lekhnathcci.org.np/api/');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    storage = FlutterSecureStorage();
  }

  Future<void> _login() async {
    await saveCredentials("newMember");
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;

      try {
        final response = await _apiService.login(username, password);
        if (response['status'] == 200 && response['success'] == true) {
          final userData = response['data'];
          final userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
          userDataProvider.updateUserData(userData);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePageAfterLogin()),
          );
          _showToast("Login Successfully");
        } else {
          _showToast(response['message']);
        }
      } catch (e) {
        _showToast("Error: $e");
      }
    }
  }

  Widget buildLoginButton() {
    return Center(
      child: GestureDetector(
        onTap: _login,
        child: Container(
          width: 250,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const Center(
            child: Text(
              'LOGIN',
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

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderText('Welcome to LCCI', 28),
                  const SizedBox(height: 20),
                  _buildHeaderText('Let\'s Login', 20),
                  const SizedBox(height: 40),
                  _buildTextField(_usernameController, 'Username', validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Username';
                    }
                    return null;
                  },
                  ),
                  const SizedBox(height: 40),
                  _buildTextField(_passwordController, 'Password',
                    isPassword: true,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPassword(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: Color(0xFFE76100),
                          fontSize: 18,
                        ),
                      ),
                    ),
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
        suffixIcon: isPassword
            ? IconButton(
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

  Future<void> saveCredentials(String username) async {
    await storage.write(key: 'username', value: username,);
  }
}


