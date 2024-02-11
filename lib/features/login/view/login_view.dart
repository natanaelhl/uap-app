import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uap_app/core/widgets/custom_app_bar_widget.dart';
import 'package:uap_app/features/login/bloc/login_bloc.dart';
import 'package:uap_app/features/login/bloc/login_event.dart';
import 'package:uap_app/features/login/view/login_view_stable_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginBloc _bloc;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    _bloc = GetIt.I.get();

    _bloc.dispatchEvent(LoginEventOnReady());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBarWidget(
            title: Text(
          'UAP',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
        )),
        body: StreamBuilder(
            stream: _bloc.state,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return LoginViewStableState(bloc: _bloc, state: snapshot.data!);
              } else {
                return const SizedBox.shrink();
              }
            }));
  }
}
