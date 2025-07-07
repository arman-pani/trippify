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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void onLoginPressed() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    context
        .read<AuthBloc>()
        .add(LoginRequest(email: email, password: password));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            showErrorSnackBar(state.error, context);
          }

          if (state is AuthSuccess) {
            showErrorSnackBar(state.message, context);
            context.pushNamed(AppRouterConstants.homePage);
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
                  "Login",
                  style: TextstyleConstants.titleTextStyle1,
                ),
                Spacer(flex: 3),
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
                termsCheckbox(),
                Spacer(flex: 3),
                CustomGradientButton(label: "Login", onPressed: onLoginPressed),
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
                GoogleAuthButton(label: "Login with Google", onPressed: () {}),
                Spacer(flex: 8),
                Center(
                  child: CustomRichText(
                      text: "Don't have an account? ",
                      linkText: "Sign Up",
                      onLinkTap: () => context
                          .pushReplacementNamed(AppRouterConstants.signUpPage)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
