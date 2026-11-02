# Experiment 6: Develop an Application to Connect to a Web Service and to Retrieve Data with HTTP

## Aim
To develop an application that connects to an external web service over HTTP/HTTPS, makes asynchronous requests, deserializes JSON data, and displays it in the user interface.

## Concepts & Implementation
- **Networking Protocol**: HTTP/1.1 & HTTP/2 GET request handling.
- **Asynchronous Execution**: Non-blocking network calls using `Future` and coroutines (`suspend fun`).
- **Data Serialization**: JSON parsing into typed models (`PostItem.fromJson`).
- **User Interface**:
  - Live API endpoint configuration
  - Circular progress loading indicator
  - Status code feedback (`HTTP 200 OK`) and latency calculation
  - Dual tabs: formatted card list view and raw JSON viewer

## Files
- `lib/main.dart`: Complete Flutter HTTP client application.
- `kotlin/Main.kt`: Kotlin Ktor HTTP client program from the lab manual.

## Result
The application to connect to a web service and retrieve data with HTTP has been developed and executed successfully.
