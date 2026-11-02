# Experiment 1: Study and Installation of Flutter / Kotlin Multi-Platform Environment

## Aim
To study and install the Flutter / Kotlin multi-platform environment.

## Overview
Cross-platform mobile development allows developers to write code once and deploy it across Android, iOS, Web, and Desktop.

### 1. Flutter Framework
- **Creator**: Google
- **Language**: Dart
- **Architecture**: Flutter bypasses native OEM widgets and renders directly to the canvas using the Impeller/Skia graphic engine.
- **Key Features**: High performance (60/120 fps), Hot Reload, Declarative UI, extensive Widget ecosystem.

### 2. Kotlin Multiplatform (KMP)
- **Creator**: JetBrains
- **Language**: Kotlin
- **Architecture**: Shares business logic across platforms while compiling to native binaries (`.aar` for Android, `.framework` for iOS).

---

## Procedure

### Part A: Flutter Installation
1. **Download Flutter SDK**:
   Download the stable zip file from https://docs.flutter.dev and extract to `C:\flutter`.
2. **Add to PATH**:
   Edit System Environment Variables -> Path -> New -> `C:\flutter\bin`.
3. **Verify Environment**:
   Open Terminal/PowerShell and run:
   ```bash
   flutter doctor
   ```
4. **Create & Run App**:
   ```bash
   flutter create my_first_app
   cd my_first_app
   flutter run
   ```

### Part B: Kotlin Multiplatform Setup
1. Install JDK 17+ and IntelliJ IDEA / Android Studio.
2. Install the **Kotlin Multiplatform Mobile** plugin.
3. Create a new Kotlin Multiplatform Project.
4. Define common logic in `commonMain` and platform-specific implementations in `androidMain` and `iosMain`.
5. Run `./gradlew build` to compile.

---

## Result
The study and installation of Flutter / Kotlin Multi-platform environment was successfully carried out.
