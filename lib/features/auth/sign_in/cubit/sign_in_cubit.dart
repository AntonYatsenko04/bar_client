import 'package:bar_client/core/src/localization/generated/locale_keys.g.dart';
import 'package:bar_client/core/src/logger/logger.dart';
import 'package:bar_client/core/src/validators/email_validator.dart';
import 'package:bar_client/core/src/validators/password_validator.dart';
import 'package:bar_client/navigation/app_router/app_router.dart';
import 'package:bar_client/navigation/app_router/app_router.gr.dart';
import 'package:bar_client/service/exceptions/app_exception.dart';
import 'package:bar_client/service/models/auth/sign_in_model.dart';
import 'package:bar_client/service/services/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'sign_in_cubit.g.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthService _authService;
  final AppRouter _appRouter;

  SignInCubit({
    required AuthService authService,
    required AppRouter appRouter,
  })  : _authService = authService,
        _appRouter = appRouter,
        super(const SignInState(showLoading: false));

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final String? passwordError = const PasswordValidator().check(password);
      final String? emailError = const EmailValidator().check(email);
      if (passwordError == null && emailError == null) {
        emit(SignInState.empty());
        await _authService.signIn(signInModel: SignInModel(email: email, password: password));
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
      if (e.type == AppExceptionType.unAuthorized) {
        errorMessage = LocaleKeys.auth_userNotFound;
      } else {
        errorMessage = e.errorMessageKey;
      }

      AppLogger().debug(error: e.type);
      emit(state.copyWith(signInError: errorMessage));
    }
  }

  Future<void> goToSignUp() {
    return _appRouter.navigate(const SignUpRoute());
  }
}