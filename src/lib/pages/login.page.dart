import 'package:echo_store/pages/forgot.password.page.dart';
import 'package:echo_store/pages/home.page.dart';
import 'package:echo_store/pages/register.page.dart';
import 'package:echo_store/services/auth.service.dart';
import 'package:echo_store/utils/color.pallete.dart';
import 'package:echo_store/utils/toasts.dart';
import 'package:echo_store/widgets/echo.button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../router/router.dart';
import '../utils/sizes.dart';
import '../widgets/echo.input.widget.dart';
import '../widgets/echo.page.widget.dart';

class LoginPage extends StatefulWidget {
  
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameInputController = TextEditingController();
  final passwordInputController = TextEditingController();

  final AuthService _authService = AuthService();
  
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  void dispose() {
    usernameInputController.dispose();
    passwordInputController.dispose();
    super.dispose();
  }

  void pushForgotPasswordPage() =>
      EchoRouter.pushReplacement(const ForgotPasswordPage(), context);

  void pushRegisterPage() =>
      EchoRouter.pushReplacement(const RegisterPage(), context);

  void pushHomePage() 
    => EchoRouter.pushReplacement(const HomePage(), context);

  void loginAsync() async {
    if(usernameInputController.text == "") {
      Toasts.errorToast("O usuário não pode ser vazio!");
    }

    if(passwordInputController.text == "") {
      Toasts.errorToast("A senha não pode ser vazia!");
    }

    var username = usernameInputController.text;
    var password = passwordInputController.text;

    var isAuthenticated = await _authService.loginAsync(username, password);

    if(isAuthenticated){
      pushHomePage();
    }
    else{
      Toasts.errorToast("Usuário e/ou senha estão inválidos!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EchoPage(Center(
      child: Container(
        alignment: Alignment.center,
        width: Sizes.getPercentWidth(context, 85),
        height: Sizes.getPercentHeight(context, 55),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: EchoInput(
              controller: usernameInputController,
              icon: Icons.person,
              borderSide: 2,
              fontSize: 16,
              keyboardType: TextInputType.name,
              hintText: "Digite seu usuário")),
          
          Padding(
            padding: const EdgeInsets.only(top: 35, bottom: 10),
            child: EchoInput(
              controller: passwordInputController,
              icon: Icons.lock,
              borderSide: 2,
              passwordField: true,
              fontSize: 16,
              hintText: "Digite sua senha")),
          
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
                          "Esqueceu sua senha?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              color: ColorPallete.fontColor),
                        ),
                        onTap: () => pushForgotPasswordPage(),
                      )
                    )
                  ),

              Padding(
                  padding: EdgeInsets.only(right: Sizes.getPercentWidth(context, 2.5)),
                  child: SizedBox(
                    width: Sizes.getPercentWidth(context, 40),
                    height: Sizes.getPercentHeight(context, 3),
                    child: InkWell(
                      child: const Text(
                        "Cadastre-se",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: ColorPallete.darkFontColor),
                        ),
                        onTap: () => pushRegisterPage(),
                      )
                    )
                  )
              ],
            )
          ),

          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: EchoButton(
              text: "Entrar",
              width: Sizes.getPercentWidth(context, 55),
              height: 45,
              onPressed: loginAsync),
          )
        ]),
      ),
    )));
  }
}
