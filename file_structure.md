lib/
├── main.dart
├── app.dart
│
├── core/
│   ├── constants/
│   │   ├── api_constants.dart
│   │   ├── app_constants.dart
│   │   ├── asset_constants.dart
│   │   └── role_constants.dart        # enum UserRole { customer, restaurant, rider, admin }
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   └── app_dimensions.dart
│   ├── errors/
│   │   ├── exceptions.dart
│   │   └── failure.dart
│   └── extensions/
│       └── context_extensions.dart
│
├── routes/
│   ├── app_router.dart
│   ├── route_names.dart
│   └── role_based_routes.dart         # decides initial route/shell per role
│
├── middleware/
│   ├── auth_middleware.dart           # checks token/session
│   ├── role_guard_middleware.dart     # blocks access to wrong-role routes
│   └── connectivity_middleware.dart
│
├── api/
│   ├── api_client.dart                # Dio/http setup
│   ├── api_endpoints.dart
│   ├── api_response_handler.dart
│   └── interceptors/
│       ├── auth_interceptor.dart
│       └── logging_interceptor.dart
│
├── services/
│   ├── shared/
│   │   ├── auth_service.dart
│   │   ├── notification_service.dart
│   │   ├── location_service.dart
│   │   ├── payment_service.dart
│   │   ├── wallet_service.dart
│   │   ├── chat_service.dart
│   │   ├── upload_service.dart
│   │   ├── ar_preview_service.dart    # AR food display
│   │   └── settings_service.dart            # NEW — generic get/update settings API calls, reused by all roles
│   ├── customer/
│   │   ├── order_service.dart
│   │   ├── cart_service.dart
│   │   ├── search_service.dart
│   │   ├── loyalty_service.dart
│   │   └── review_service.dart
│   ├── restaurant/
│   │   ├── menu_service.dart
│   │   ├── order_management_service.dart
│   │   ├── earnings_service.dart
│   │   └── registration_service.dart
│   ├── rider/                         # future
│   │   ├── delivery_service.dart
│   │   └── earnings_service.dart
│   └── social/                        # future: food social media
│       ├── feed_service.dart
│       ├── post_service.dart
│       └── follow_service.dart
│
├── controllers/
│   ├── shared/
│   │   ├── auth_controller.dart
│   │   ├── notification_controller.dart
│   │   ├── location_controller.dart
│   │   ├── theme_controller.dart
│   │   ├── language_controller.dart
│   │   └── chat_controller.dart
│   ├── customer/
│   │   ├── home_controller.dart
│   │   ├── cart_controller.dart
│   │   ├── checkout_controller.dart
│   │   ├── order_controller.dart
│   │   ├── search_controller.dart
│   │   ├── wallet_controller.dart
│   │   ├── loyalty_controller.dart
│   │   ├── review_controller.dart
│   │   └── settings_controller.dart         # NEW
│   ├── restaurant/
│   │   ├── dashboard_controller.dart
│   │   ├── menu_controller.dart
│   │   ├── order_management_controller.dart
│   │   ├── earnings_controller.dart
│   │   ├── registration_controller.dart
│   │   └── settings_controller.dart         # NEW
│   ├── rider/                         # future
│   │   ├── delivery_controller.dart
│   │   ├── earnings_controller.dart
│   │   └── settings_controller.dart         # NEW
│   └── social/                        # future
│       ├── feed_controller.dart
│       └── post_controller.dart
│
├── dto/
│   ├── auth/
│   │   ├── login_request_dto.dart
│   │   ├── register_request_dto.dart
│   │   └── otp_verify_dto.dart
│   ├── user/
│   │   └── user_dto.dart
│   ├── restaurant/
│   │   ├── restaurant_dto.dart
│   │   ├── menu_item_dto.dart
│   │   └── registration_dto.dart
│   ├── order/
│   │   ├── order_dto.dart
│   │   ├── cart_item_dto.dart
│   │   └── order_status_dto.dart
│   ├── payment/
│   │   ├── wallet_dto.dart
│   │   ├── transaction_dto.dart
│   │   └── payment_method_dto.dart
│   ├── review/
│   │   └── review_dto.dart
│   ├── chat/
│   │   └── message_dto.dart
│   ├── loyalty/
│   │   └── reward_dto.dart
│   ├── settings/                            # NEW
│   │   └── settings_dto.dart                # generic settings payload; extend per role if needed
│   ├── rider/                         # future
│   │   └── delivery_dto.dart
│   └── social/                        # future
│       ├── post_dto.dart
│       └── comment_dto.dart
│
├── pages/
│   ├── splash/
│   │   └── splash_page.dart
│   ├── onboarding/
│   │   └── onboarding_page.dart
│   ├── auth/
│   │   ├── role_selection_page.dart   # sign up as customer or restaurant
│   │   ├── login_page.dart
│   │   ├── register_page.dart
│   │   ├── otp_verification_page.dart
│   │   └── forgot_password_page.dart
│   │
│   ├── customer/
│   │   ├── customer_shell.dart        # bottom nav wrapper
│   │   ├── home/
│   │   │   └── home_page.dart
│   │   ├── search/
│   │   │   ├── search_page.dart
│   │   │   └── filter_page.dart
│   │   ├── restaurant_detail/
│   │   │   ├── restaurant_detail_page.dart
│   │   │   └── menu_item_detail_page.dart
│   │   ├── ar_preview/
│   │   │   └── ar_food_preview_page.dart
│   │   ├── cart/
│   │   │   └── cart_page.dart
│   │   ├── checkout/
│   │   │   ├── checkout_page.dart
│   │   │   └── schedule_delivery_page.dart
│   │   ├── orders/
│   │   │   ├── order_history_page.dart
│   │   │   ├── order_tracking_page.dart
│   │   │   └── order_detail_page.dart
│   │   ├── wallet/
│   │   │   ├── wallet_page.dart
│   │   │   └── transaction_history_page.dart
│   │   ├── loyalty/
│   │   │   └── rewards_page.dart
│   │   ├── education/
│   │   │   ├── education_home_page.dart
│   │   │   ├── recipe_detail_page.dart
│   │   │   └── cooking_tutorial_page.dart
│   │   ├── chat/
│   │   │   ├── support_chat_page.dart
│   │   │   └── restaurant_chat_page.dart
│   │   ├── reviews/
│   │   │   └── write_review_page.dart
│   │   ├── profile/
│   │   │   ├── profile_page.dart
│   │   │   ├── edit_profile_page.dart
│   │   │   └── address_management_page.dart
│   │   └── settings/                        # NEW
│   │       ├── settings_page.dart            # account, addresses, payment methods, notifications, language, delete account
│   │       └── notification_preferences_page.dart
│   │
│   ├── restaurant/
│   │   ├── restaurant_shell.dart      # bottom nav wrapper
│   │   ├── onboarding/
│   │   │   ├── registration_page.dart
│   │   │   └── approval_pending_page.dart
│   │   ├── dashboard/
│   │   │   └── dashboard_page.dart
│   │   ├── menu/
│   │   │   ├── menu_management_page.dart
│   │   │   └── add_edit_dish_page.dart
│   │   ├── orders/
│   │   │   ├── incoming_orders_page.dart
│   │   │   └── order_detail_page.dart
│   │   ├── wallet/
│   │   │   ├── wallet_page.dart
│   │   │   ├── payout_page.dart
│   │   │   └── earnings_report_page.dart
│   │   ├── chat/
│   │   │   ├── support_chat_page.dart
│   │   │   └── customer_chat_page.dart
│   │   ├── education/
│   │   │   └── education_home_page.dart
│   │   ├── profile/
│   │   │   └── restaurant_profile_page.dart
│   │   └── settings/                        # NEW
│   │       ├── settings_page.dart            # business hours, payout settings, notifications, language
│   │       └── notification_preferences_page.dart
│   │
│   ├── rider/                         # future
│   │   ├── rider_shell.dart
│   │   ├── dashboard/
│   │   │   └── rider_dashboard_page.dart
│   │   ├── deliveries/
│   │   │   ├── active_delivery_page.dart
│   │   │   └── delivery_history_page.dart
│   │   ├── earnings/
│   │   │   └── rider_earnings_page.dart
│   │   └── settings/                        # NEW
│   │       ├── settings_page.dart            # availability toggle, vehicle info, notifications, language
│   │       └── notification_preferences_page.dart
│   │
│   ├── social/                        # future: food social media
│   │   ├── feed/
│   │   │   └── feed_page.dart
│   │   ├── post/
│   │   │   ├── create_post_page.dart
│   │   │   └── post_detail_page.dart
│   │   └── profile/
│   │       └── social_profile_page.dart
│   │
│   └── shared/
│       ├── notifications/
│       │   └── notifications_page.dart
│       ├── settings/
│       │   └── language_settings_page.dart  # unchanged — opened from any role's settings_page
│       └── error/
│           ├── no_internet_page.dart
│           └── not_found_page.dart
│
├── widgets/
│   ├── common/
│   │   ├── buttons/
│   │   ├── inputs/
│   │   ├── loaders/
│   │   ├── dialogs/
│   │   └── empty_states/
│   ├── customer/
│   │   ├── restaurant_card.dart
│   │   ├── dish_card.dart
│   │   ├── cart_item_tile.dart
│   │   └── order_status_tracker.dart
│   ├── restaurant/
│   │   ├── order_request_card.dart
│   │   └── menu_item_tile.dart
│   ├── rider/                         # future
│   │   └── delivery_card.dart
│   └── social/                        # future
│       ├── post_card.dart
│       └── comment_tile.dart
│
├── utils/
│   ├── validators.dart
│   ├── formatters.dart                # currency (XAF/etc.), date/time
│   ├── debouncer.dart
│   ├── permission_utils.dart
│   ├── image_picker_utils.dart
│   └── geolocation_utils.dart
│
└── l10n/
    ├── app_en.arb
    ├── app_fr.arb
    └── l10n.dart