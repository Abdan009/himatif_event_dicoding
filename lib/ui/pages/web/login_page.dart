part of '../pages.dart';

class LoginPageWeb extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  LoginPageWeb({this.emailController, this.passwordController});
  @override
  _LoginPageWebState createState() => _LoginPageWebState();
}

class _LoginPageWebState extends State<LoginPageWeb> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Row(
        children: [
          Container(
            width: width * 0.5,
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://i0.wp.com/innewcastle.co.uk/wp-content/uploads/2019/02/COMP.jpg?fit=2500%2C2500&ssl=1',
                    ),
                    fit: BoxFit.cover)),
          ),
          Expanded(
              child: LoginPageMobile(
            widthParameter: 500,
            emailController: widget.emailController,
            passwordController: widget.passwordController,
          )),
        ],
      ),
    );
  }
}
