part of 'responsive.dart';

class LoginPageRes extends StatefulWidget {
  @override
  _LoginPageResState createState() => _LoginPageResState();
}

class _LoginPageResState extends State<LoginPageRes> {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return TemplatePages(
      body1: LoginPageMobile(
        emailController: emailController,
        passwordController: passwordController,
      ),
      body2: LoginPageWeb(
        emailController: emailController,
        passwordController: passwordController,
      ),
      body3: LoginPageWeb(
        emailController: emailController,
        passwordController: passwordController,
      ),
    );
  }
}
