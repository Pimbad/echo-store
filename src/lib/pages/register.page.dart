import 'package:echo_store/pages/login.page.dart';
import 'package:echo_store/utils/color.pallete.dart';
import 'package:echo_store/utils/sizes.dart';
import 'package:echo_store/utils/toasts.dart';
import 'package:echo_store/widgets/echo.button.widget.dart';
import 'package:echo_store/widgets/echo.input.widget.dart';
import 'package:flutter/material.dart';

import '../router/router.dart';
import '../widgets/echo.page.widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final nameInputController = TextEditingController();
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();

  @override
  void dispose() { //garbage collector da shopee
    nameInputController.dispose();
    emailInputController.dispose();
    passwordInputController.dispose();
    super.dispose();
  }

  void pushLoginPage() =>
    EchoRouter.pushReplacement(const LoginPage(), context);
  

  void registerAsync() async {
    if(nameInputController.text == "") {
      Toasts.errorToast("O campo nome não pode estar vazio!");
    }    
    
    if(emailInputController.text == "") {
      Toasts.errorToast("O campo do seu email não pode estar vazio!");
    }

    if(passwordInputController.text == "") {
      Toasts.errorToast("A senha não pode ser vazia!");
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: EchoPage(Center(
      child:Container(
        alignment: Alignment.center,
        width: Sizes.getPercentWidth(context, 85),
        height: Sizes.getPercentHeight(context, 60),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: EchoInput(controller: nameInputController,
              icon: Icons.person,
              borderSide: 2,
              fontSize: 16,
              keyboardType: TextInputType.name,
              hintText: "Digite seu nome completo")),

          Padding(
            padding: const EdgeInsets.only(top: 35, bottom: 10),
            child: EchoInput(controller: emailInputController,
              icon: Icons.mail,
              borderSide: 2,
              fontSize: 16,
              hintText: "Digite seu e-mail")),

          Padding(
            padding: const EdgeInsets.only(top: 35, bottom: 10),
            child: EchoInput(
              controller: passwordInputController,
              icon: Icons.lock,
              borderSide: 2,
              passwordField: true,
              fontSize: 16,
              hintText: "Defina sua senha")),

          Center(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Sizes.getPercentWidth(context, 2.5)),
                  child: SizedBox(
                    width: Sizes.getPercentWidth(context, 40),
                    height: Sizes.getPercentHeight(context, 3),
                    child: InkWell(
                      child: const Text(
                        "Já possui conta?",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          color: ColorPallete.fontColor),
                        ),
                        onTap: () => pushLoginPage(),                      
                      )
                    )
                  )
                ]
              )
          ),

          Padding(
            padding: const EdgeInsets.only(top:100),
            child: EchoButton(
              text: "Finalizar Cadastro",
              width: Sizes.getPercentWidth(context, 55),
              height: 45,
              onPressed: registerAsync)
            )
          ]),
        ),
      )
    ));
  }
}
