import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uap_app/core/colors/app_colors.dart';

class SignUpComponent extends StatelessWidget {
  final Widget firstNameField;
  final Widget secondNameField;
  final Widget emailField;
  final Widget phoneField;
  final Widget password1Field;
  final Widget registerElevatedButton;
  final Widget loginElevatedButton;

  const SignUpComponent({
    required this.firstNameField,
    required this.secondNameField,
    required this.emailField,
    required this.phoneField,
    required this.password1Field,
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
          child: Row(
            children: [
              Expanded(
                  child: Container(
                color: AppColors.color4.color,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SvgPicture.asset('undraw_profile.svg'),
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
                          loginElevatedButton,
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Primeiro Nome:',
                                  style: textStyle,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                firstNameField
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sobrenome:',
                                  style: textStyle,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                secondNameField
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
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
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Celular:',
                                  style: textStyle,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                phoneField
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
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
                                password1Field
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      registerElevatedButton,
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
