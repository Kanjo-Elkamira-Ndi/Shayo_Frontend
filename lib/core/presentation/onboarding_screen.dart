import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<OnboardingData> onboardingPages = [
    OnboardingData(
      imageUrl:
          'https://cdn.pixabay.com/photo/2019/11/28/18/15/jollof-4659747_640.jpg',
      title: 'All your favorites',
      description:
          'Get all your loved foods in one place, you just place the order we do the rest',
    ),
    OnboardingData(
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/10/05/19/55/hamburger-5630646_640.jpg',
      title: 'Quick delivery',
      description:
          'Fast and reliable delivery service right to your doorstep whenever you need it',
    ),
    OnboardingData(
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_640.jpg',
      title: 'Share your experience',
      description:
          'Join our food community, share reviews and discover amazing restaurants near you',
    ),
    OnboardingData(
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/11/23/18/31/breakfast-1854549_640.jpg',
      title: 'Easy ordering',
      description:
          'Simple and intuitive interface makes ordering your favorite meals effortless',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
    });
  }

  void _nextPage() {
    if (currentPage < onboardingPages.length - 1) {
      _pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToHome();
    }
  }

  void _navigateToHome() {
    // TO-DO: Navigate to main app/auth screen
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => const AuthScreen()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: onboardingPages.length,
                itemBuilder: (context, index) {
                  return _buildOnboardingPage(onboardingPages[index]);
                },
              ),
            ),

            // Bottom section with indicators and buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  // Page indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingPages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == index
                              ? const Color(0xFFD32048)
                              : const Color(0xFFE8E8E8),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Next button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD32048),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        currentPage == onboardingPages.length - 1
                            ? 'GET STARTED'
                            : 'NEXT',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Skip button
                  TextButton(
                    onPressed: _navigateToHome,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF9E9E9E),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(OnboardingData data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 60),

          // Image container
          Container(
            width: double.infinity,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFA6B5C5),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              data.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFA6B5C5),
                  child: const Center(
                    child: Icon(
                      Icons.image_outlined,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: const Color(0xFFA6B5C5),
                  child: const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 40),

          // Title
          Text(
            data.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // Description
          Text(
            data.description,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF9E9E9E),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String imageUrl;
  final String title;
  final String description;

  OnboardingData({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}
