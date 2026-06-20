import 'package:flutter/material.dart';

class RestaurantMenuScreen extends StatefulWidget {
  const RestaurantMenuScreen({super.key});

  @override
  State<RestaurantMenuScreen> createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  int currentImageIndex = 2; // Middle image (0-indexed)
  String selectedCategory = 'Burger';

  final List<String> carouselImages = [
    'https://images.unsplash.com/photo-1571091718767-18b5b1457add',
    'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
    'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38',
    'https://images.unsplash.com/photo-1586190848861-99aa4a171e90',
    'https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5',
  ];

  final List<String> categories = [
    'Burger',
    'Sandwich',
    'Pizza',
    'Sandwich',
    'Pasta',
    'Salad',
  ];

  final List<Map<String, dynamic>> menuItems = [
    {
      'name': 'Burger Ferguson',
      'restaurant': 'Spicy Restaurant',
      'price': '2500',
      'image': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
    },
    {
      'name': 'Rockin\' Burgers',
      'restaurant': 'Cafecafechino',
      'price': '3000',
      'image': 'https://images.unsplash.com/photo-1550547660-d9450f859349',
    },
    {
      'name': 'Classic Burger',
      'restaurant': 'Spicy Restaurant',
      'price': '2800',
      'image': 'https://images.unsplash.com/photo-1571091718767-18b5b1457add',
    },
    {
      'name': 'Cheese Delight',
      'restaurant': 'Burger House',
      'price': '3200',
      'image': 'https://images.unsplash.com/photo-1586190848861-99aa4a171e90',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Carousel section
            Stack(
              children: [
                // Image carousel
                SizedBox(
                  height: 280,
                  child: PageView.builder(
                    itemCount: carouselImages.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentImageIndex = index;
                      });
                    },
                    controller: PageController(
                      initialPage: currentImageIndex,
                      viewportFraction: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFA6B5C5),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          carouselImages[index],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(color: const Color(0xFFA6B5C5));
                          },
                        ),
                      );
                    },
                  ),
                ),
                // Back button
                Positioned(
                  top: 16,
                  left: 16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ),
                ),
                // More options button
                Positioned(
                  top: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: () {
                      // Show menu options
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.more_horiz,
                        size: 24,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ),
                ),
                // Carousel indicators
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      carouselImages.length,
                      (index) => Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentImageIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                          border: currentImageIndex == index
                              ? Border.all(color: Colors.white, width: 2)
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Restaurant info section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating, delivery, time
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFD32048),
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '4.7',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(width: 24),
                      const Icon(
                        Icons.delivery_dining,
                        color: Color(0xFFD32048),
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Free',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(width: 24),
                      const Icon(
                        Icons.access_time,
                        color: Color(0xFFD32048),
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '20 min',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Restaurant name
                  const Text(
                    'Spicy Restaurant',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Description
                  const Text(
                    'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF9E9E9E),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            // Category tabs - Horizontally scrollable
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = selectedCategory == category;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFFF6B35)
                            : const Color(0xFFF5F5F7),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF1A1A1A),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Menu items header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    'Burger (${menuItems.length})',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Menu items grid - Scrollable
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return _MenuItemCard(
                    name: item['name'],
                    restaurant: item['restaurant'],
                    price: item['price'],
                    imageUrl: item['image'],
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

class _MenuItemCard extends StatelessWidget {
  final String name;
  final String restaurant;
  final String price;
  final String imageUrl;

  const _MenuItemCard({
    required this.name,
    required this.restaurant,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFA6B5C5),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: const Color(0xFFA6B5C5));
              },
            ),
          ),

          // Details
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  restaurant,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9E9E9E),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$price FCFA',
                      style: const TextStyle(
                        fontSize: 16,
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
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
