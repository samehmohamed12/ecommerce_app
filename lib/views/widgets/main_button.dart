import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool hasCircularBorder;

  const MainButton({Key? key, required this.onTap, required this.text,   this.hasCircularBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height:50 ,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
          ),
          child: Text(
            text,
           // style: Theme.of(context).textTheme.button,
          )),
    );
  }
}
