import 'package:baseball_cards_app/auth/service/auth_service.dart';
import 'package:baseball_cards_app/auth/params.dart';
import 'package:baseball_cards_app/auth/templates/signup_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthService service = Modular.get<AuthService>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: SignupTemplate(
            headerParams:
                HeaderParams('Inscription', 'Créez un ', 'compte utilisateur '),
            signupParams: SignupParams(
                service: service,
                emailController: emailController,
                passwordController: passwordController,
                emailTextFieldHint: 'Email',
                passwordTextFieldHint: 'Mot de passe',
                confirmPasswordController: confirmPasswordController,
                confirmPasswordTextFieldHint: 'Confirmer le mot de passe',
                'S’inscrire'),
            footerParams: const FooterParams(
                '', 'Vous avez déjà un compte ? ', 'Connectez-vous !'),
          ),
        ),
      ),
    );
  }
}
