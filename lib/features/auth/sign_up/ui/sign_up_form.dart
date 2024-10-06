import 'package:bar_client/core/src/localization/generated/locale_keys.g.dart';
import 'package:bar_client/core_ui/src/widgets/app_scaffold.dart';
import 'package:bar_client/core_ui/src/widgets/height_spacer.dart';
import 'package:bar_client/core_ui/src/widgets/text_fields/app_text_field.dart';
import 'package:bar_client/features/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final SignUpCubit cubit = context.read<SignUpCubit>();

    return AppScaffold(
      title: LocaleKeys.auth_signUp.tr(),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (BuildContext context, SignUpState state) {
          final String? emailError = state.emailError;
          final String? passwordError = state.passwordError;
          final String? signInError = state.signUpMessage;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (signInError != null) ...<Widget>[Text(signInError.tr())],
              const HeightSpacer(),
              AppTextField(
                controller: _emailController,
                error: emailError != null ? Text(emailError.tr()) : null,
              ),
              const HeightSpacer(),
              AppTextField(
                controller: _passwordController,
                error: passwordError != null ? Text(passwordError.tr()) : null,
              ),
              const HeightSpacer(),
              FilledButton(
                onPressed: () {
                  cubit.signUp(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                },
                child: Text(
                  LocaleKeys.auth_signUp.tr(),
                ),
              ),
              const HeightSpacer(),
              FilledButton(
                onPressed: cubit.goToSignIn,
                child: Text(
                  LocaleKeys.auth_signIn.tr(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
