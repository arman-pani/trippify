import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trippify/bloc/auth/auth_bloc.dart';
import 'package:trippify/constants/textstyle_constants.dart';
import 'package:trippify/helpers/common_widgets.dart';
import 'package:trippify/utils/app_router.dart';
import 'package:trippify/widgets/custom_gradient_button.dart';
import 'package:trippify/widgets/custom_textfield.dart';
import 'package:trippify/widgets/google_auth_button.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    void onRegisterPressed() {
      context.read<AuthBloc>().add(
            SignUpRequest(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
              confirmPassword: confirmPasswordController.text.trim(),
            ),
          );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            showErrorSnackBar(state.error, context);
          }
          if (state is AuthSuccess) {
            context.pushNamed(AppRouterConstants.createProfile);
            showErrorSnackBar(state.message, context);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register",
                  style: TextstyleConstants.titleTextStyle1,
                ),
                Spacer(flex: 2),
                CustomTextfield(
                  hintText: "Enter your email address",
                  labelText: "Email",
                  controller: emailController,
                ),
                Spacer(),
                CustomTextfield(
                  hintText: "Enter your password",
                  labelText: "Password",
                  isObscure: true,
                  controller: passwordController,
                ),
                Spacer(),
                CustomTextfield(
                  hintText: "Confirm your password",
                  labelText: "Confirm Password",
                  isObscure: true,
                  controller: confirmPasswordController,
                ),
                termsCheckbox(),
                Spacer(flex: 2),
                CustomGradientButton(
                    label: "Create an account", onPressed: onRegisterPressed),
                Spacer(),
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("OR",
                          style: TextstyleConstants.mediumTextStyle1),
                    ),
                    Expanded(child: Divider(color: Colors.black)),
                  ],
                ),
                Spacer(),
                GoogleAuthButton(
                    label: "Continue with Google", onPressed: () {}),
                Spacer(flex: 8),
                Center(
                  child: CustomRichText(
                    text: "Already have an account? ",
                    linkText: "Login",
                    onLinkTap: () => context
                        .pushReplacementNamed(AppRouterConstants.signInPage),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
