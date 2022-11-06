import 'package:flutter/material.dart';
import 'DAO.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: conteudo(),
    );
  }

  DAO dao = new DAO();

  Widget conteudo() {
    TextEditingController _controllernome = TextEditingController();
    TextEditingController _controlleremail = TextEditingController();
    TextEditingController _controllerpassword = TextEditingController();

    return Column(
      children: [
        new Expanded(child:
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.elliptical(80, 80),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Image.asset("assets/logo_nova.png"),
          ),
        ),
          flex:5,
        ),
        SizedBox(
          height: 40,
        ),
        TextField(decoration: InputDecoration(
          labelText: "Nome: "
        ),
          controller: _controllernome,
        ),
        TextField(decoration: InputDecoration(
            labelText: "Email: "
        ),
          controller: _controlleremail,
        ),
        TextField(decoration: InputDecoration(
            labelText: "Senha: "
        ),
          controller: _controllerpassword,
        ),
        SizedBox(
          height: 20,
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
              dao.salvarDadosUsuario(_controllernome.text, "", "", "", _controlleremail.text, _controllerpassword.text);
              Navigator.of(context).pop();
            },
            child: Text(
              "Criar Conta",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
        ),
        SizedBox(
          height: 20,
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
              Navigator.of(context).pop();
            },
            child: Text(
              "Voltar ao Login",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
        ),
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
