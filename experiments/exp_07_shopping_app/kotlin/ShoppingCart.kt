// Experiment 7: Kotlin Simple Shopping Application from Lab Manual
import java.util.Scanner

data class Product(val id: Int, val name: String, val price: Double)

fun displayProducts(products: List<Product>) {
    println("\nAvailable Products:")
    for (product in products) {
        println("${product.id}. ${product.name} - \$${product.price}")
    }
}

fun addToCart(cart: MutableList<Product>, product: Product) {
    cart.add(product)
    println("${product.name} added to the cart.")
}

fun viewCart(cart: List<Product>) {
    if (cart.isEmpty()) {
        println("Your cart is empty.")
    } else {
        println("Your Cart:")
        for ((index, item) in cart.withIndex()) {
            println("${index + 1}. ${item.name} - \$${item.price}")
        }
        val totalPrice = cart.sumOf { it.price }
        println("Total: \$$totalPrice")
    }
}

fun main() {
    val scanner = Scanner(System.`in`)
    val cart = mutableListOf<Product>()
    val products = listOf(
        Product(1, "Product A", 10.99),
        Product(2, "Product B", 19.99),
        Product(3, "Product C", 7.49)
    )

    println("Simple Shopping Cart!")
    while (true) {
        println("\nMenu:")
        println("1. View Products")
        println("2. Add to Cart")
        println("3. View Cart")
        println("4. Exit")
        print("Enter your choice: ")

        when (scanner.nextInt()) {
            1 -> displayProducts(products)
            2 -> {
                println("\nEnter the product ID to add to cart:")
                val productId = scanner.nextInt()
                val selectedProduct = products.find { it.id == productId }
                if (selectedProduct != null) {
                    addToCart(cart, selectedProduct)
                } else {
                    println("Invalid product ID. Please try again.")
                }
            }
            3 -> viewCart(cart)
            4 -> {
                println("Thank you for using the Simple Shopping App. Exiting...")
                return
            }
            else -> println("Invalid choice. Please enter a valid option.")
        }
    }
}
