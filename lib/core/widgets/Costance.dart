import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:lottie/lottie.dart';

import '../../plugins/flushbar/flushbar.dart';

class ColorsHelper {
  static const Color blue = Color(0xff2743FD);
  static const Color darkGray = Color(0xff555770);
  static const Color lightGray = Color(0xffEBEBF0);
  static const Color backGray = Color(0xffF7F7F7);
  static const Color red = Color(0xffFF3B3B);
}

class ThemeHelper {
  static getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ColorsHelper.backGray,
      primaryColor: ColorsHelper.blue,
      backgroundColor: ColorsHelper.backGray,
      buttonColor: ColorsHelper.blue,
    );
  }
}

class UiHelper {
  static List<BoxShadow> shadow1 = [
    BoxShadow(
        color: Colors.grey.withOpacity(0.3), blurRadius: 10, spreadRadius: 2)
  ];

  static BorderRadius borderRadius25 = BorderRadius.circular(25);
  static BorderRadius borderRadius16 = BorderRadius.circular(16);

  static btnHelper({
    double? width,
    Callback? onTap,
    String text = "Next",
  }) {
    return SizedBox(
      height: Get.height * .06,
      width: width ?? Get.width * .8,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
          overlayColor:
              MaterialStateColor.resolveWith((states) => Colors.white12),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => ColorsHelper.blue),
        ),
        onPressed: onTap,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  static borderBtnHelper({
    double? width,
    Callback? onTap,
    String text = "Next",
  }) {
    return SizedBox(
      height: Get.height * .06,
      width: width ?? Get.width * .8,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
          side: MaterialStateBorderSide.resolveWith((states) =>
              const BorderSide(color: ColorsHelper.darkGray, width: 1)),
          overlayColor:
              MaterialStateColor.resolveWith((states) => Colors.grey.shade300),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => ColorsHelper.backGray),
        ),
        onPressed: onTap,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: ColorsHelper.darkGray, fontSize: 18),
          ),
        ),
      ),
    );
  }

  static backIconBtn() {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        margin: EdgeInsets.only(left: Get.width * .06, top: 15),
        height: Get.height * .06,
        width: Get.width * .13,
        decoration: BoxDecoration(
          borderRadius: borderRadius16,
          border: Border.all(
            color: ColorsHelper.lightGray,
            width: 2,
          ),
          color: Colors.transparent,
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back,
            color: ColorsHelper.darkGray,
            size: Get.width * .07,
          ),
        ),
      ),
    );
  }

  static Widget input(
      {String? label,
      required TextEditingController controller,
      FormFieldValidator<String>? validator,
      ValueChanged<String>? onChanged}) {
    return Material(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
        child: TextFormField(
          validator: validator,
          onChanged: onChanged,
          controller: controller,
          textAlign: TextAlign.start,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            fillColor: ColorsHelper.darkGray.withOpacity(0.2),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius16, borderSide: BorderSide.none),
            labelText: label,
            labelStyle: TextStyle(
              color: ColorsHelper.darkGray.withOpacity(0.4),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius16,
              borderSide: const BorderSide(color: ColorsHelper.blue, width: 2),
            ),
            border: OutlineInputBorder(
              borderRadius: borderRadius16,
              borderSide:
                  const BorderSide(color: ColorsHelper.darkGray, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}

class ViewHelper {
  static Image pattern = Image.asset('assets/images/pattern.jpg');

  static void chooseAddressPlease(BuildContext context, double height) {
    ViewHelper._baseWarning(
      context: context,
      iconData: Icons.warning_amber_outlined,
      backgroundColor: Colors.blue,
      height: height,
      text: "لطفا ابتدا یک آدرس را انتخاب کنید",
      textColor: Colors.white,
      borderAndIconColor: Colors.red,
      borderWidth: 1.0,
    );
  }

  static void showLoading() {
    EasyLoading.show(
        indicator:
            Lottie.asset("assets/anims/loading.json", width: Get.width * .3),
        dismissOnTap: true);
  }

  static String formatAmount(String price) {
    String priceInText = "";
    int counter = 0;
    for (int i = (price.length - 1); i >= 0; i--) {
      counter++;
      String str = price[i];
      if ((counter % 3) != 0 && i != 0) {
        priceInText = "$str$priceInText";
      } else if (i == 0) {
        priceInText = "$str$priceInText";
      } else {
        priceInText = ",$str$priceInText";
      }
    }
    return priceInText.trim();
  }

  static void showErrorDialog([String text = "خطایی رخ داد"]) {
    Flushbar(
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      borderColor: Colors.red,
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 150.0,
      ),
      animationDuration: const Duration(milliseconds: 500),
      messageText: AutoSizeText(
        text,
        maxLines: 1,
        minFontSize: 3,
        maxFontSize: 12.0,
        style: const TextStyle(
          color: Colors.red,
        ),
      ),
      flushbarPosition: FlushbarPosition.BOTTOM,
      icon: const Icon(
        Icons.error_outline,
        size: 28.0,
        color: Colors.red,
      ),
      duration: const Duration(seconds: 3),
    ).show(Get.context!);
  }

  static void _baseWarning({
    required BuildContext context,
    required double height,
    String? text,
    Color? textColor,
    Color? backgroundColor,
    IconData? iconData,
    Color? borderAndIconColor,
    double borderWidth = 1.0,
    Duration duration = const Duration(seconds: 3),
  }) {
    Flushbar(
      margin: EdgeInsets.symmetric(vertical: height, horizontal: 5.0),
      borderRadius: 10.0,
      borderWidth: borderWidth,
      isDismissible: true,
      backgroundColor: backgroundColor,
      animationDuration: Duration(milliseconds: 500),
      messageText: AutoSizeText(
        "$text",
        maxLines: 1,
        minFontSize: 3,
        maxFontSize: 12.0,
        style: TextStyle(
          color: textColor,
        ),
      ),
      flushbarPosition: FlushbarPosition.BOTTOM,
      borderColor: borderAndIconColor,
      icon: Icon(
        iconData,
        size: 28.0,
        color: borderAndIconColor,
      ),
      duration: duration,
    ).show(context);
  }

  static void showSuccessDialog(String text) {
    Flushbar(
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      borderColor: Colors.green.shade700,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 100.0),
      animationDuration: const Duration(milliseconds: 500),
      messageText: AutoSizeText(
        text,
        maxLines: 1,
        minFontSize: 3,
        maxFontSize: 14.0,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
      flushbarPosition: FlushbarPosition.BOTTOM,
      icon: const Icon(
        Icons.check_circle,
        size: 28.0,
        color: Colors.black,
      ),
      duration: const Duration(seconds: 3),
    ).show(Get.context!);
  }
}

class DigitInputFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue,
      {String separator = ","}) {
    //remove ',' symbol of text
    String number = newValue.text.replaceAll(RegExp(','), '');
    String str = "";
    for (var i = number.length; i > 0;) {
      if (i > 3)
        str = separator + number.substring(i - 3, i) + str;
      else
        str = number.substring(0, i) + str;
      i = i - 3;
    }
    return newValue.copyWith(
        text: str, selection: new TextSelection.collapsed(offset: str.length));
  }
}
