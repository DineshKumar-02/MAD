# Mobile Application Development Lab (23IT703)
**Erode Sengunthar Engineering College (Autonomous)**  
**Department of Information Technology | IV Year / VII Semester**

---

## 📱 Project Structure

Every experiment from your lab manual (`MADRecord_new.pdf`) has been developed into its own **dedicated folder** with complete, runnable code, instructions, and lab viva materials:

```text
D:\mad lab\
│
├── flutter_application_1\             <-- Master Flutter Application
│   └── lib\main.dart                  <-- Launches the All-in-One Dashboard (run this to test everything!)
│
└── experiments\                       <-- Separate Experiment Folders
    ├── exp_01_flutter_setup\          <-- Ex 1: Flutter & KMP Setup Guide + Viva Q&A
    ├── exp_02_widgets_ui\             <-- Ex 2: Widgets, GUI Components, Fonts & Colors
    ├── exp_03_calculator\             <-- Ex 3: Native Calculator (Dark theme, 4-col grid)
    ├── exp_04_2d_game\                <-- Ex 4: 2D Gesture & Obstacle Dodge Game
    ├── exp_05_movie_ratings\          <-- Ex 5: IMDb Movie Ratings Application
    ├── exp_06_http_service\           <-- Ex 6: HTTP Web Service & JSON Client
    ├── exp_07_shopping_app\           <-- Ex 7: Simple Shopping Cart Application
    ├── exp_08_push_notifications\     <-- Ex 8: Push Notification WebSocket Server & Client
    ├── exp_09_google_maps\            <-- Ex 9: Google Maps SDK Integration
    ├── exp_10_bmi_calculator\         <-- Ex 10: Mini Project - BMI Calculator App
    └── exp_11_object_detection\       <-- Ex 11: CBS - Real-Time TFLite Object Detection
```

---

## 🚀 How to Run the Applications (Fast & Easy)

### Method 1: All-in-One Master App (Recommended for Lab Viva)
Open your terminal in `D:\mad lab\flutter_application_1` and run:
```bash
flutter run
```
*(Or choose Chrome: `flutter run -d chrome`)*

This opens the **Master Lab Dashboard** where you can click and test any of the 11 experiments with a single tap!

---

### Method 2: Running Any Single Experiment Independently
Navigate into the specific experiment folder:
```bash
cd "D:\mad lab\flutter_application_1\experiments\exp_10_bmi_calculator"
flutter run
```

---

## 📋 Experiments Overview

| Ex No | Title | Description & Features | Manual Page |
| :---: | :--- | :--- | :---: |
| **01** | **Study of Flutter & KMP** | Installation guide, `flutter doctor`, KMP architecture, viva Q&A. | 6–7 |
| **02** | **Widgets, GUI, Fonts, Colors** | TextFields, Dropdown (ComboBox), Buttons, Font sliders, Color palettes. | 8–11 |
| **03** | **Native Calculator** | Circular button dark layout, orange operators, arithmetic expression parser. | 12–17 |
| **04** | **2D Animation & Gestures Game** | Tap to jump, swipe to move, moving obstacle bars, live score, game over. | 18–21 |
| **05** | **Movie Rating App (IMDb)** | Inception, Dark Knight, Shawshank, Black Widow cards, dynamic 1-10 star rating. | 22–26 |
| **06** | **HTTP Web Service Client** | HTTP GET request, latency counter, status 200 OK, JSON deserialization. | 27–29 |
| **07** | **Simple Shopping Application** | Product inventory (A, B, C), cart drawer, quantity adjusters, checkout. | 30–34 |
| **08** | **Push Notification Server** | WebSocket server on port 8080 (`server.dart`), HTML web client, mobile push banners. | 35–40 |
| **09** | **Google Maps Integration** | Map styles (Normal, Satellite, Terrain), Sydney pin marker, zoom controls. | 41–44 |
| **10** | **BMI Calculator (Mini Project)** | Gender cards, height slider, weight/age buttons, BMI classification screen. | 45–46 |
| **11** | **Real-Time Object Detection (CBS)**| SSD MobileNet TFLite model, real-time bounding boxes, confidence threshold slider. | 47–49 |

---

## 💡 Quick Tips for Lab Exams
1. Each experiment contains a `README.md` file with the **Aim**, **Procedure**, and **Algorithm** you can write directly in your lab observation notebook.
2. For experiments with Native Android/Kotlin code (Ex 2, 3, 4, 5, 6, 7, 8, 9), the manual's exact Kotlin and XML files are also included inside their respective subfolders (`kotlin/` or `android_native/`).

