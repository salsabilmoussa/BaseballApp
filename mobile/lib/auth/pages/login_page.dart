import 'package:baseball_cards_app/auth/service/auth_service.dart';
import 'package:baseball_cards_app/auth/templates/login_template.dart';
import 'package:baseball_cards_app/auth/params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService service = Modular.get<AuthService>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: LoginTemplate(
            headerParams: HeaderParams(
                'Connexion', 'Saisissez vos ', 'identifiants de connexion '),
            loginParams: LoginParams(
                service: service,
                emailController: emailController,
                passwordController: passwordController,
                emailTextFieldHint: 'Email',
                passwordTextFieldHint: 'Mot de passe',
                'Connexion'),
            footerParams: const FooterParams(
                'Vous avez Oublié votre Mot de Passe?',
                'Vous n avez pas de compte ? ',
                'Inscrivez-vous !'),
          ),
        ),
      ),
    );
  }
}
