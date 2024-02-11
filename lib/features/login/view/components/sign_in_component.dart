import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uap_app/core/colors/app_colors.dart';

class SignInComponent extends StatelessWidget {
  final Widget emailField;
  final Widget passwordField;
  final Widget registerElevatedButton;
  final Widget loginElevatedButton;

  const SignInComponent({
    required this.emailField,
    required this.passwordField,
    required this.registerElevatedButton,
    required this.loginElevatedButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.color3.color,
        letterSpacing: 1);

    TextStyle textTitleStyle = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.color3.color,
        letterSpacing: 1);

    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Card(
          elevation: 5,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                color: AppColors.color4.color,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SvgPicture.asset('undraw_login.svg'),
                ),
              )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cadastre-se',
                            style: textTitleStyle,
                          ),
                          registerElevatedButton,
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'E-mail:',
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          emailField
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.015,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Senha:',
                                  style: textStyle,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                passwordField
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      loginElevatedButton,
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
