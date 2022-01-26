import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({ Key? key }) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(), 
                flex: 2
              ),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(
                height: 64.0
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 54,
                    backgroundColor: Colors.red,
                    backgroundImage: NetworkImage( // imagem não está carregando!
                      'https://i.stack.imgur.com/l60Hf.png'),                          
                  ),                
                  Positioned(
                    bottom: -10,
                    left: 67,
                    child: IconButton(onPressed: () {},
                     icon: const Icon(Icons.add_a_photo,),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24.0
              ),
              // textfieldinput para username
              TextFieldInput(
                textEditingcontroller: _usernameController,
                hintText: 'Nome de usuário',
                keyboardType: TextInputType.text,
                isPass: false,                                              
              ),
              const SizedBox(
                height: 24.0
              ),
              // textfieldinput para email
              TextFieldInput(
                textEditingcontroller: _emailController,
                hintText: 'Entre com seu email',
                keyboardType: TextInputType.emailAddress,               
                isPass: false,                               
              ),
              const SizedBox(
                height: 24.0
                ),
              // textfieldinput para senha
              TextFieldInput(
                textEditingcontroller: _passwordController,
                hintText: 'Crie sua senha',
                keyboardType: TextInputType.text,
                isPass: true,                                              
              ),
              const SizedBox(
                height: 24.0
              ),
              // textfieldinput para email
              TextFieldInput(
                textEditingcontroller: _bioController,
                hintText: 'Escreva sua biografia',
                keyboardType: TextInputType.text,
                isPass: false,                                              
              ),
              const SizedBox(
                height: 24.0
              ),              
              // inkwell para registrar (botão)
              InkWell(
                child: Container(
                  child: const Text("Registrar"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0)
                      ),
                    ),
                    color: blueColor,
                  ),              
                ),
              ),
              const SizedBox(
                  height: 12.0
              ),
              Flexible(
                child: Container(),
                 flex: 2
              ),
              // linha para logar se houver conta
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: const Text("Já tem uma conta?"),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},  
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