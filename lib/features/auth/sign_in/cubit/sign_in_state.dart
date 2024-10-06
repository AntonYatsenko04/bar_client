part of 'sign_in_cubit.dart';

@CopyWith()
final class SignInState {
  final String? emailError;
  final String? passwordError;
  final String? signInError;
  final bool showLoading;

  const SignInState({
    required this.showLoading,
    this.emailError,
    this.passwordError,
    this.signInError,
  });

  SignInState.empty()
      : showLoading = false,
        emailError = null,
        passwordError = null,
        signInError = null;
}
