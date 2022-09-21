import 'package:flutter/material.dart';

class CheckoutOrderDetails extends StatelessWidget {
  const CheckoutOrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Amount:',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              '  EGP',
              style: Theme.of(context).textTheme.subtitle1,
            ),

            //  MainButton(onTap: (){}, text: 'Check Out')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Amount:',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              '  EGP',
              style: Theme.of(context).textTheme.subtitle1,
            ),

            //  MainButton(onTap: (){}, text: 'Check Out')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Amount:',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              '  EGP',
              style: Theme.of(context).textTheme.subtitle1,
            ),

            //  MainButton(onTap: (){}, text: 'Check Out')
          ],
        ),
      ],
    );
  }
}
