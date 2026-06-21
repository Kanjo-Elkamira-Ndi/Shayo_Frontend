import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'core/app_export.dart';
import 'widgets/common/custom/custom_error_widget.dart';
import 'core/theme/app_theme.dart' as core_theme;
import 'pages/splash_screen.dart';
import 'pages/onboarding_screen.dart';
import 'pages/auth/login_screen.dart';
import 'pages/auth/signup_screen.dart';
import 'pages/auth/verification_screen.dart';
import 'pages/auth/forgot_password_screen.dart';
import 'pages/auth/location_access_screen.dart';
import 'pages/customer/customer_shell.dart';
import 'pages/customer/search/search_page.dart';
import 'pages/customer/search/filter_page.dart';
import 'pages/customer/restaurant_detail/restaurant_detail_page.dart';
import 'pages/customer/cart/cart_page.dart';
import 'pages/customer/checkout/checkout_page.dart';
import 'pages/customer/checkout/schedule_delivery_page.dart';
import 'pages/customer/orders/order_history_page.dart';
import 'pages/customer/orders/order_tracking_page.dart';
import 'pages/customer/orders/order_detail_page.dart';
import 'pages/customer/wallet/wallet_page.dart';
import 'pages/customer/wallet/transaction_history_page.dart';
import 'pages/customer/loyalty/rewards_page.dart';
import 'pages/customer/ar_preview/ar_food_preview_page.dart';
import 'pages/customer/education/education_home_page.dart';
import 'pages/customer/education/recipe_detail_page.dart';
import 'pages/customer/education/cooking_tutorial_page.dart';
import 'pages/customer/chat/support_chat_page.dart';
import 'pages/customer/chat/restaurant_chat_page.dart';
import 'pages/customer/reviews/write_review_page.dart';
import 'pages/customer/profile/profile_page.dart';
import 'pages/customer/profile/edit_profile_page.dart';
import 'pages/customer/profile/address_management_page.dart';
import 'pages/customer/settings/settings_page.dart';
import 'pages/customer/settings/notification_preferences_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(path: AppRoutes.splash, builder: (_, __) => const SplashScreen()),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (_, __) => const OnboardingScreen(),
    ),
    GoRoute(path: AppRoutes.login, builder: (_, __) => const LoginScreen()),
    GoRoute(path: AppRoutes.register, builder: (_, __) => const SignUpScreen()),
    GoRoute(
      path: AppRoutes.verification,
      builder: (_, state) => VerificationScreen(
        email: state.extra as String? ?? '',
      ),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      builder: (_, __) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.locationAccess,
      builder: (_, __) => const LocationAccessScreen(),
    ),
    GoRoute(path: AppRoutes.home, builder: (_, __) => const CustomerShell()),
    GoRoute(path: AppRoutes.food, builder: (_, __) => const RestaurantDetailPage()),
    GoRoute(
      path: AppRoutes.restaurantMenu,
      builder: (_, __) => const RestaurantDetailPage(),
    ),
    GoRoute(path: AppRoutes.cart, builder: (_, __) => const CartPage()),
    GoRoute(path: AppRoutes.checkout, builder: (_, __) => const CheckoutPage()),
    GoRoute(
      path: AppRoutes.editCart,
      builder: (_, __) => const CartPage(),
    ),
    GoRoute(path: AppRoutes.profile, builder: (_, __) => const ProfilePage()),
    GoRoute(path: AppRoutes.settings, builder: (_, __) => const SettingsPage()),
    GoRoute(path: AppRoutes.editProfile, builder: (_, __) => const EditProfilePage()),
    GoRoute(path: AppRoutes.addresses, builder: (_, __) => const AddressManagementPage()),
    GoRoute(path: AppRoutes.notifications, builder: (_, __) => const NotificationPreferencesPage()),
    GoRoute(path: AppRoutes.scheduleDelivery, builder: (_, __) => const ScheduleDeliveryPage()),
    GoRoute(path: AppRoutes.orderHistory, builder: (_, __) => const OrderHistoryPage()),
    GoRoute(path: AppRoutes.orderTracking, builder: (_, __) => const OrderTrackingPage()),
    GoRoute(path: AppRoutes.orderDetail, builder: (_, __) => const OrderDetailPage()),
    GoRoute(path: AppRoutes.wallet, builder: (_, __) => const WalletPage()),
    GoRoute(path: AppRoutes.transactions, builder: (_, __) => const TransactionHistoryPage()),
    GoRoute(path: AppRoutes.rewards, builder: (_, __) => const RewardsPage()),
    GoRoute(path: AppRoutes.search, builder: (_, __) => const SearchPage()),
    GoRoute(path: AppRoutes.filter, builder: (_, __) => const FilterPage()),
    GoRoute(path: AppRoutes.education, builder: (_, __) => const EducationHomePage()),
    GoRoute(path: AppRoutes.recipe, builder: (_, __) => const RecipeDetailPage()),
    GoRoute(path: AppRoutes.tutorial, builder: (_, __) => const CookingTutorialPage()),
    GoRoute(path: AppRoutes.supportChat, builder: (_, __) => const SupportChatPage()),
    GoRoute(path: AppRoutes.restaurantChat, builder: (_, __) => const RestaurantChatPage()),
    GoRoute(path: AppRoutes.writeReview, builder: (_, __) => const WriteReviewPage()),
    GoRoute(path: AppRoutes.arPreview, builder: (_, __) => const ArFoodPreviewPage()),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool hasShownError = false;

  // 🚨 CRITICAL: Custom error handling - DO NOT REMOVE
  ErrorWidget.builder = (FlutterErrorDetails details) {
    if (!hasShownError) {
      hasShownError = true;

      // Reset flag after 3 seconds to allow error widget on new screens
      Future.delayed(Duration(seconds: 5), () {
        hasShownError = false;
      });

      return CustomErrorWidget(errorDetails: details);
    }
    return SizedBox.shrink();
  };

  // 🚨 CRITICAL: Device orientation lock - DO NOT REMOVE
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]).then((value) {
    GoRouter.optionURLReflectsImperativeAPIs = true;
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          title: 'SHAYO',
          theme: core_theme.AppTheme.lightTheme,
          darkTheme: core_theme.AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          // 🚨 CRITICAL: NEVER REMOVE OR MODIFY
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: TextScaler.linear(1.0)),
              child: child!,
            );
          },
          // 🚨 END CRITICAL SECTION
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
        );
      },
    );
  }
}
