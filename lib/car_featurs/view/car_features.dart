import 'package:flutter/material.dart';
import 'package:hive_project/car_featurs/widget/car_features_widget.dart';
import 'package:hive_project/car_featurs/widget/car_features_widget_container.dart';
import 'package:hive_project/core/constants/app_colors.dart';
import 'package:hive_project/features/user/vehicle_search/view/vehicle_search_page.dart';


class CarFeatures extends StatefulWidget {
  const CarFeatures({super.key});

  @override
  State<CarFeatures> createState() => _CarFeaturesState();
}

class _CarFeaturesState extends State<CarFeatures> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGround,
        leading: IconButton(
          onPressed: () {
           
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Vehicle Features",
          style: TextStyle(color: const Color.fromARGB(255, 209, 151, 151)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CarFeaturesWidget(
                    images:
                        "https://i.ytimg.com/vi/K1Sb1NL0B6o/maxresdefault.jpg",
                  ),
                  CarFeaturesWidget(
                    images:
                        "https://dealerinspire-image-library-prod.s3.us-east-1.amazonaws.com/images/OoOvLj5CReB2QBQgN1H3WWxMsHk9GXDOFnzZq9gp.jpg",
                  ),
                  CarFeaturesWidget(
                    images:
                        "https://di-uploads-pod24.dealerinspire.com/bmwofmamaroneck/uploads/2021/04/2021-bmw-5-series-interior.jpg",
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "BMW 5 Series",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 17),
                  decoration: BoxDecoration(
                    color: AppColors.backGround1,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, size: 14),
                      SizedBox(width: 4),
                      Text("4.9", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            
               
                    CarFeaturesWidgetCard(
                      icon: Icons.bolt,
                      text: 'power',
                      value: '248 hp',
                    ),
                    CarFeaturesWidgetCard(
                      icon: Icons.local_gas_station,
                      text: 'Mpg',
                      value: '27',
                    ),
                  
                
              
            SizedBox(height: 10),
            
                CarFeaturesWidgetCard(
                  icon: Icons.event_seat,
                  text: 'Leather seat',
                  value: 'sw',
                ),
                CarFeaturesWidgetCard(
                  icon: Icons.wb_sunny,
                  text: 'panoramic moonroof',
                  value: 'one-touch open/close',
                ),
            
            
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CAR Description",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          textAlign: TextAlign.justify,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          "Experience the perfect blend of luxury and performance with BMW. Designed for precision driving, BMW vehicles offer powerful engine performance, smooth handling, and a refined interior. With advanced safety systems, cutting-edge technology, and superior comfort, BMW ensures an exceptional driving experience for both city roads and long-distance journeys.",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Divider(color: Colors.grey, thickness: 2),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    "150/ day",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("BOOK NoW"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
      
      )
      ),
    );
  }
}
