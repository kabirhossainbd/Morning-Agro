import 'package:flutter/material.dart';
import 'package:harvesthub_agro/src/utils/constants/m_colors.dart';
import 'package:harvesthub_agro/src/utils/constants/m_dimensions.dart';
import 'package:harvesthub_agro/src/utils/constants/m_styles.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final TextStyle? textStyle;
  const CustomButton({Key? key, required this.text, required this.onTap, this.color, this.textStyle}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: widget.color ?? MyColor.getPrimaryColor()
        ),
        child: Text(widget.text, style: widget.textStyle ?? robotoRegular.copyWith(color: widget.color, fontSize: MySizes.fontSizeLarge),),
      ),
    );
  }
}