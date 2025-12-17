import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  final String category;

  const FoodScreen({super.key, this.category = 'BURGER'});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  String selectedCategory = 'BURGER';
  int? selectedItemIndex;

  final List<FoodItem> burgerItems = [
    FoodItem(
      name: 'Burger Bistro',
      restaurant: 'Rose Garden',
      price: 2500,
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/10/05/19/55/hamburger-5630646_640.jpg',
    ),
    FoodItem(
      name: "Smokin' Burger",
      restaurant: 'Caferio Restaurant',
      price: 3000,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_640.jpg',
    ),
    FoodItem(
      name: 'Buffalo Burgers',
      restaurant: 'Kaji Firm Kitchen',
      price: 3750,
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/05/12/09/25/burger-2306181_640.jpg',
    ),
    FoodItem(
      name: 'Bullseye Burgers',
      restaurant: 'Kabab Restaurant',
      price: 4700,
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/03/04/20/08/hamburger-3199088_640.jpg',
    ),
  ];

  final List<Restaurant> restaurants = [
    Restaurant(
      name: 'Tasty Treat Gallery',
      rating: 4.7,
      deliveryType: 'Free',
      deliveryTime: '20 min',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/11/18/14/39/beans-1834984_640.jpg',
    ),
    Restaurant(
      name: 'Burger House',
      rating: 4.5,
      deliveryType: 'Free',
      deliveryTime: '25 min',
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/04/20/13/30/burger-731298_640.jpg',
    ),
    Restaurant(
      name: 'Grill Masters',
      rating: 4.8,
      deliveryType: 'Free',
      deliveryTime: '18 min',
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706_640.jpg',
    ),
    Restaurant(
      name: 'Fast Food Corner',
      rating: 4.3,
      deliveryType: 'Free',
      deliveryTime: '30 min',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/03/05/19/02/abstract-1238247_640.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Category dropdown
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            selectedCategory,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                            color: Color(0xFF1A1A1A),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Search button
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1A1D2E),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Filter button
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.tune,
                      color: Color(0xFF1A1A1A),
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Popular Burgers section
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Popular Burgers',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Food items grid
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.75,
                            ),
                        itemCount: burgerItems.length,
                        itemBuilder: (context, index) {
                          return _FoodItemCard(
                            item: burgerItems[index],
                            isSelected: selectedItemIndex == index,
                            onTap: () {
                              setState(() {
                                selectedItemIndex = index;
                              });
                            },
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Open Restaurants section
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Open Restaurants',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Restaurants list - Scrollable
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: restaurants.length,
                      itemBuilder: (context, index) {
                        return _RestaurantCard(restaurant: restaurants[index]);
                      },
                    ),

                    const SizedBox(height: 20),
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

class _FoodItemCard extends StatelessWidget {
  final FoodItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _FoodItemCard({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? const Color(0xFF4A90E2) : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Food image
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFA6B5C5),
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: const Color(0xFFA6B5C5));
                },
              ),
            ),
            const SizedBox(height: 8),
            // Food name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item.name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Restaurant name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item.restaurant,
                style: const TextStyle(fontSize: 12, color: Color(0xFF9E9E9E)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            // Price and add button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${item.price} FCFA',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF6B35),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const _RestaurantCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Restaurant image
          Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              color: const Color(0xFFA6B5C5),
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              restaurant.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: const Color(0xFFA6B5C5));
              },
            ),
          ),
          const SizedBox(height: 12),
          // Restaurant name
          Text(
            restaurant.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 8),
          // Restaurant info
          Row(
            children: [
              const Icon(Icons.star, color: Color(0xFFD32048), size: 18),
              const SizedBox(width: 4),
              Text(
                restaurant.rating.toString(),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(width: 16),
              const Icon(
                Icons.delivery_dining,
                color: Color(0xFFD32048),
                size: 18,
              ),
              const SizedBox(width: 4),
              Text(
                restaurant.deliveryType,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.access_time, color: Color(0xFFD32048), size: 18),
              const SizedBox(width: 4),
              Text(
                restaurant.deliveryTime,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FoodItem {
  final String name;
  final String restaurant;
  final int price;
  final String imageUrl;

  FoodItem({
    required this.name,
    required this.restaurant,
    required this.price,
    required this.imageUrl,
  });
}

class Restaurant {
  final String name;
  final double rating;
  final String deliveryType;
  final String deliveryTime;
  final String imageUrl;

  Restaurant({
    required this.name,
    required this.rating,
    required this.deliveryType,
    required this.deliveryTime,
    required this.imageUrl,
  });
}
