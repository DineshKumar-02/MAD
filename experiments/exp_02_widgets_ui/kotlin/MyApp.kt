// Experiment 2: JavaFX / Kotlin Program from Lab Manual
import javafx.application.Application
import javafx.geometry.Insets
import javafx.scene.Scene
import javafx.scene.control.Button
import javafx.scene.control.ComboBox
import javafx.scene.control.Label
import javafx.scene.control.TextField
import javafx.scene.layout.VBox
import javafx.scene.text.Font
import javafx.stage.Stage

class MyApp : Application() {
    override fun start(primaryStage: Stage) {
        primaryStage.title = "Widget App"
        val root = VBox(10.0)
        root.padding = Insets(10.0)

        // Set a custom font
        val customFont = Font("Arial", 12.0)

        // Set background color
        root.style = "-fx-background-color: #f0f0f0;"

        // Create a label
        val label = Label("Welcome to Widget App")
        label.font = customFont
        root.children.add(label)

        // Create a button
        val button = Button("Click Me!")
        button.font = customFont
        button.setOnAction { onButtonClick() }
        root.children.add(button)

        // Create a text field
        val textField = TextField()
        textField.font = customFont
        root.children.add(textField)

        // Create a combo box
        val comboBoxValues = listOf("Option 1", "Option 2", "Option 3")
        val comboBox = ComboBox<String>()
        comboBox.items.addAll(comboBoxValues)
        comboBox.font = customFont
        root.children.add(comboBox)

        val scene = Scene(root, 300.0, 200.0)
        primaryStage.scene = scene
        primaryStage.show()
    }

    private fun onButtonClick() {
        println("Button Clicked!")
    }
}

fun main() {
    Application.launch(MyApp::class.java)
}
