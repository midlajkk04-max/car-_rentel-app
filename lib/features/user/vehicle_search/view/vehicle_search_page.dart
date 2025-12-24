
import 'package:flutter/material.dart';
import 'package:hive_project/core/constants/app_colors.dart';
import 'package:hive_project/features/user/vehicle_search/model/car_card_model.dart';
import 'package:hive_project/features/user/vehicle_search/widgets/car_card_widget.dart';

class VehicleSearchPage extends StatefulWidget {
  const VehicleSearchPage({super.key});

  @override
  State<VehicleSearchPage> createState() => _VehicleSearchPageState();
}

class _VehicleSearchPageState extends State<VehicleSearchPage> {
  int selectedIndex = 0;
  String searchQuery = ''; 

  List<String> categories = ["All", "Luxury", "SUV", "Economy"];

  List<CarModel> carList = [
    CarModel(
      image:
          "https://www.shutterstock.com/image-photo/istanbul-turkey-may-2-2024-600nw-2457726547.jpg",
      name: "BMW 5 Series",
      details: "Luxury Sedan",
      price: "₹5000/day",
      rating: "4.8",
      category: "Luxury",
    ),
    CarModel(
      image:
          "https://pimwp.s3-accelerate.amazonaws.com/2021/01/wp4455833.jpg",
      name: "Maruti Swift",
      details: "Economy Hatchback",
      price: "₹1500/day",
      rating: "4.2",
      category: "Economy",
    ),
    CarModel(
      image:
          "https://images.autox.com/uploads/2022/08/Maruti-Suzuki-Alto-K10-Front-Three-Fourth-Motion-2.jpg",
      name: "Maruti Alto",
      details: "SUV Car",
      price: "₹3500/day",
      rating: "4.6",
      category: "Economy",
    ),
    CarModel(
      image:
          "https://www.hyundai.com/content/dam/hyundai/in/en/data/find-a-car/Creta/Highlights/knightking/cretakingmountain.jpg",
      name: "Hyundai Creta",
      details: "SUV Car",
      price: "₹3500/day",
      rating: "4.6",
      category: "SUV",
    ),
    CarModel(
      image:
          "https://preview.thenewsmarket.com/Previews/kiam/StillAssets/1920x1080/628867_v2.jpg",
      name: "Kia Seltos",
      details: "SUV Car",
      price: "₹3500/day",
      rating: "4.6",
      category: "SUV",
    ),
    CarModel(
      image:
          "https://images.hindustantimes.com/auto/img/2022/09/18/1600x900/Maruti_Grand_Vitara_(14)_1663474637164_1663474689462_1663474689462.jpeg",
      name: "Maruti Grand Vitara",
      details: "SUV Car",
      price: "₹3500/day",
      rating: "4.6",
      category: "SUV",
    ),
    CarModel(
      image:
          "https://imagecdnsa.zigwheels.ae/large/gallery/exterior/40/424/toyota-fortuner-front-angle-low-view-609840.jpg",
      name: "Toyota Fortuner",
      details: "SUV Car",
      price: "₹3500/day",
      rating: "4.6",
      category: "SUV",
    ),
     CarModel(
      image:
          "https://wallpapers.com/images/featured/jaguar-xf-y25z74coh9xi3zeg.jpg",
      name: "Jaguar XF",
      details: "SUV Car",
      price: "₹3500/day",
      rating: "4.6",
      category: "Luxury",
    ),
     CarModel(
      image:
          "https://images.alphacoders.com/117/1179395.jpg",
      name: "Lexus ES",
      details: "SUV Car",
      price: "₹3500/day",
      rating: "4.6",
      category: "Luxury",
    ),
    CarModel(
      image:
          "https://w0.peakpx.com/wallpaper/552/69/HD-wallpaper-black-models-2012-mercedes-benz-e-class-saloon.jpg",
      name: "Mercedes-Benz E-Class",
      details: "SUV Car",
      price: "₹3500/day",
      rating: "4.6",
      category: "Luxury",
    ),
    CarModel(
      image:
          "https://www.dubicars.com/images/91a49c/w_960x540/alba-cars/23ec1124-9e5d-46e3-8ba6-7307b3958d3a.jpeg",
      name: "Audi A6",
      details: "SUV Car",
      price: "₹3500/day",
      rating: "4.6",
      category: "Luxury",
    ),
     CarModel(
      image:
          "https://images.livemint.com/img/2022/09/08/1600x900/The_new_Volkswagen_Taigun_1635827755823_1662633146787_1662633146787.jpg",
      name: "Volkswagen Taigun",
      details: "SUV Car",
      price: "₹3500/day",
      rating: "4.6",
      category: "SUV",
    ),
    CarModel(
      image:
          "https://i.ytimg.com/vi/kbdLQ36rSYg/maxresdefault.jpg",
      name: "Maruti Celerio",
      details: "Economy Hatchback",
      price: "₹1500/day",
      rating: "4.2",
      category: "Economy",
    ),
    CarModel(
      image:
          "https://m.hondacarindia.com/content/blog/images/exterior-front.jpg",
      name: "Honda Amaze",
      details: "Economy Hatchback",
      price: "₹1500/day",
      rating: "4.2",
      category: "Economy",
    ),
    CarModel(
      image:
          "https://imgd.aeplcdn.com/1920x1080/n/cw/ec/107543/brezza-exterior-left-front-three-quarter-3.jpeg?isig=0&q=80&q=80",
      name: "Maruti Brezza",
      details: "Economy Hatchback",
      price: "₹1500/day",
      rating: "4.2",
      category: "Economy",
    ),

  ];

  List<CarModel> filterdList = [];

  @override
  void initState() {
    super.initState();
    filterdList = carList;
  }

  void filterFunction(String? category, String? search) {
    setState(() {
      filterdList = carList.where((car) {
        final matchesCategory =
            (category == null || category == 'All') || car.category == category;
        final matchesSearch = (search == null || search.isEmpty) ||
            car.name.toLowerCase().startsWith(search.toLowerCase());
        return matchesCategory && matchesSearch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search car...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) {
                    searchQuery = value; 
                    filterFunction(categories[selectedIndex], searchQuery);
                  },
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 40,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Center(
                      child: ChoiceChip(
                        padding: EdgeInsets.all(5),
                        label: Text(
                          categories[index],
                          style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        selected: selectedIndex == index,
                        selectedColor: Colors.blue,
                        backgroundColor: Colors.grey.shade300,
                        onSelected: (selected) {
                          setState(() {
                            selectedIndex = index;
                          });
                          filterFunction(categories[index], searchQuery);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: filterdList.isEmpty
                  ? Center(
                      child: Text(
                        'No cars found',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ):
                   ListView.builder(
                      shrinkWrap: true,
                      itemCount: filterdList.length,
                      itemBuilder: (context, index) {
                        final car = filterdList[index];
                        return CarCardWidget(
                          images: car.image,
                          name: car.name,
                          details: car.details,
                          price: car.price,
                          raiting: car.rating,
                          features1: "Feature 1",
                          features2: "Feature 2",
                          features3: "Feature 3",
                          onBook: () {},
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
