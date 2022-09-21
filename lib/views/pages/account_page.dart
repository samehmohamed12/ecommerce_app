import 'package:flutter/material.dart';

import '../widgets/list_item_home.dart';


class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 25,
                  ),
                  Text('Ahlan Sameh',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                  Text('sameh@gmail.com ',style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(15),
                child: const Text('MY ACCOUNT',style: TextStyle(color: Colors.grey,fontSize: 13),)),
            InkWell(
              onTap: (){

              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children:
                  [
                    const Icon(Icons.favorite_border_rounded,color: Colors.black,size: 22),
                    separator(15, 0),
                    const Text('Saved Items',style: TextStyle(fontWeight: FontWeight.w600, ),),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded,size: 16,),
                    separator(10,0),
                  ],
                ),
              ),
            ),
            //  myDivider(),
            InkWell(
              onTap: (){

              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children:
                  [
                    const Icon(Icons.location_on_outlined,color: Colors.black,size: 22,),
                    separator(15, 0),
                    const Text('Addresses',style: TextStyle(fontWeight: FontWeight.w600, ),),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded,size: 16,),
                    separator(10,0),
                  ],
                ),
              ),
            ),
            // myDivider(),
            InkWell(
              onTap: (){

              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children:
                  [
                    const Icon(Icons.person_outline,color: Colors.black,size: 22,),
                    separator(15, 0),
                    const Text('Profile',style: TextStyle(fontWeight: FontWeight.w600, ),),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded,size: 16,),
                    separator(10,0),
                  ],
                ),
              ),
            ),
            // myDivider(),
            Container(
                padding: const EdgeInsets.all(15),
                child: const Text('MY SETTINGS',style: TextStyle(color: Colors.grey,fontSize: 13),)),
            InkWell(
              onTap: (){},
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children:
                  [
                    const Icon(Icons.dark_mode_outlined,color: Colors.black,size: 22,),
                    separator(15, 0),
                    const Text('Dark Mode',style: TextStyle(fontWeight: FontWeight.w600, ),),
                    const Spacer(),

                    // Switch(
                    //   value: value ,
                    //   onChanged: (newValue){
                    //     // setState(() {
                    //     //   value = newValue;
                    //     // });
                    //
                    //   },
                    //
                    //
                    // ),
                    separator(10,0),
                  ],
                ),
              ),
            ),
            //  myDivider(),
            InkWell(
              onTap: (){},
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children:
                  [
                    const Icon(Icons.map_outlined,color: Colors.black,size: 22,),
                    separator(15, 0),
                    const Text('Country',style: TextStyle(fontWeight: FontWeight.w600, ),),
                    const Spacer(),
                    const Text('Egypt'),
                    separator(10,0),
                    const Icon(Icons.arrow_forward_ios_rounded,size: 16,),
                    separator(10,0),
                  ],
                ),
              ),
            ),
            //  myDivider(),
            InkWell(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.all(15),
                color: Colors.white,
                child: Row(
                  children:
                  [
                    const Icon(Icons.flag_outlined,color: Colors.black,size: 22,),
                    separator(15, 0),
                    const Text('Language',style: TextStyle(fontWeight: FontWeight.w600, ),),
                    const Spacer(),
                    const Text('English'),
                    separator(10,0),
                    const Icon(Icons.arrow_forward_ios_rounded,size: 16,),
                    separator(10,0),
                  ],
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(15),
                child: const Text('REACH OUT TO US',style: TextStyle(color: Colors.grey,fontSize: 13),)),
            InkWell(
              onTap: (){

              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children:
                  [
                    const Icon(Icons.info_outline_rounded,color: Colors.black,size: 22,),
                    separator(15, 0),
                    const Text('FAQs',style: TextStyle(fontWeight: FontWeight.w600, ),),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded,size: 16,),
                    separator(10,0),
                  ],
                ),
              ),
            ),
            //  myDivider(),
            InkWell(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.all(15),
                color: Colors.white,
                child: Row(
                  children:
                  [
                    const Icon(Icons.phone_in_talk_outlined,color: Colors.black,size: 22,),
                    separator(15, 0),
                    const Text('Contact Us',style: TextStyle(fontWeight: FontWeight.w600, ),),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded,size: 16,),
                    separator(10,0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              height: 60,
              child: InkWell(
                onTap: (){

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  const [
                    Icon(Icons.power_settings_new),
                    SizedBox(width: 10,),
                    Text('SignOut',style: TextStyle(fontSize: 18),)
                  ],
                ),
              ),
            ),






          ],
        ),
      ),
    );
  }
}
