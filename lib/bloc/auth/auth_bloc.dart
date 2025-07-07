import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippify/helpers/common_methods.dart';
import 'package:trippify/models/user_model.dart';
import 'package:trippify/utils/auth_methods.dart';
import 'package:trippify/utils/firestore_methods.dart';
import 'package:trippify/utils/shared_prefs_methods.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthMethods authMethods = AuthMethods();
  final FirestoreMethods firestoreMethods = FirestoreMethods();

  AuthBloc() : super(AuthInitial()) {
    on<LoginRequest>((event, emit) async {
      emit(AuthLoading());

      try {
        final email = event.email;
        final password = event.password;

        if (email.isEmpty || password.isEmpty) {
          return emit(AuthFailure('Please fill all the fields.'));
        }

        if (!isEmailValid(email)) {
          return emit(AuthFailure('Please enter a valid email.'));
        }

        if (password.length < 6) {
          return emit(AuthFailure('Please enter a valid password.'));
        }

        final userId = await authMethods.loginWithEmail(email, password);

        final userModel = await firestoreMethods.getUserInfo(userId!);

        SharedPrefsMethods.saveUserInfo(userModel);

        emit(AuthSuccess('Login successfully!'));
      } catch (error) {
        return emit(AuthFailure(error.toString()));
      }
    });

    on<SignUpRequest>((event, emit) async {
      emit(AuthLoading());

      try {
        final email = event.email;
        final password = event.password;
        final confirmPassword = event.confirmPassword;
        if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
          return emit(AuthFailure('Please fill all the fields.'));
        }

        if (!isEmailValid(email)) {
          return emit(AuthFailure('Please enter a valid email.'));
        }

        if (password != confirmPassword) {
          return emit(AuthFailure('Please confirm your password again.'));
        }

        if (password.length < 6) {
          return emit(AuthFailure('Please enter a valid password.'));
        }
        final userId = await authMethods.signUpWithEmail(email, password);

        SharedPrefsMethods.saveUserId(userId ?? '');

        emit(AuthSuccess('Registered successfully!'));
      } catch (error) {
        return emit(AuthFailure(error.toString()));
      }
    });

    on<CreateProfile>((event, emit) {
      emit(AuthLoading());

      try {
        final userModel = event.user;

        SharedPrefsMethods.saveUserInfo(userModel);

        firestoreMethods.addUserInfo(userModel);

        return emit(AuthSuccess('Created Profile successfully!'));
      } catch (error) {
        return emit(AuthFailure(error.toString()));
      }
    });
  }
}
