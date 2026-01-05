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

  late List<CarModel> carList;
  List<CarModel> filteredList = [];

  @override
  void initState() {
    super.initState();

    carList = [
      CarModel(
        image: [
          "https://www.shutterstock.com/image-photo/istanbul-turkey-may-2-2024-600nw-2457726547.jpg",
          "https://www.shutterstock.com/image-photo/istanbul-turkey-may-2-2024-600nw-2457726547.jpg",
          "https://www.shutterstock.com/image-photo/istanbul-turkey-may-2-2024-600nw-2457726547.jpg",
        ],
        name: "BMW 5 Series",
        details: "Luxury Sedan",
        price: "₹5000/day",
        rating: "4.8",
        category: "Luxury",
        description:
            "BMW 5 Series offers premium comfort, powerful engine and advanced safety features.",
      ),
      CarModel(
        image: [
          "https://pimwp.s3-accelerate.amazonaws.com/2021/01/wp4455833.jpg",
          "https://pimwp.s3-accelerate.amazonaws.com/2021/01/wp4455833.jpg",
          "https://pimwp.s3-accelerate.amazonaws.com/2021/01/wp4455833.jpg",
        ],
        name: "Maruti Swift",
        details: "Economy car",
        price: "₹1500/day",
        rating: "4.2",
        category: "Economy",
        description:
            "Maruti Swift is fuel efficient and perfect for city rides.",
      ),
      CarModel(
        image: [
          "https://www.hyundai.com/content/dam/hyundai/in/en/data/find-a-car/Creta/Highlights/knightking/cretakingmountain.jpg",
          "https://www.hyundai.com/content/dam/hyundai/in/en/data/find-a-car/Creta/Highlights/knightking/cretakingmountain.jpg",
          "https://www.hyundai.com/content/dam/hyundai/in/en/data/find-a-car/Creta/Highlights/knightking/cretakingmountain.jpg",
        ],
        name: "Hyundai Creta",
        details: "SUV",
        price: "₹3500/day",
        rating: "4.6",
        category: "SUV",
        description:
            "Hyundai Creta is a comfortable SUV with modern technology.",
      ),
      CarModel(
        image: [
          "https://images.hindustantimes.com/auto/auto-images/Maruti/Alto%20800/exterior_marutisuzuki-alto_front-right-side_630x420.jpg",
          "https://images.hindustantimes.com/auto/auto-images/Maruti/Alto%20800/exterior_marutisuzuki-alto_front-right-side_630x420.jpg",
          "https://images.hindustantimes.com/auto/auto-images/Maruti/Alto%20800/exterior_marutisuzuki-alto_front-right-side_630x420.jpg",
        ],
        name: "Maruti Alto",
        details: "Economy Car",
        price: "₹1000/day",
        rating: "4.6",
        category: "Economy",
        description: "",
      ),
      CarModel(
        image: [
          "https://imgd.aeplcdn.com/1920x1080/n/cw/ec/53695/new-gen-celerio-exterior-left-front-three-quarter.jpeg?isig=0&q=80&q=80",
          "https://imgd.aeplcdn.com/1920x1080/n/cw/ec/53695/new-gen-celerio-exterior-left-front-three-quarter.jpeg?isig=0&q=80&q=80",
          "https://imgd.aeplcdn.com/1920x1080/n/cw/ec/53695/new-gen-celerio-exterior-left-front-three-quarter.jpeg?isig=0&q=80&q=80",
        ],
        name: "Maruti Suzuki Celerio",
        details: "Economy Car",
        price: "₹1200/day",
        rating: "4.6",
        category: "Economy",
        description: "",
      ),
      CarModel(
        image: [
          "https://images.news18.com/ibnlive/uploads/2024/11/new-project-1-2-2024-11-08t150858.510-2024-11-e9d6a341de5150767fdc0ce5d096b044.jpg",
          "https://images.news18.com/ibnlive/uploads/2024/11/new-project-1-2-2024-11-08t150858.510-2024-11-e9d6a341de5150767fdc0ce5d096b044.jpg",
          "https://images.news18.com/ibnlive/uploads/2024/11/new-project-1-2-2024-11-08t150858.510-2024-11-e9d6a341de5150767fdc0ce5d096b044.jpg",
        ],
        name: "Maruti Suzuki Dzire",
        details: "Economy Car",
        price: "₹1300/day",
        rating: "4.5",
        category: "Economy",
        description: "",
      ),
      CarModel(
        image: [
          "https://images.overdrive.in/wp-content/odgallery/2022/08/63770_2022_Tata_Tiago-NRG_1.jpg",
          "https://images.overdrive.in/wp-content/odgallery/2022/08/63770_2022_Tata_Tiago-NRG_1.jpg",
          "https://images.overdrive.in/wp-content/odgallery/2022/08/63770_2022_Tata_Tiago-NRG_1.jpg",
        ],
        name: "Tata Tiago",
        details: "Economy Car",
        price: "₹1350/day",
        rating: "4.5",
        category: "Economy",
        description: "",
      ),
      CarModel(
        image: [
          "https://windingroad.com/wp-content/uploads/2023/04/kia_seltos-e1681337710523.jpg",
          "https://windingroad.com/wp-content/uploads/2023/04/kia_seltos-e1681337710523.jpg",
          "https://windingroad.com/wp-content/uploads/2023/04/kia_seltos-e1681337710523.jpg",
        ],
        name: "Kia Seltos",
        details: "SUV car",
        price: "₹3600/day",
        rating: "4.8",
        category: "SUV",
        description:
            "",
      ),
      CarModel(
        image: [
          "https://i.pinimg.com/736x/db/68/74/db6874631cb817b51b5c7eb5c7c608ee.jpg",
          "https://i.pinimg.com/736x/db/68/74/db6874631cb817b51b5c7eb5c7c608ee.jpg",
          "https://i.pinimg.com/736x/db/68/74/db6874631cb817b51b5c7eb5c7c608ee.jpg",
        ],
        name: "Mercedes-Benz C-Class",
        details: "Luxury car",
        price: "₹5000/day",
        rating: "4.8",
        category: "Luxury",
        description:
            "",
      ),
       CarModel(
        image: [
          "https://www.hdwallpapers.in/download/audi_a8_l_60_tfsi_e_quattro_2022_4k_5k_hd_cars-HD.jpg",
          "https://www.hdwallpapers.in/download/audi_a8_l_60_tfsi_e_quattro_2022_4k_5k_hd_cars-HD.jpg",
          "https://www.hdwallpapers.in/download/audi_a8_l_60_tfsi_e_quattro_2022_4k_5k_hd_cars-HD.jpg",
        ],
        name: "Audi A8",
        details: "Luxury car",
        price: "₹5000/day",
        rating: "4.8",
        category: "Luxury",
        description:
            "",
      ),
      CarModel(
        image: [
          "https://i.pinimg.com/736x/a3/9e/35/a39e358f369c647cc5cc8b8de129b5a4.jpg",
          "https://i.pinimg.com/736x/a3/9e/35/a39e358f369c647cc5cc8b8de129b5a4.jpg",
          "https://i.pinimg.com/736x/a3/9e/35/a39e358f369c647cc5cc8b8de129b5a4.jpg",
        ],
        name: "Volvo S90",
        details: "Luxury car",
        price: "₹5000/day",
        rating: "4.8",
        category: "Luxury",
        description:
            "",
      ),
       CarModel(
        image: [
          "https://www.supercars.net/blog/wp-content/uploads/2020/09/2021-Porsche-Panamera-Turbo-S-001-2160-scaled.jpg",
          "https://www.supercars.net/blog/wp-content/uploads/2020/09/2021-Porsche-Panamera-Turbo-S-001-2160-scaled.jpg",
          "https://www.supercars.net/blog/wp-content/uploads/2020/09/2021-Porsche-Panamera-Turbo-S-001-2160-scaled.jpg",
        ],
        name: "Porsche Panamera",
        details: "Luxury car",
        price: "₹6000/day",
        rating: "4.8",
        category: "Luxury",
        description:
            "",
      ),
      CarModel(
        image: [
          "https://mir-s3-cdn-cf.behance.net/projects/404/19c2cf148486929.Y3JvcCwzODcyLDMwMjgsMCw4MzM.png",
          "https://mir-s3-cdn-cf.behance.net/projects/404/19c2cf148486929.Y3JvcCwzODcyLDMwMjgsMCw4MzM.png",
          "https://mir-s3-cdn-cf.behance.net/projects/404/19c2cf148486929.Y3JvcCwzODcyLDMwMjgsMCw4MzM.png",
        ],
        name: "Mahindra XUV300",
        details: "SUV car",
        price: "₹3800/day",
        rating: "4.9",
        category: "SUV",
        description:
            "",
      ),
      CarModel(
        image: [
          "https://i.pinimg.com/736x/16/9f/97/169f975f74c1c95aea62e97505f174f0.jpg",
          "https://i.pinimg.com/736x/16/9f/97/169f975f74c1c95aea62e97505f174f0.jpg",
          "https://i.pinimg.com/736x/16/9f/97/169f975f74c1c95aea62e97505f174f0.jpg",
        ],
        name: "Toyota Fortuner",
        details: "SUV car",
        price: "₹4000/day",
        rating: "4.9",
        category: "SUV",
        description:
            "",
      ),
      CarModel(
        image: [
          "https://imgd.aeplcdn.com/1056x594/n/cw/ec/127077/skoda-kushaq-right-front-three-quarter0.jpeg?isig=0&wm=1&q=80",
          "https://imgd.aeplcdn.com/1056x594/n/cw/ec/127077/skoda-kushaq-right-front-three-quarter0.jpeg?isig=0&wm=1&q=80",
          "https://imgd.aeplcdn.com/1056x594/n/cw/ec/127077/skoda-kushaq-right-front-three-quarter0.jpeg?isig=0&wm=1&q=80",
        ],
        name: "Skoda Kushaq",
        details: "SUV car",
        price: "₹3900/day",
        rating: "4.9",
        category: "SUV",
        description:
            "",
      ),
    ];

    filteredList = carList;
  }

  void filterFunction(String? category, String? search) {
    setState(() {
      filteredList = carList.where((car) {
        final matchesCategory =
            category == null || category == 'All' || car.category == category;
        final matchesSearch =
            search == null ||
            search.isEmpty ||
            car.name.toLowerCase().contains(search.toLowerCase());
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
              padding: const EdgeInsets.all(16),
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
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: ChoiceChip(
                      label: Text(categories[index]),
                      selected: selectedIndex == index,
                      selectedColor: Colors.blue,
                      backgroundColor: Colors.lightBlueAccent[600],
                      labelStyle: TextStyle(
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.white70,
                      ),
                      onSelected: (_) {
                        setState(() {
                          selectedIndex = index;
                        });
                        filterFunction(categories[index], searchQuery);
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: filteredList.isEmpty
                  ? Center(
                      child: Text(
                        "No car found",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        final car = filteredList[index];
                        return CarCardWidget(car: car);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
