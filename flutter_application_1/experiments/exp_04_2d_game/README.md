# Experiment 4: Develop a Gaming Application that Uses 2-D Animations and Gestures

## Aim
To develop a gaming application that utilizes 2-D animations, physics simulation, and touch/drag gestures.

## Implementation Details
1. **Game Loop & 2D Animations**:
   - Continuous 60 FPS update cycle using `Timer.periodic`.
   - Gravity, vertical velocity, sprite rotation angles based on tilt/velocity.
   - Smooth horizontal scrolling of obstacle bars with random opening gaps.
2. **Gesture Recognition**:
   - `onTap`: Triggers upward jump/flap impulse.
   - `onPanUpdate` (Swipe/Drag): Controls horizontal player movement left/right across the arena.
3. **Collision Detection**:
   - Axis-Aligned Bounding Box (AABB) intersection check between the player circular sprite and moving obstacle bars.
4. **Game State Management**:
   - Start banner, real-time score tracking, persistent high score, and Game Over screen with replay trigger.

## Files
- `lib/main.dart`: Complete interactive Flutter 2D game.
- `libgdx_kotlin/GestureQuest.kt`: LibGDX game adapter from the manual.
- `libgdx_kotlin/MyInputProcessor.kt`: LibGDX gesture input processor.

## Result
The 2-D animation and gesture-driven gaming application has been developed and executed successfully.
