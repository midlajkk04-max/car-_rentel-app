import 'package:flutter/material.dart';
import 'package:hive_project/booking/view/booking.dart';
import 'package:hive_project/car_featurs/view/car_features.dart';
import 'package:hive_project/favorite/service/favorite_service.dart';
import 'package:hive_project/features/user/auth/service/user_service.dart';
import 'package:hive_project/features/user/vehicle_search/model/car_card_model.dart';

class CarCardWidget extends StatefulWidget {
  final CarModel car;
  const CarCardWidget({super.key, required this.car});

  @override
  State<CarCardWidget> createState() => _CarCardWidgetState();
}

class _CarCardWidgetState extends State<CarCardWidget> {
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    isFav = FavoriteService.isFavorite(widget.car);
  }

  void toggleFavorite() async {
    if (isFav) {
      await FavoriteService.removeFavorite(widget.car.name);
    } else {
      await FavoriteService.addFavorite(widget.car);
    }
    setState(() => isFav = !isFav);
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.car.image.isNotEmpty
        ? widget.car.image.first
        : 'https://via.placeholder.com/400';

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2630),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CarFeatures(car: widget.car),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: toggleFavorite,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.car.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.car.price,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  widget.car.details,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final user = UserService.getCurrentUser();

                      if (user == null || user.email == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please login again")),
                        );
                        return;
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookingPage(
                            carName: widget.car.name,
                            carImage: imageUrl,
                            carPrice: widget.car.price,
                            userId: user.email!,
                          ),
                        ),
                      );
                    },
                    child: const Text("Book Now"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
