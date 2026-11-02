// Experiment 6: Kotlin Ktor HTTP Client from Lab Manual
package com.example.httpservice

import io.ktor.client.HttpClient
import io.ktor.client.engine.apache.Apache
import io.ktor.client.request.get
import kotlinx.coroutines.runBlocking

suspend fun fetchData(url: String): String {
    val client = HttpClient(Apache)
    return try {
        val response = client.get<String>(url)
        response
    } finally {
        client.close()
    }
}

fun main() = runBlocking {
    val apiUrl = "https://api.example.com/data"
    try {
        val result = fetchData(apiUrl)
        println("Data received: $result")
    } catch (e: Exception) {
        println("Error: ${e.message}")
    }
}
