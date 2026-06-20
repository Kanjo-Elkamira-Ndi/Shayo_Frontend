import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedLocation = 'Halal Lab office';

  final List<FoodCategory> foodCategories = [
    FoodCategory(
      name: 'Pizza',
      startingPrice: 2500,
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_640.jpg',
    ),
    FoodCategory(
      name: 'Burger',
      startingPrice: 1800,
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/10/05/19/55/hamburger-5630646_640.jpg',
    ),
    FoodCategory(
      name: 'Pasta',
      startingPrice: 2200,
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/07/18/19/12/pasta-3547078_640.jpg',
    ),
    FoodCategory(
      name: 'Sushi',
      startingPrice: 3500,
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/10/15/11/41/sushi-2853382_640.jpg',
    ),
    FoodCategory(
      name: 'Salad',
      startingPrice: 1500,
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/09/16/19/21/salad-2756467_640.jpg',
    ),
  ];

  final List<Restaurant> restaurants = [
    Restaurant(
      name: 'Rose Garden Restaurant',
      categories: ['Burger', 'Chiken', 'Riche', 'Wings'],
      rating: 4.7,
      deliveryType: 'Free',
      deliveryTime: '20 min',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/11/18/14/39/beans-1834984_640.jpg',
    ),
    Restaurant(
      name: 'La Terrasse',
      categories: ['Pizza', 'Pasta', 'Italian', 'Wine'],
      rating: 4.5,
      deliveryType: 'Free',
      deliveryTime: '25 min',
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/09/02/12/25/restaurant-918555_640.jpg',
    ),
    Restaurant(
      name: 'Ocean Breeze',
      categories: ['Seafood', 'Fish', 'Grilled', 'Fresh'],
      rating: 4.8,
      deliveryType: 'Free',
      deliveryTime: '30 min',
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/11/05/15/57/salmon-518032_640.jpg',
    ),
    Restaurant(
      name: 'Spice Kitchen',
      categories: ['Indian', 'Curry', 'Biryani', 'Naan'],
      rating: 4.6,
      deliveryType: 'Free',
      deliveryTime: '22 min',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/03/27/22/18/india-1284040_640.jpg',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          // TO-DO: Open drawer
                        },
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'DELIVER TO',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFFFF6B35),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                selectedLocation,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1A1A1A),
                                ),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                size: 20,
                                color: Color(0xFF1A1A1A),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1A1D2E),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD32048),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Greeting
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF1A1A1A),
                          ),
                          children: [
                            TextSpan(text: 'Hey Halal, '),
                            TextSpan(
                              text: 'Good Afternoon!',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Search bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Color(0xFF9E9E9E),
                              size: 22,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Search dishes, restaurants',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF9E9E9E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // All Categories header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'All Categories',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // TO-DO: Show all categories
                            },
                            child: const Row(
                              children: [
                                Text(
                                  'See All',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF9E9E9E),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                  color: Color(0xFF9E9E9E),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Food Categories - Horizontal scrollable
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: foodCategories.length,
                        itemBuilder: (context, index) {
                          return _FoodCategoryCard(
                            category: foodCategories[index],
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Open Restaurants header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Open Restaurants',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // TO-DO: Show all restaurants
                            },
                            child: const Row(
                              children: [
                                Text(
                                  'See All',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF9E9E9E),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                  color: Color(0xFF9E9E9E),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Restaurants - Vertical scrollable
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

class _FoodCategoryCard extends StatelessWidget {
  final FoodCategory category;

  const _FoodCategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            height: 105,
            decoration: BoxDecoration(
              color: const Color(0xFFA6B5C5),
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              category.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: const Color(0xFFA6B5C5));
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${category.startingPrice} FCFA',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
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
          Text(
            restaurant.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            restaurant.categories.join(' • '),
            style: const TextStyle(fontSize: 12, color: Color(0xFF9E9E9E)),
          ),
          const SizedBox(height: 8),
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

class FoodCategory {
  final String name;
  final int startingPrice;
  final String imageUrl;

  FoodCategory({
    required this.name,
    required this.startingPrice,
    required this.imageUrl,
  });
}

class Restaurant {
  final String name;
  final List<String> categories;
  final double rating;
  final String deliveryType;
  final String deliveryTime;
  final String imageUrl;

  Restaurant({
    required this.name,
    required this.categories,
    required this.rating,
    required this.deliveryType,
    required this.deliveryTime,
    required this.imageUrl,
  });
}
