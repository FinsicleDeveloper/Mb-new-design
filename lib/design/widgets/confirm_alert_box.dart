



import 'package:flutter/material.dart';

class ConfirmAlertBoxDark {
  final BuildContext? context;
  final String? title;
  final IconData? icon;
  final String? infoMessage;
  final Color? titleTextColor;
  final Color? messageTextColor;
  final Color? buttonColorForYes;
  final Color? buttonTextColorForYes;
  final String? buttonTextForYes;
  final Color? buttonColorForNo;
  final Color? buttonTextColorForNo;
  final String? buttonTextForNo;
  final Function? onPressedYes;
  final Function? onPressedNo;
  ConfirmAlertBoxDark(
      {this.context,
      this.title,
      this.infoMessage,
      this.titleTextColor,
      this.messageTextColor,
      this.buttonColorForYes,
      this.buttonTextForYes,
      this.buttonTextColorForYes,
      this.buttonColorForNo,
      this.buttonTextColorForNo,
      this.buttonTextForNo,
      this.onPressedYes,
      this.onPressedNo,
      this.icon}) {
    showDialog(
        barrierDismissible: false,
        context: context!,
        builder: (BuildContext context) {
          return SimpleDialog(
            shadowColor: Colors.white,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  20.0), // Adjust the border radius as needed
            ),
            backgroundColor: Colors.grey.shade900,
            contentPadding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
            children: <Widget>[
              Text(
                infoMessage ?? "Alert message here",
                style: TextStyle(
                  fontSize: 15,
                  color: messageTextColor ?? Color(0xFF4E4E4E)),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: onPressedYes as void Function()? ?? () {},
                    child: Text(
                      buttonTextForYes ?? "Yes",
                      style: TextStyle(
                          fontFamily: 'Lora',
                          color: buttonTextColorForYes ?? Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    onTap: onPressedNo as void Function()? ??
                        () {
                          Navigator.of(context).pop();
                        },
                    child: Text(
                      buttonTextForNo ?? "No",
                      style: TextStyle(
                          fontFamily: 'Lora',
                          color: buttonTextColorForNo ?? Colors.white),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}