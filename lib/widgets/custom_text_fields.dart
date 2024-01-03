import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldBatCalculator extends StatefulWidget {
  const CustomTextFieldBatCalculator({
    super.key,
    this.inputFormatters,
    this.labelText,
    this.controller,
    this.keyboardType = TextInputType.number,
    this.validator,
    this.hintText,
    this.onChanged,
    this.isDollar = false,
    this.number = 0,
  });

  final List<TextInputFormatter>? inputFormatters;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? hintText;
  final Function(String)? onChanged;
  final bool isDollar;
  final int number;

  @override
  State<CustomTextFieldBatCalculator> createState() =>
      _CustomTextFieldBatCalculatorState();
}

class _CustomTextFieldBatCalculatorState
    extends State<CustomTextFieldBatCalculator> {
  late String text = widget.number.toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 3),
            color: Colors.black.withOpacity(0.2),
          )
        ],
      ),
      child: TextFormField(
        onChanged: (val) {
          setState(() {
            if (val.isEmpty) {
              text = widget.number.toString();
            } else if (widget.number == 2 && int.parse(val) == 1) {
              text = widget.number.toString();
            } else {
              text = val;
            }
          });
          if (widget.onChanged != null) {
            widget.onChanged!(text);
          }
        },
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        cursorColor: Colors.black,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: AppTextStylesBetCalculator.s16W500(),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: widget.isDollar
              ? Text(
                  '\$$text',
                  style: AppTextStylesBetCalculator.s32W600(),
                  textAlign: TextAlign.end,
                )
              : Text(
                  text,
                  style: AppTextStylesBetCalculator.s32W600(),
                  textAlign: TextAlign.end,
                ),
          hintText: widget.hintText,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
