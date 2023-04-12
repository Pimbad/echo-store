import 'package:echo_store/pages/login.page.dart';
import 'package:echo_store/pages/register.page.dart';
import 'package:echo_store/router/router.dart';
import 'package:echo_store/utils/color.pallete.dart';
import 'package:echo_store/utils/sizes.dart';
import 'package:echo_store/utils/toasts.dart';
import 'package:echo_store/widgets/echo.button.widget.dart';
import 'package:echo_store/widgets/echo.input.widget.dart';
import 'package:echo_store/widgets/echo.page.widget.dart';
import 'package:flutter/material.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<StatefulWidget> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final usernameInputController = TextEditingController();

  void pushLoginPage() =>
      EchoRouter.pushReplacement(const LoginPage(), context);

  void pushRegisterPage() =>
      EchoRouter.pushReplacement(const RegisterPage(), context);

  void sendRecoveryLinkAsync() async {
    if(usernameInputController.text == "") {
      Toasts.errorToast("O usuário não pode ser vazio!");
    }
    else{
      Toasts.messageToast("Para recuperar sua conta, confira seu email!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EchoPage(
        Center(
          child: Container(
            alignment: Alignment.center,
            width: Sizes.getPercentWidth(context, 85),
            height: Sizes.getPercentHeight(context, 55),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 15),
                child: EchoInput(
                  controller: usernameInputController,
                  icon: Icons.person,
                  borderSide: 2,
                  fontSize: 16,
                  keyboardType: TextInputType.name,
                  hintText: "Digite seu usuário")),

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
                            "Ja tem uma conta?",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              color: ColorPallete.fontColor),
                          ),
                        onTap: () => pushLoginPage(),
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
                text: "Recuperar Conta",
                width: Sizes.getPercentWidth(context, 55),
                height: 45,
                onPressed: sendRecoveryLinkAsync),
              ),
            ]),
          ),
        )
      ));
  }
}
