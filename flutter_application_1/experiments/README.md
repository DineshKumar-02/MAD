# Mobile Application Development experiments

Each experiment is a separate Flutter project. Open a terminal in the project
folder and run `flutter run` with an Android device or emulator connected.
Run its widget tests with `flutter test`.

| Experiment | Project folder | What the app displays |
|---|---|---|
| 1. Flutter/Kotlin setup | `exp_01_flutter_setup` | Setup checklist and Flutter commands |
| 2. Widgets and UI | `exp_02_widgets_ui` | Text styles, input, slider, switch, card, and snackbar |
| 3. Calculator | `exp_03_calculator` | Working arithmetic keypad; `7 + 5 = 12` |
| 4. 2-D game | `exp_04_2d_game` | Swipe/arrow-controlled grid game; collect stars |
| 5. Movie ratings | `exp_05_movie_ratings` | Movie list, genre filters, and interactive star ratings |
| 6. HTTP service | `exp_06_http_service` | JSONPlaceholder GET request and JSON response |
| 7. Shopping app | `exp_07_shopping_app` | Product list, cart quantities, total, and checkout |
| 8. Push notifications | `exp_08_push_notifications` | In-app notification inbox with simulated push messages |
| 9. Google Maps | `exp_09_google_maps` | Selectable map preview with sample places |
| 10. BMI calculator | `exp_10_bmi_calculator` | BMI calculation and category; 68 kg / 170 cm gives 23.5 |
| 11. Object detection | `exp_11_object_detection` | Sample detection frame and labeled confidence results |

Experiments 8, 9, and 11 are explicitly demo versions: real push delivery needs
Firebase/service configuration, Google Maps needs an API key, and live object
detection needs a TensorFlow Lite model and camera integration. The screens
identify these limitations rather than presenting simulated results as live
service output. Experiment 6 uses a public sample endpoint and requires an
internet connection.
