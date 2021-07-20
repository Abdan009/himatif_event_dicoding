part of 'pages.dart';

class WrapperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context
        .read<UsersCubit>()
        .login('emailController.text', 'passwordController.text');
    context.read<EventCubit>().getListEvent();
    context.read<CategoryCubit>().getListCategory();

    return LoginPageRes();
  }
}
