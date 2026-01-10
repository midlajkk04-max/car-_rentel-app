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
          "https://stimg.cardekho.com/images/carexteriorimages/930x620/BMW/5-Series/10182/1762506368495/front-grill---logo-98.jpg",
          "https://stimg.cardekho.com/images/carexteriorimages/930x620/BMW/5-Series/10182/1762506368495/headlight-43.jpg",
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
          "https://images.overdrive.in/wp-content/odgallery/2018/01/40166_Maruti_Suzuki_Swift_interior--027.JPG",
          "https://images.overdrive.in/wp-content/odgallery/2018/01/40182_Maruti_Suzuki_Swift_interior--012.JPG",
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
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/106815/creta-interior-rear-seats-2.jpeg?isig=0&q=80",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/106815/creta-interior-inner-car-roof.jpeg?isig=0&q=80",
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
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/147361/maruti-suzuki-alto-k10-dashboard18.jpeg?isig=0&wm=1&q=80",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/147361/maruti-suzuki-alto-k10-open-boot-trunk24.jpeg?isig=0&wm=1&q=80",
        ],
        name: "Maruti Alto",
        details: "Economy Car",
        price: "₹1000/day",
        rating: "4.6",
        category: "Economy",
        description: "Maruti Alto is a fuel-efficient economy car ideal for city travel. It is easy to drive and has low maintenance costs.",
      ),
      CarModel(
        image: [
          "https://imgd.aeplcdn.com/1920x1080/n/cw/ec/53695/new-gen-celerio-exterior-left-front-three-quarter.jpeg?isig=0&q=80&q=80",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/107437/maruti-suzuki-celerio-dashboard10.jpeg?isig=0&wm=1&q=80",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/126345/maruti-suzuki-celerio-instrument-cluster5.jpeg?isig=0&wm=1&q=80",
        ],
        name: "Maruti Suzuki Celerio",
        details: "Economy Car",
        price: "₹1200/day",
        rating: "4.6",
        category: "Economy",
        description: "Maruti Suzuki Celerio is a compact economy car that offers smooth driving and good mileage, making it perfect for daily use.",
      ),
      CarModel(
        image: [
          "https://images.news18.com/ibnlive/uploads/2024/11/new-project-1-2-2024-11-08t150858.510-2024-11-e9d6a341de5150767fdc0ce5d096b044.jpg",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/170173/dzire-2024-interior-dashboard-2.jpeg?isig=0&q=80",
          "https://stimg.cardekho.com/images/carexteriorimages/930x620/Maruti/Dzire/11387/1751526167845/drl-237.jpg",
        ],
        name: "Maruti Suzuki Dzire",
        details: "Economy Car",
        price: "₹1300/day",
        rating: "4.5",
        category: "Economy",
        description: "Maruti Suzuki Dzire is a comfortable sedan economy car suitable for family trips and city rides. It offers a spacious interior.",
      ),
      CarModel(
        image: [
          "https://images.overdrive.in/wp-content/odgallery/2022/08/63770_2022_Tata_Tiago-NRG_1.jpg",
          "https://static-cdn.cars24.com/prod/new-car-cms/Tata/Tiago/2025/02/07/8d7ca721-e843-443d-a575-83c5bda8c2eb-17.jpg?w=640&dpr=2&optimize=low&format=auto&quality=50",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/39345/tiago-interior-headlight-stalk-2.jpeg?q=80",
        ],
        name: "Tata Tiago",
        details: "Economy Car",
        price: "₹1350/day",
        rating: "4.5",
        category: "Economy",
        description: "Tata Tiago is a safe and reliable economy car with strong build quality and a comfortable driving experience.",
      ),
      CarModel(
        image: [
          "https://windingroad.com/wp-content/uploads/2023/04/kia_seltos-e1681337710523.jpg",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/192817/new-seltos-interior-front-row-seats-13.jpeg?isig=0&q=80",
          "https://stimg.cardekho.com/images/carexteriorimages/360x240/Kia/Seltos-2026/12770/1766479168733/rear-view-119.jpg?tr=w-360",
        ],
        name: "Kia Seltos",
        details: "SUV car",
        price: "₹3600/day",
        rating: "4.8",
        category: "SUV",
        description:
            "Kia Seltos is a stylish SUV with advanced features and powerful performance, ideal for long drives.",
      ),
      CarModel(
        image: [
          "https://i.pinimg.com/736x/db/68/74/db6874631cb817b51b5c7eb5c7c608ee.jpg",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/178535/c-class-interior-rear-row-centre-arm-rest.jpeg?isig=0&q=80",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/178535/c-class-interior-infotainment-system-2.webp?isig=0&q=80",
        ],
        name: "Mercedes-Benz C-Class",
        details: "Luxury car",
        price: "₹5000/day",
        rating: "4.8",
        category: "Luxury",
        description:
            "Mercedes-Benz C-Class is a premium luxury car that delivers superior comfort and a smooth driving experience.",
      ),
       CarModel(
        image: [
          "https://www.hdwallpapers.in/download/audi_a8_l_60_tfsi_e_quattro_2022_4k_5k_hd_cars-HD.jpg",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/124141/a8-l-interior-dashboard.jpeg?isig=0&q=80",
          "https://stimg.cardekho.com/images/carinteriorimages/930x620/Audi/Audi-A8-2019/6722/1544780260490/infotainment-stytem-57.jpg?tr=w-420",
        ],
        name: "Audi A8",
        details: "Luxury car",
        price: "₹5000/day",
        rating: "4.8",
        category: "Luxury",
        description:
            "Audi A8 is a high-end luxury sedan featuring advanced technology, a premium interior, and an elite driving experience.",
      ),
      CarModel(
        image: [
          "https://i.pinimg.com/736x/a3/9e/35/a39e358f369c647cc5cc8b8de129b5a4.jpg",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/105969/interior-rear-seats-9.jpeg?isig=0&q=80",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/201255/s90-interior-dashboard.jpeg?isig=0&q=80",
        ],
        name: "Volvo S90",
        details: "Luxury car",
        price: "₹5000/day",
        rating: "4.8",
        category: "Luxury",
        description:
            "Volvo S90 is a luxury car focused on safety, offering elegant design, smooth handling, and maximum comfort.",
      ),
       CarModel(
        image: [
          "https://www.supercars.net/blog/wp-content/uploads/2020/09/2021-Porsche-Panamera-Turbo-S-001-2160-scaled.jpg",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/165641/panamera-interior-second-row-seats.jpeg?isig=0&q=80",
          "https://imgcdn.oto.com/large/gallery/exterior/31/248/porsche-panamera-grille-view-103544.jpg",
        ],
        name: "Porsche Panamera",
        details: "Luxury car",
        price: "₹6000/day",
        rating: "4.8",
        category: "Luxury",
        description:
            "Porsche Panamera is a luxury sports sedan that combines powerful performance with premium design and an exciting driving experience.",
      ),
      CarModel(
        image: [
          "https://mir-s3-cdn-cf.behance.net/projects/404/19c2cf148486929.Y3JvcCwzODcyLDMwMjgsMCw4MzM.png",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/53749/dashboard19.jpeg?wm=1&q=80",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/53749/instrument-cluster20.jpeg?wm=1&q=80",
        ],
        name: "Mahindra XUV300",
        details: "SUV car",
        price: "₹3800/day",
        rating: "4.9",
        category: "SUV",
        description:
            "Mahindra XUV300 is a compact SUV with strong safety features, comfortable seating, and excellent performance for both city and highway driving.",
      ),
      CarModel(
        image: [
          "https://i.pinimg.com/736x/16/9f/97/169f975f74c1c95aea62e97505f174f0.jpg",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/44709/fortuner-interior-gear-shifter-gear-shifter-stalk.avif?isig=0&q=80",
          "https://stimg.cardekho.com/images/carinteriorimages/930x620/Toyota/Fortuner/10904/1755075351708/steering-wheel-54.jpg?tr=w-420",
        ],
        name: "Toyota Fortuner",
        details: "SUV car",
        price: "₹4000/day",
        rating: "4.9",
        category: "SUV",
        description:
            "Toyota Fortuner is a powerful premium SUV known for its strong engine, off-road capability, and luxurious comfort.",
      ),
      CarModel(
        image: [
          "https://imgd.aeplcdn.com/1056x594/n/cw/ec/127077/skoda-kushaq-right-front-three-quarter0.jpeg?isig=0&wm=1&q=80",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/175993/kushaq-interior-steering-wheel.jpeg?isig=0&q=80",
          "https://imgd.aeplcdn.com/370x208/n/cw/ec/175993/kushaq-interior-front-centre-air-vents.jpeg?isig=0&q=80",
        ],
        name: "Skoda Kushaq",
        details: "SUV car",
        price: "₹3900/day",
        rating: "4.9",
        category: "SUV",
        description:
            "Skoda Kushaq is a modern SUV offering smooth handling, a premium interior, and a comfortable long-distance travel experience.",
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
                            : Colors.white,
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