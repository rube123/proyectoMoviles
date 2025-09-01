import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController conUser = TextEditingController();
  TextEditingController conPwd = TextEditingController();
  bool isValidating = false;

  @override
  Widget build(BuildContext context) {
    final txtUser = TextField(
      keyboardType: TextInputType.emailAddress,
      controller: conUser,
      decoration: InputDecoration(hintText: 'Correo electronico'),
    );
    final txtPwd = TextField(
      obscureText: true,
      controller: conPwd,
      decoration: InputDecoration(hintText: 'Contraseña'),
    );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/fondo.jpg"),
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 200,
              child: Text(
                'Scorpion',
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
            Positioned(
              bottom: 50,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListView(
                  children: [
                    txtUser,
                    txtPwd,
                    IconButton(
                      onPressed: () {
                        isValidating = true;
                        setState(() {});
                      },
                      icon: Icon(Icons.login, size: 40),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 300,
              child:
                  isValidating
                      ? Lottie.asset('assets/loading2.json', height: 200)
                      : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
