import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;      
    });    
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        bio: _bioController.text,
        file: _image!);    
    setState(() {
      _isLoading = false;
    });
    if (res != "success!") {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout(),
          ),
        ),
      );
    }    
  }

  void navigateToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(child: Container(), flex: 2),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64.0),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 54,
                          backgroundColor: Colors.red,
                          backgroundImage: MemoryImage(_image!))
                      : const CircleAvatar(
                          radius: 54,
                          backgroundColor: Colors.red,
                          backgroundImage:
                              AssetImage('assets/img/user/user.png'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 67,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24.0),
              // textfieldinput para username
              TextFieldInput(
                textEditingcontroller: _usernameController,
                hintText: 'Nome de usu??rio',
                keyboardType: TextInputType.text,
                isPass: false,
              ),
              const SizedBox(height: 24.0),
              // textfieldinput para email
              TextFieldInput(
                textEditingcontroller: _emailController,
                hintText: 'Entre com seu email',
                keyboardType: TextInputType.emailAddress,
                isPass: false,
              ),
              const SizedBox(height: 24.0),
              // textfieldinput para senha
              TextFieldInput(
                textEditingcontroller: _passwordController,
                hintText: 'Crie sua senha',
                keyboardType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 24.0),
              // textfieldinput para email
              TextFieldInput(
                textEditingcontroller: _bioController,
                hintText: 'Escreva sua biografia',
                keyboardType: TextInputType.text,
                isPass: false,
              ),
              const SizedBox(height: 24.0),
              // inkwell para criar conta
              InkWell(
                onTap: signUpUser,
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(color: primaryColor))
                    : Container(
                        child: const Text("Registrar"),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                          color: blueColor,
                        ),
                      ),
              ),
              const SizedBox(height: 12.0),
              Flexible(child: Container(), flex: 2),
              // linha para logar se houver conta
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: const Text("J?? tem uma conta?"),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: Container(
                      child: const Text(
                        " Entre.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
