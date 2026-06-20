# Shayo Frontend — Agent Guide

## Project
Flutter food-delivery app (name: `shayo`, SDK `^3.9.2`). No state management lib — uses `setState`. No routing package — uses raw `Navigator.push`/`Navigator.pop`. No CI.

## Commands
- `flutter analyze` — lint + static analysis (uses `flutter_lints` defaults)
- `flutter test` — run tests
- `flutter run` — launch on connected device/emulator
- `flutter build apk` / `flutter build ios` / `flutter build web`

## Architecture
- Feature-based dirs under `lib/features/` (`auth/`, `cart/`, `home/`, `restaurants/`)
- Shared screens in `lib/core/presentation/` (`splash_screen.dart`, `onboarding_screen.dart`)
- Entry: `lib/main.dart` → `ShayoApp` in `lib/app.dart`
- **Current home screen** is `lib/features/cart/edit_cart.dart` — `app.dart` swaps screens by uncommenting imports
- **No `home:` set at all** — app won't display content without editing `app.dart`

## Code conventions
- All screens are `StatefulWidget` with private `_State` class
- Models are plain classes defined in the same file as the screen (not separated)
- Cart uses `List<Map<String, dynamic>>` (no typed model)
- Colors: inline hex literals (e.g. `Color(0xFF1A1D2E)`) — no theme
- Images from network URLs (unsplash/pixabay); error builders provide fallback containers
- `// TO-DO:` placeholders for unimplemented logic (navigation, auth, etc.)

## Key quirks
1. `app.dart` uses `debugShowCheckedModeBanner: false` but `home:` is always set to exactly one screen via uncommented import — **no routing**; to navigate between flows, uncomment the desired screen's import and comment all others
2. Default test (`test/widget_test.dart`) references `MyApp` which does not exist — will fail immediately
3. No theme defined — every screen hardcodes its own colors. Changing the palette requires editing every file
4. All auth/login screens have `print()` calls for debug output (e.g. `print('Email: ...')`)
5. Only 1 asset registered: `assets/images/logo.png`
6. All prices use `int` (in FCFA/XAF currency, no decimal)
