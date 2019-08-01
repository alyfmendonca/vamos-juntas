import 'package:flutter/material.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextStyle style = TextStyle(fontSize: 18.0, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    final nameField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Nome",
          hintStyle: style,
          
          )
    );
    final sobrenomeField = TextField(
      obscureText: false,
      style: style,
      textInputAction: TextInputAction.done,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Sobrenome",
          hintStyle: style,
        )
    );
    final nascimentoField = TextField(
      obscureText: false,
      style: style,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Data de Nascimento",
          hintStyle: style,
        )
    );
    final profissaoField = TextField(
      obscureText: false,
      style: style,
      textInputAction: TextInputAction.done,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Profissão",
          hintStyle: style,
        )
    );
    final descrevaField = TextField(
      obscureText: false,
      style: style,
      textInputAction: TextInputAction.done,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Descreva Você",
          hintStyle: style,
        )
    );
    final phoneField = TextField(
      obscureText: false,
      style: style,
      textInputAction: TextInputAction.done,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Celular",
          hintStyle: style,
        )
    );
    final passwordField = TextField(
        obscureText: true,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Password",
            hintStyle: style,
          )
    );


    final proceedButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color.fromRGBO(16,102,127, 0.5),
//      color: Color(0xff1066E3),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterScreen()),
          );
        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
            child: Container(
//              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              color: Colors.amber[100],
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 0.0,
//                      child: Image.asset(
//                        "assets/waiter.png",
//                        fit: BoxFit.contain,
//                      ),
                    ),
                    Text(
                        'Cadastro',
                        style: TextStyle(color: Colors.orange[900], fontSize: 25.0, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 45.0),
                    nameField,
                    SizedBox(height: 25.0),
                    sobrenomeField,
                    SizedBox(height: 25.0),
                    nascimentoField,
                    SizedBox(height: 25.0),
                    profissaoField,
                    SizedBox(height: 25.0),
                    descrevaField,
                    SizedBox(height: 25.0),
                    phoneField,
                    SizedBox(
                      height: 35.0,
                    ),
                    proceedButton,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}