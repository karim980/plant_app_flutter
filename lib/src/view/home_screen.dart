import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/src/model/plant_model.dart';
import 'package:plant_app/src/view/widgets/item_widget.dart';

import '../model/fake_data(plant).dart';
import 'details_screen.dart';



class HomeScreen extends StatelessWidget {
  PlantData plantData = PlantData.fromJson(fakeData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(radius: 20,),
                      SizedBox(width: 6,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('welcome'),
                          Text('Anna')
                        ],
                      ),
                      Spacer(),
                      IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_sharp))
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_rounded,color: Colors.grey[300],),
                      SizedBox(width: 5,),
                      Text('dhaka,Bongladesh')
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: DefaultTabController(
                length: 1, // Number of tabs
                child: Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8))
                          ),
                          labelText: 'Search',
                          hintText: 'Search here',
                          suffixIcon: Icon(Icons.segment_rounded),
                          prefixIcon: Icon(Icons.search),
        
                        ),
                      ),
                    ),
                    Text('Category'),
                    TabBar(
                      labelColor: Colors.white,
                      dividerHeight: 0,
                      tabs: [
                        Tab(text: '    All    ',),
                        Tab(text: 'indoor'),
                        Tab(text: 'outdoor'),
        
                      ],
                      indicatorColor: Colors.green,
                      indicator: BoxDecoration(
                        color: Colors.lightGreen[800],

                        borderRadius: BorderRadius.circular(18),
        
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.all(10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of items per row
                          crossAxisSpacing: 10, // Spacing between items horizontally
                          mainAxisSpacing: 10, // Spacing between items vertically
                          childAspectRatio: 3 / 4, // Aspect ratio of each item
                        ),
                        itemCount: plantData.data.length,
                        itemBuilder: (context, index) {
                          Plant plant = plantData.data[index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsScreen(
                                  img: plant.image,
                                  title: plant.title,
                                  description: plant.description,
                                  price: plant.price),
                              ));
                            },
                            child: ItemWidget(
                                price: plant.price.toString(),
                                title: plant.title,
                                img: plant.image),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),


      bottomSheet: Container(
        height: 65,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.transparent,
              offset: const Offset(0, 0),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: Icon(
                Icons.home,
                size: 30,
                color: Colors.lightGreen[800],
              ),
            ),
            InkWell(
              onTap: () {
                Get.defaultDialog(title: 'title');
              },
              child: Icon(
                Icons.favorite,
                size: 30,

              ),
            ),
            InkWell(
              child: Icon(
                Icons.shopping_cart,
                size: 30,

              ),
            ),
            InkWell(
              child: Icon(
                Icons.person,
                size: 30,

              ),
            ),
          ],
        ),
      ),
    );
  }
}