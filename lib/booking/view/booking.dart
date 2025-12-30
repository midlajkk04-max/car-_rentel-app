import 'package:flutter/material.dart';
import 'package:hive_project/booking/widget/container_3.dart';
import 'package:hive_project/booking/widget/payment_detailes.dart';
import 'package:hive_project/core/constants/app_colors.dart';

class Bookingpage extends StatelessWidget {
  const Bookingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1B24),

      appBar: AppBar(
        backgroundColor: Color(0xFF0F1B24),
  
        title:  Text(
          "Booking Summary",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF1C2B36),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(20),
                      child: Image.network(
                        "https://stimg.cardekho.com/images/carexteriorimages/630x420/BMW/M5/11821/1762779160108/front-left-side-47.jpg",
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(height: 18),

                    Row(
                      children: [
                        Text(
                          "Tesla Model 3",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 25,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 203, 194, 113),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Text("4.9"),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 4),

                    Text(
                      "Long Range",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                    ),
                    SizedBox(height: 19),

                    Row(
                      children: [
                        Container3(icon: Icons.abc, text: "text"),
                        SizedBox(width: 8),
                        Container3(icon: Icons.abc, text: "text"),
                        SizedBox(width: 8),
                        Container3(icon: Icons.abc, text: "text"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 78,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF1C2B36),
                ),
                child: Row(
                  
                  children: [
                    Image.network("https://d28wu8o6itv89t.cloudfront.net/images/Visadebitcardpng-1599584312349.png"),
                    SizedBox(width: 14,),
                    Text("Visa card"),
                   Spacer(),
                    TextButton(onPressed: (){}, child: Text("change",style: TextStyle(color: Colors.blue),))
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    width: 220,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xFF1C2B36),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text("payment Detailes",style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: 90,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                   color: Color(0xFF1C2B36),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Text("payment",style: TextStyle(color: Colors.blue),),
              )
                ],
              ),
              SizedBox(height: 10,),
              PaymentDetailes(text: "Car rentel(3 days)", text1: "\$255.00"),
              SizedBox(height: 10,),
              PaymentDetailes(text: "insurance(Standard)", text1: "\$30.00"),
              SizedBox(height: 10,),
              PaymentDetailes(text: "Taxes & Fees", text1: "\$15.00"),
              SizedBox(height: 10,),
              Divider(color: Colors.grey,
               thickness: 2,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("Total Amount",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("\$300.00",style: TextStyle(fontSize: 18,color: Colors.blue),),
                  )
                ],
              ),SizedBox(height: 15,),
              Divider(
                color: Colors.grey,
                thickness: 2,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      Text("Totel to pay",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("\$300.00",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue),)
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                   
                  ), child: Text("Confirm & pay"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
