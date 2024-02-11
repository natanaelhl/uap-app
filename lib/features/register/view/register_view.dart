import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uap_app/core/widgets/custom_app_bar_widget.dart';
import 'package:uap_app/features/register/bloc/register_bloc.dart';
import 'package:uap_app/features/register/bloc/register_event.dart';
import 'package:uap_app/features/register/view/register_view_stable_state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final RegisterBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = GetIt.I.get();

    _bloc.dispatchEvent(RegisterEventOnReady());
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
                return RegisterViewStableState(
                  bloc: _bloc,
                  state: snapshot.data!,
                );
              } else {
                return const SizedBox.shrink();
              }
            }));
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
