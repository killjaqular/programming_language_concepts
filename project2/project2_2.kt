// Author: Adonay Pichardo, apichardo2019@my.fit.edu
// Course: CSE 4250, Summer 2021
// Project: Proj2, The Color of Flags

// This program compiles with kotlin version:
// Kotlin version 1.5.31-release-548
// (JRE 1.8.0_292-8u292-b10-0ubuntu1~16.04.1-b10)

// Compile like so:
// $:_> kotlinc project2_2.kt -include-runtime -d project2_2.jar
//
// Run like so:
// $:_> kotlin project2_2.jar usa sau can < palette.in
// Or:
// $:_> java -jar project2_2.jar usa sau can < palette.in

import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import java.awt.Color
import java.net.URL
import kotlin.math.pow
import kotlin.math.sqrt

class ColorPalette constructor(){
    /*
    palette will be a HashMap of K:V pairs,
    The values will be IntArrays
    The IntArrays will have 5 integers representing:
    Red channel, Green channel, Blue channel, Eucldiean distance, Frequency of pixel
    */
    var palette = HashMap<String, FloatArray>()

    fun printPalette(){
        for (key in palette.keys){
            System.out.print(key.toString() + " ");
            for (element in palette.get(key)!!){
                System.out.print(element.toString() + " ")
            }
            System.out.println()
        }
    }

    fun setEuclideanDistance(pixel: Color){
        for (key in palette.keys){
            System.out.println("---|---|---")
            System.out.println(key)
            System.out.println(palette.get(key)!!.get(0).toString()+"|"+
                               palette.get(key)!!.get(1).toString()+"|"+
                               palette.get(key)!!.get(2).toString())
            System.out.println("-----------")
            System.out.println(pixel.getRed().toString()+"|"+
                               pixel.getGreen().toString()+"|"+
                               pixel.getBlue().toString())

            var distance: Float = sqrt((palette.get(key)!!.get(0) - pixel.getRed()).pow(2) +
                                       (palette.get(key)!!.get(1) - pixel.getGreen()).pow(2) +
                                       (palette.get(key)!!.get(2) - pixel.getBlue()).pow(2))

            palette.get(key)!!.set(3, distance)
        }
    }

    fun countDominantColor(pixel: Color): String{
        var name          : String = palette.keys.get(0)
        var distance_value: Float  = palette.get(name)!!.get(3)
        for (key in palette.keys){
            if (distance_value < palette.get(key)!!.get(3)){
                name           = key
                distance_value = palette.get(key)!!.get(3)
            }
            palette.get(key)!!.set(3, 0.toFloat())
        }
        palette.get(name)!!.[4] += 1.toFloat()
        return name
    }
}

class ImageInfo constructor(){
    var flag: String = ""
}

fun main(args: Array<String>){
    // Initialize Data Structures
    val inputPalette: ColorPalette = ColorPalette()
    var image:        BufferedImage
    var url:          URL
    var pixel:        Color

    // Collect Color Palette
    while (true){
        val line = readLine()
        if (line == null) break

        val (color, r, g, b) = line.split(' ')
        inputPalette.palette.put(color, floatArrayOf(r.toFloat(), g.toFloat(), b.toFloat(), 0.toFloat(), 0.toFloat()))
    }

    inputPalette.printPalette()

    // Execute program per flag in args
    for (flag in args){
        System.out.println("FLAG: " + flag); // TODO: Delete line before turning in

        url    = URL("https://cs.fit.edu/~ryan/images/flags/large/" + flag + ".png")
        image  = ImageIO.read(url)

        for (y in 0..image.getHeight() - 1){
            for (x in 0..image.getWidth() - 1){
                pixel = Color(image.getRGB(x, y))
                inputPalette.setEuclideanDistance(pixel)
                inputPalette.printPalette()
                dominant_color = inputPalette.countDominantColor(pixel)
                break
                // System.out.println("---|---|---|---")
                // System.out.println(pixel.getRed().toString() + "|" +
                //     pixel.getGreen().toString() + "|" +
                //     pixel.getBlue().toString() + "|" +
                //     pixel.getAlpha().toString())
            }
            break
        }
    }
}
