import 'package:flutter/material.dart';

class ShippingAddressComponent extends StatelessWidget {
  const ShippingAddressComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('sameh ali',style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w500),),
                TextButton(onPressed: (){}, child: Text('Change',style: Theme.of(context).textTheme.button!.copyWith(color: Colors.red),))

              ],
            ),
            Text('13 ali albasyouny',style: Theme.of(context).textTheme.subtitle1,),
            Text('Al qalubaya, shepin, Egypt',style: Theme.of(context).textTheme.subtitle1,),

          ],
        ),
      ),
    );
  }
}
