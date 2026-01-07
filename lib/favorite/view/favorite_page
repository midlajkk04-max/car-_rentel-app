import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/favorite/service/favorite_service.dart';
import 'package:hive_project/features/user/vehicle_search/model/car_card_model.dart';
import 'package:hive_project/car_featurs/view/car_features.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteBox = Hive.box('favoriteBox');

    return Scaffold(
      backgroundColor: const Color(0xFF0F1720),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1720),
        title: const Text("My Favorites"),
        centerTitle: true,
      ),

      
      body: ValueListenableBuilder(
        valueListenable: favoriteBox.listenable(),
        builder: (context, box, _) {
          final List<CarModel> favorites =
              FavoriteService.getFavorites();

          if (favorites.isEmpty) {
            return const Center(
              child: Text(
                "No favorites added",
                style: TextStyle(color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.only(top: 12),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final car = favorites[index];

              return Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C2630),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CarFeatures(car: car),
                      ),
                    );
                  },
                  child: Row(
                    children: [

          
                      ClipRRect(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(16),
                        ),
                        child: Image.network(
                          car.image[0],
                          height: 120,
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 12),

                
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: 12),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                car.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                car.details,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                car.price,
                                style: const TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () async {
                          await FavoriteService.removeFavorite(
                            car.name,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}