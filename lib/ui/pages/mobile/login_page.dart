part of '../pages.dart';

class LoginPageMobile extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final double widthParameter;
  LoginPageMobile(
      {this.widthParameter, this.emailController, this.passwordController});

  @override
  _LoginPageMobileState createState() => _LoginPageMobileState();
}

class _LoginPageMobileState extends State<LoginPageMobile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLogin = false;
  @override
  void initState() {
    super.initState();
    emailController = widget.emailController;
    passwordController = widget.passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: accentColor5.withOpacity(0.2)),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 100.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 150,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Image(
                          image: AssetImage(
                              'assets/images/logo_himatif_event.png')),
                    ),
                  ),
                  Text(
                    'Masuk',
                    style: blackTextFont.copyWith(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    width: widget.widthParameter ?? double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        _buildField(
                            title: 'Email',
                            controller: emailController,
                            icon: Icons.email,
                            hint: 'Masukan Email'),
                        SizedBox(
                          height: 30.0,
                        ),
                        _buildField(
                            title: 'Password',
                            controller: passwordController,
                            icon: Icons.lock,
                            hint: 'Masukan Password',
                            obscureText: true),
                        _buildForgotPasswordBtn(),
                        _buildLoginBtn(),
                        _buildSignupBtn(),
                        Text('v2'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        child: Text(
          'Lupa Password ?',
          style: blackTextFont,
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return (!isLogin)
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5.0,
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                primary: mainColor,
              ),
              onPressed: () async {
                if (!(emailController.text.trim() != "" &&
                    passwordController.text.trim() != "")) {
                  flushbar(
                      'Harap lengkapi seluruh data terlebih dahulu', context);
                } else {
                  setState(() {
                    isLogin = true;
                  });
                  context
                      .read<UsersCubit>()
                      .login(emailController.text, passwordController.text);
                  context.read<EventCubit>().getListEvent();
                  context.read<CategoryCubit>().getListCategory();
                  navigatorPage(
                    context,
                    navigator: NavigatorPage.pushReplacement,
                    to: HomePageRes(),
                  );
                }
              },
              child: Text(
                'Masuk',
                style: whiteTextFont.copyWith(
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        : loading(3);
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        //register
        // Get.to(SignUpFormPage());
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Belum mempunyai akun ? ',
              style: blackTextFont,
            ),
            TextSpan(
              text: 'Daftar',
              style: orangeTextFont.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(
      {String title,
      TextEditingController controller,
      IconData icon,
      String hint,
      bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: blackTextFont.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: boxDecorationStyle(),
          height: 60.0,
          child: TextField(
            controller: controller,
            style: blackTextFont,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                icon,
                color: mainColor,
              ),
              hintText: hint,
              hintStyle: blackTextFont,
            ),
          ),
        ),
      ],
    );
  }
}
