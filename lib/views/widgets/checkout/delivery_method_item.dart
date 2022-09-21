import 'package:ecommerce_app/models/delivery_methods.dart';
import 'package:flutter/material.dart';

class DeliveryMethodeItem extends StatelessWidget {
  final DeliveryMethodsModel deliveryMethodsModel;
  const DeliveryMethodeItem({Key? key,required this.deliveryMethodsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
         Image.network(deliveryMethodsModel.imgUrl,fit:BoxFit.cover,height: 30,),
          const SizedBox(
            height: 6.0,
          ),
           Text(deliveryMethodsModel.days,style: Theme.of(context).textTheme.subtitle1,)
        ],),
      ),

    );
  }
}
