part of 'sign_up_cubit.dart';

@CopyWith()
final class SignUpState {
  final String? emailError;
  final String? passwordError;
  final String? signUpMessage;
  final bool showLoading;

  const SignUpState({
    required this.showLoading,
    this.emailError,
    this.passwordError,
    this.signUpMessage,
  });

  SignUpState.empty()
      : showLoading = false,
        emailError = null,
        passwordError = null,
        signUpMessage = null;
}
