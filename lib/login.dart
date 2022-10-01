import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: conteudo(),
    );
  }

  Widget conteudo() {
    return Column(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(80, 80),
                  bottomLeft: Radius.elliptical(80, 80),
              ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Image.asset("logo.png"),
          ),
        ),
        SizedBox(
          height: 60,
        ),
        inputStyle("Enter your username"),
        SizedBox(
          height: 20,
        ),
        inputStyle("Enter your password"),
        SizedBox(
          height: 60,
        ),
        Container(
          height: 60,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(20),
          ),
          child: TextButton(
            onPressed: (){
              Navigator.of(context).pushNamed("/home");
            },
            child: Text(
              "Login",
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      text: "Não tem uma conta? ",
                      style: TextStyle(fontSize: 15, color: Colors.grey[850])
                  ),
                  TextSpan(
                      text: "Criar conta",
                      style: TextStyle(fontSize: 15, color: Colors.orangeAccent[700]),
                      recognizer: TapGestureRecognizer()..onTap=(){
                        Navigator.of(context).pushNamed("/register");
                      }),
                ],
            ),
        )
      ],
    );
  }
}

Widget inputStyle(String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(40, 5, 20, 10),
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3))
                ]),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10),
                  hintText: title),
            ),
          ),
        ),
      ],
    ),
  );
}
