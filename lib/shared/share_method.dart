part of 'shared.dart';

Future<File> getImage() async {
  final _picker = ImagePicker();
  PickedFile pickedFile;
  pickedFile = await _picker.getImage(
      maxHeight: 1200,
      maxWidth: 630,
      // imageQuality: 60,
      source: ImageSource.gallery);

  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    print('No image selected');
    return null;
  }
}

BoxDecoration boxDecorationStyle() {
  return BoxDecoration(
    color: accentColor5,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );
}

void flushbar(String message, BuildContext context,
    {FlushbarPosition position, Color backgroundColor}) {
  Flushbar(
    duration: Duration(seconds: 3),
    flushbarPosition: position ?? FlushbarPosition.TOP,
    backgroundColor: backgroundColor ?? Color(0xFFFF5C83),
    message: message,
  )..show(context);
}

Widget loading(double sized) {
  return CircularProgressIndicator(
    strokeWidth: sized,
    backgroundColor: mainColor,
    valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
  );
}

PreferredSizeWidget appBar(String title, {List<Widget> actions}) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title,
      style: blackTextFont.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        letterSpacing: 0.18,
      ),
    ),
    actions: actions,
  );
}

enum NavigatorPage { pop, push, pushReplacement }
void navigatorPage(BuildContext context,
    {@required NavigatorPage navigator, Widget to}) {
  if (navigator == NavigatorPage.pop) {
    Navigator.pop(context);
  } else if (navigator == NavigatorPage.push) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => to,
      ),
    );
  } else if (navigator == NavigatorPage.pushReplacement) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => to,
      ),
    );
  }
}

ProgressDialog loadingDialog(BuildContext context, {String message}) {
  ProgressDialog loading = ProgressDialog(context,
      type: ProgressDialogType.Normal, isDismissible: true);

  loading.style(
    message: message ?? "Harap tunggu...",
    // progressWidget:
  );
  return loading;
}
