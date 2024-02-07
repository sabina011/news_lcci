import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  Map<String, dynamic>? _userData;

  // Getter to access user data
  Map<String, dynamic>? get userData => _userData;

  // Method to update user data
  void updateUserData(Map<String, dynamic> data) {
    _userData = data;
    notifyListeners(); // Notify listeners about the change
  }
}
