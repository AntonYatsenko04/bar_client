part of 'sign_up_cubit.dart';

final class SignUpState {
  final String? emailError;
  final String? passwordError;
  final String? signUpError;
  final bool showLoading;
  final bool passwordVisible;

  const SignUpState({
    required this.showLoading,
    required this.passwordVisible,
    this.emailError,
    this.passwordError,
    this.signUpError,
  });

  SignUpState.empty()
      : showLoading = false,
        passwordVisible = false,
        emailError = null,
        passwordError = null,
        signUpError = null;

  SignUpState copyWith({
    String? emailError,
    String? passwordError,
    String? signUpError,
    bool? showLoading,
    bool? passwordVisible,
  }) {
    return SignUpState(
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      signUpError: signUpError ?? this.signUpError,
      showLoading: showLoading ?? this.showLoading,
      passwordVisible: passwordVisible ?? this.passwordVisible,
    );
  }
}
