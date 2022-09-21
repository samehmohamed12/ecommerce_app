import 'package:flutter/material.dart';

class PaymentComponent extends StatelessWidget {
  const PaymentComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DecoratedBox(
          decoration:   BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(16.0)),
            
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/772px-Mastercard-logo.svg.png',
          fit: BoxFit.cover,
          height: 30,
        ),
            )),
        const SizedBox(
          width: 16.0,
        ),
        const Text('**** **** **** 1234'),
      ],
    );
  }
}
