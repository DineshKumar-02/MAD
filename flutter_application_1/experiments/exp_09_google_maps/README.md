# Experiment 9: Develop an Application by Integrating Google Maps

## Aim
To develop an application by integrating Google Maps SDK, configuring API credentials, location permissions, adding markers, and controlling camera zoom.

## Implementation Steps
1. **Google Cloud Console**:
   - Enable "Maps SDK for Android".
   - Generate an API Key and restrict it for Android package usage.
2. **Permissions Configuration**:
   - `android.permission.INTERNET`
   - `android.permission.ACCESS_FINE_LOCATION`
   - `android.permission.ACCESS_COARSE_LOCATION`
   - Add `<meta-data android:name="com.google.android.geo.API_KEY" android:value="..." />`
3. **Map Fragment Integration**:
   - Embed `SupportMapFragment` into the XML layout.
   - Implement `OnMapReadyCallback` in Kotlin (`MapFragment.kt`).
   - Center camera at Sydney (`LatLng(-33.8688, 151.2093)` matching manual screenshot) and place pin marker.
4. **Interactive Flutter Simulator**:
   - Multi-layer toggle (Normal, Satellite, Terrain)
   - Interactive zoom in/out controls
   - Real-time GPS coordinate inspector

## Files
- `lib/main.dart`: Complete Flutter Map viewer application.
- `android_native/AndroidManifest.xml`: Permissions and API key metadata.
- `android_native/fragment_map.xml`: Android layout fragment.
- `android_native/MapFragment.kt`: Kotlin Fragment implementation.

## Result
The Google Maps integrated application has been developed and executed successfully.
