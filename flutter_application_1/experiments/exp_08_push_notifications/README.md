# Experiment 8: Design a Web Server Supporting Push Notifications

## Aim
To design and implement a web server capable of pushing real-time notifications to connected clients using WebSocket protocol.

## Architecture
1. **Server Layer**:
   - WebSocket endpoint exposed at `ws://localhost:8080/push`.
   - Maintains concurrent connected client sessions (`List<WebSocket>`).
   - On incoming message from any client, broadcasts payload immediately to all other connected peers.
2. **Client Layer**:
   - **Web Client (`index.html`)**: Connects via browser JavaScript WebSocket API, sends chat/alert strings, displays pushed messages.
   - **Mobile App (`lib/main.dart`)**: Listens on the WebSocket channel, displays real-time push alert banners, maintains notification history, and supports offline simulation.

## Files
- `server/PushNotificationServer.kt`: Ktor Netty WebSocket server implementation from the lab manual.
- `server/server.dart`: Ready-to-run Dart WebSocket server (`dart run server.dart`).
- `server/index.html`: Browser-based WebSocket client from the lab manual.
- `lib/main.dart`: Complete Flutter mobile application displaying push notifications and simulation.

## Result
The web server supporting push notifications and its corresponding client application have been designed and executed successfully.
