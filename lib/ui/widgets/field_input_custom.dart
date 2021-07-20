part of 'widgets.dart';

class FieldInputCustom extends StatefulWidget {
  final TextEditingController textEditingController;
  final String text;
  final TextInputType typeText;
  final double height;
  final double width;
  final int maxLines;
  final bool obsecureText;
  final Function(String) onChange;
  final bool isEnable;
  final Widget suffixIcon;
  final Function onTap;
  final bool calendar;
  final Function dateTime;
  final Widget prefixIcon;
  final TextAlign textAlign;
  final List<TextInputFormatter> inputFormater;
  final TextInputAction textInputAction;

  FieldInputCustom(this.textEditingController, this.text,
      {this.typeText,
      this.maxLines,
      this.onChange,
      this.obsecureText = false,
      this.height,
      this.width,
      this.isEnable = true,
      this.suffixIcon,
      this.onTap,
      this.calendar = false,
      this.dateTime,
      this.prefixIcon,
      this.inputFormater,
      this.textAlign,
      this.textInputAction});

  @override
  _FieldInputCustomState createState() => _FieldInputCustomState();
}

class _FieldInputCustomState extends State<FieldInputCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 60,
      child: Theme(
        data: ThemeData(
          primaryColor: mainColor,
        ),
        child: TextField(
          controller: widget.textEditingController,
          inputFormatters:
              (widget.inputFormater != null) ? widget.inputFormater : null,
          style: blackTextFont,
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          textAlign: widget.textAlign ?? TextAlign.start,
          maxLines: widget.maxLines ?? 20,
          enabled: widget.isEnable,
          cursorColor: mainColor,
          obscureText: widget.obsecureText,
          onChanged: widget.onChange ?? null,
          keyboardType:
              (widget.typeText == null) ? TextInputType.text : widget.typeText,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: widget.text,
              prefixIcon: widget.prefixIcon != null ? widget.prefixIcon : null,
              suffixIcon: widget.suffixIcon ?? SizedBox(),
              hintText: widget.text),
        ),
      ),
    );
  }
}
