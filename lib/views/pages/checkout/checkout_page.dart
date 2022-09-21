import 'package:ecommerce_app/controllers/database_controller.dart';
import 'package:ecommerce_app/models/delivery_methods.dart';
import 'package:ecommerce_app/views/widgets/checkout/delivery_method_item.dart';
import 'package:ecommerce_app/views/widgets/checkout/payment_component.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/checkout/shipping_adress_component.dart';
import '../../widgets/two_separated_items_row.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipping Address',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 15.0,
              ),
              const ShippingAddressComponent(),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Change',
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: Colors.red),
                      ))
                ],
              ),
              PaymentComponent(),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                'Delivery Methode',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 8.0,
              ),
              StreamBuilder<List<DeliveryMethodsModel>>(
                  stream: database.deliveryMethodsStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final deliveryMethods = snapshot.data;
                      if (deliveryMethods == null || deliveryMethods.isEmpty) {
                        return const Center(
                          child: Text('No delivery methods available!'),
                        );
                      }
                      return SizedBox(
                          height: size.height * 0.1,
                          child: ListView.builder(
                            itemBuilder: (_, index) => DeliveryMethodeItem(
                              deliveryMethodsModel: deliveryMethods[index],
                            ),
                            itemCount: deliveryMethods.length,
                          ));
                    }

                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }),
              const SizedBox(
                height: 32.0,
              ),
              const TwoSeparatedItemsRow(
                title: 'Order:',
                value: '135',
              ),
              const SizedBox(
                height: 8.0,
              ),
              const TwoSeparatedItemsRow(
                title: 'Delivery:',
                value: '135',
              ),
              const SizedBox(
                height: 8.0,
              ),
              const TwoSeparatedItemsRow(
                title: 'Summary:',
                value: '135',
              ),
              const SizedBox(
                height: 25.0,
              ),
              MainButton(onTap: () {}, text: 'SUBMIT ORDER')
            ],
          ),
        ),
      ),
    );
  }
}
