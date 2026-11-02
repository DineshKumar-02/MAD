// Ready-to-run Dart WebSocket Push Notification Server
// Run with: dart run server.dart
import 'dart:io';

void main() async {
  final server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
  print('Push Notification WebSocket Server listening on ws://localhost:8080/push');

  final List<WebSocket> clients = [];

  await for (HttpRequest request in server) {
    if (request.uri.path == '/push') {
      if (WebSocketTransformer.isUpgradeRequest(request)) {
        final socket = await WebSocketTransformer.upgrade(request);
        clients.add(socket);
        print('New client connected. Total connected clients: ${clients.length}');

        socket.listen(
          (message) {
            print('Received push broadcast message: $message');
            // Broadcast to all other clients
            for (var client in clients) {
              if (client != socket) {
                client.add(message);
              }
            }
          },
          onDone: () {
            clients.remove(socket);
            print('Client disconnected. Remaining: ${clients.length}');
          },
          onError: (e) {
            clients.remove(socket);
          },
        );
      } else {
        request.response
          ..statusCode = HttpStatus.badRequest
          ..write('Expected WebSocket upgrade')
          ..close();
      }
    } else {
      request.response
        ..statusCode = HttpStatus.ok
        ..headers.contentType = ContentType.html
        ..write('<h3>Push Notification Server Running on Port 8080</h3><p>Connect to ws://localhost:8080/push</p>')
        ..close();
    }
  }
}
