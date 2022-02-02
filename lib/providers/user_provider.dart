import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async { // Função para atualizar o usuário
    User user = (await _authMethods.getUserDetails()) as User; // fiz um cast, não sei se está correto!
    _user = user;
    notifyListeners();
  }
}