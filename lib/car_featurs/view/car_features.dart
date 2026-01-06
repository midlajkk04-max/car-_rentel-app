import 'package:flutter/material.dart';
import 'package:hive_project/booking/view/booking.dart';
import 'package:hive_project/features/user/auth/service/user_service.dart';
import 'package:hive_project/features/user/vehicle_search/model/car_card_model.dart';

class CarFeatures extends StatefulWidget {
  final CarModel car;
  const CarFeatures({super.key, required this.car});

  @override
  State<CarFeatures> createState() => _CarFeaturesState();
}

class _CarFeaturesState extends State<CarFeatures> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1B24),
      body: Column(
        children: [
      
          Stack(
            children: [
              SizedBox(
                height: 280,
                child: PageView.builder(
                  itemCount: widget.car.image.length,
                  onPageChanged: (i) {
                    setState(() => currentIndex = i);
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      widget.car.image[index],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),

              
              Positioned(
                top: 40,
                left: 12,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

            
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.car.image.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: currentIndex == index ? 16 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? Colors.blueAccent
                            : Colors.white54,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

      
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFF0F1B24),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  Text(
                    widget.car.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.car.details,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 20),

          
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _chip(Icons.star, widget.car.rating),
                      _chip(Icons.local_gas_station, "Petrol"),
                      _chip(Icons.settings, "Automatic"),
                      _chip(Icons.people, "5 Seats"),
                    ],
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.car.description,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const Spacer(),

                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Price / day",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            widget.car.price,
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {
                          final user = UserService.getCurrentUser();
                          if (user == null) return;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BookingPage(
                                carName: widget.car.name,
                                carImage: widget.car.image[0],
                                carPrice: widget.car.price,
                                userId: user.email,
                              ),
                            ),
                          );
                        },
                        child: const Text("Book Now"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2630),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blueAccent, size: 18),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
