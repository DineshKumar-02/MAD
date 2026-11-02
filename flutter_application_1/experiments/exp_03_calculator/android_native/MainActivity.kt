package com.example.calculator

import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.EditText
import androidx.appcompat.app.AppCompatActivity
import net.objecthunter.exp4j.ExpressionBuilder

class MainActivity : AppCompatActivity() {
    private lateinit var inputText: EditText

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        inputText = findViewById(R.id.inputText)

        val buttons = intArrayOf(
            R.id.btno, R.id.btn1, R.id.btn2, R.id.btn3, R.id.btn4,
            R.id.btn5, R.id.btn6, R.id.btn7, R.id.btn8, R.id.btn9,
            R.id.btnAdd, R.id.btnSub, R.id.btnMul, R.id.btnDiv,
            R.id.btnDot, R.id.btnEquals, R.id.btnC, R.id.btnD
        )

        for (buttonId in buttons) {
            val button = findViewById<Button>(buttonId)
            button?.setOnClickListener { onButtonClick(it) }
        }
    }

    private fun onButtonClick(view: View) {
        val currentText = inputText.text.toString()
        val buttonText = (view as Button).text.toString()

        when (view.id) {
            R.id.btnEquals -> evaluateExpression(currentText)
            R.id.btnDot -> handleDotButtonClick(currentText)
            R.id.btnC -> inputText.setText("")
            R.id.btnD -> {
                if (currentText.isNotEmpty()) {
                    inputText.setText(currentText.substring(0, currentText.length - 1))
                }
            }
            else -> inputText.setText("$currentText$buttonText")
        }
    }

    private fun evaluateExpression(expression: String) {
        try {
            val result = ExpressionBuilder(expression).build().evaluate()
            inputText.setText(result.toString())
        } catch (e: Exception) {
            inputText.setText("Error")
        }
    }

    private fun handleDotButtonClick(currentText: String) {
        val lastOperatorIndex = getLastOperatorIndex(currentText)
        val lastDotIndex = currentText.lastIndexOf(".")
        if (lastDotIndex > lastOperatorIndex) {
            return
        }
        inputText.setText("$currentText.")
    }

    private fun getLastOperatorIndex(text: String): Int {
        val operators = charArrayOf('+', '-', '*', '/')
        var lastOperatorIndex = -1
        for (operator in operators) {
            val index = text.lastIndexOf(operator)
            if (index > lastOperatorIndex) {
                lastOperatorIndex = index
            }
        }
        return lastOperatorIndex
    }
}

