import 'package:abyaty/core/cache_helper/cache_keys.dart';
import 'package:abyaty/core/cache_helper/shared_pref_methods.dart';
import 'package:abyaty/core/constants/constants.dart';
import 'package:abyaty/core/constants/route_exports.dart';
import 'package:abyaty/core/parameters/login_parameters.dart';
import 'package:abyaty/core/parameters/register_parameters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/services_locator.dart';
import '../../../domain/use_cases/auth_usecases/login_usecase.dart';
import '../../../domain/use_cases/auth_usecases/register_use_case.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase = sl();
  final RegisterUseCase _registerUseCase = sl();

  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  void login() async {
    emit(LoginLoading());
    final response = await _loginUseCase(LoginParameters(
      email: loginEmailController.text,
      password: loginPasswordController.text,
    ));
    response.fold((l) {
      emit(LoginError(
        error: l.baseErrorModel.message,
      ));
    }, (r) async {
      await CacheHelper.saveData(
        key: CacheKeys.token,
        value: r.result?.authToken,
      );
      token = await CacheHelper.getData(key: CacheKeys.token);
      emit(LoginSuccess(
        loginEntity: r,
      ));
    });
  }

  void register() async {
    emit(RegisterLoading());
    final response = await _registerUseCase(
      RegisterParameters(
        email: registerEmailController.text,
        name: usernameController.text,
        password: registerPasswordController.text,
      ),
    );
    response.fold((l) {
      emit(RegisterError(
        error: l.baseErrorModel.message,
      ));
    }, (r) {
      emit(RegisterSuccess(registerEntity: r));
    });
  }
}
