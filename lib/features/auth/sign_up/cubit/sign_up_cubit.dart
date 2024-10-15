import 'package:bar_client/core/src/localization/generated/locale_keys.g.dart';
import 'package:bar_client/core/src/validators/email_validator.dart';
import 'package:bar_client/core/src/validators/password_validator.dart';
import 'package:bar_client/navigation/app_router/app_router.dart';
import 'package:bar_client/navigation/app_router/app_router.gr.dart';
import 'package:bar_client/service/exceptions/app_exception.dart';
import 'package:bar_client/service/models/auth/sign_in_model.dart';
import 'package:bar_client/service/services/auth_service.dart';
import 'package:bloc/bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthService _authService;
  final AppRouter _appRouter;

  SignUpCubit({
    required AuthService authService,
    required AppRouter appRouter,
  })  : _authService = authService,
        _appRouter = appRouter,
        super(SignUpState.empty());

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final String? passwordError = const PasswordValidator().check(password);
      final String? emailError = const EmailValidator().check(email);
      emit(SignUpState.empty());
      if (passwordError == null && emailError == null) {
        await _authService.signUp(signInModel: SignInModel(email: email, password: password));
        emit(state.copyWith(signUpError: LocaleKeys.auth_userSuccessfullyCreated));
      } else {
        emit(
          state.copyWith(
            emailError: emailError,
            passwordError: passwordError,
          ),
        );
      }
    } on AppException catch (e) {
      final String errorMessage;
      if (e.type == AppExceptionType.resourceAlreadyExists) {
        errorMessage = LocaleKeys.auth_userAlreadyExists;
      } else {
        errorMessage = e.errorMessageKey;
      }

      emit(state.copyWith(signUpError: errorMessage));
    }
  }

  void goToSignIn() {
    _appRouter.navigate(const SignInRoute());
  }

  void changePasswordVisibility() {
    emit(state.copyWith(passwordVisible: !state.passwordVisible));
  }
}
