// Experiment 4: LibGDX Gesture and Input Processor from Lab Manual
package com.example.gesturegame

import com.badlogic.gdx.InputProcessor

class MyInputProcessor : InputProcessor {
    override fun touchDown(screenX: Int, screenY: Int, pointer: Int, button: Int): Boolean {
        // Handle touch down event (jump / gesture start)
        println("Touch Down at ($screenX, $screenY)")
        return true
    }

    override fun keyDown(keycode: Int): Boolean {
        return false
    }

    override fun touchUp(screenX: Int, screenY: Int, pointer: Int, button: Int): Boolean = false

    override fun keyUp(keycode: Int): Boolean = false

    override fun keyTyped(character: Char): Boolean = false

    override fun touchDragged(screenX: Int, screenY: Int, pointer: Int): Boolean {
        println("Touch Dragged to ($screenX, $screenY)")
        return true
    }

    override fun mouseMoved(screenX: Int, screenY: Int): Boolean = false

    override fun scrolled(amountX: Float, amountY: Float): Boolean = false
}

