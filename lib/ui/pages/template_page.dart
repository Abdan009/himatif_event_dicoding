part of 'pages.dart';

class TemplatePages extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget body1;
  final Widget body2;
  final Widget body3;
  TemplatePages({this.appBar, this.body1, this.body2, this.body3});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: LayoutBuilder(
        builder: (_, BoxConstraints constraints) {
          print("Size: ${MediaQuery.of(context).size.width}");
          if (constraints.maxWidth <= 800) {
            print('masuk 1');
            return body1 ?? Container();
          } else if (constraints.maxWidth <= 1300) {
            print('masuk 2');
            return body2 ?? body1 ?? Container();
          } else {
            print('masuk 3');
            return body3 ?? body2 ?? body1 ?? Container();
          }
        },
      ),
    );
  }
}
