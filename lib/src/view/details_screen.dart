import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import 'cart_screen.dart';

class DetailsScreen extends StatelessWidget {
  final CartController _cartController = Get.find();
  String img;
  String title;
  String price;
  String description;

  DetailsScreen({
    super.key,
    required this.price,
    required this.title,
    required this.description,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: Image.asset(
                  img,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width / 2,
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: TextStyle(fontSize: 24),),
                    Text('\$${price}',style: TextStyle(fontSize: 24,color: Colors.lightGreen[800]),),
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.yellow,),
                        SizedBox(width: 8,),
                        Text('4.9'),
                      ],
                    ),
                    SizedBox(height: 25,),
                    Text('About plant',style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(description,style: TextStyle(color: Colors.grey,fontSize: 10),),
                    ElevatedButton(onPressed: (){
                      Get.to(CartScreen());
                    }, child: Text('cart')),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        _cartController.addToCart(name: title, image: img, price: price);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Buy Now!',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          backgroundColor: Colors.lightGreen[800],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                          )
                      ),
                    )
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