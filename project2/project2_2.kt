// Author: Adonay Pichardo, apichardo2019@my.fit.edu
// Course: CSE 4250, Summer 2021
// Project: Proj2, The Color of Flags

// This program compiles with kotlin version:
// Kotlin version 1.5.31-release-548
// (JRE 1.8.0_292-8u292-b10-0ubuntu1~16.04.1-b10)

// Compile like so:
// $:_> kotlinc project2_2.kt -include-runtime -d project2_2.jar
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
    The values will be FloatArray
    The FloatArray will have 5 integers representing:
    -----0------|------1-------|------2------|--------3----------|--------4---------
    Red channel, Green channel, Blue channel, Euclidean Distance, Frequency of pixel
    */
    var palette = HashMap<String, FloatArray>()
    var allColors = ArrayList<String>()

    fun matchColor(pixel: Color){
        /*
        Using Euclidean Distance, calculate which color the pixel is closest to and account for the frequency.
        */
        var current_lowest: Float  = 999f
        // Find the value that is the closest
        for (key in allColors){
            // System.out.println("loop current_lowest:_> " + current_lowest.toString())
            var distance: Float = sqrt((palette.get(key)!!.get(0) - pixel.getRed()).pow(2) +
                                       (palette.get(key)!!.get(1) - pixel.getGreen()).pow(2) +
                                       (palette.get(key)!!.get(2) - pixel.getBlue()).pow(2))

            // Save Euclidean distance
            palette.get(key)!!.set(3, distance)
            if (distance < current_lowest){
                current_lowest = distance
                // System.out.println("new  current_lowest:_> " + current_lowest.toString())
            }
        }
        // Increment the first color that is close and reset the Euclidean distance
        for (key in allColors){
            // If the color was found to be close,
            if (current_lowest == palette.get(key)!!.get(3)){
                var temp: Float = palette.get(key)!!.get(4)
                palette.get(key)!!.set(4, temp + 1)
                break
            }
        }
    }

    fun perCapita(total_pixels: Int){
        for (key in palette.keys){
            var temp: Float = palette.get(key)!!.get(4)
            palette.get(key)!!.set(4, temp / total_pixels.toFloat() * 1000f)
        }
    }

    fun printFrequencies(){
        for (key in palette.keys){
            System.out.println(key.toString() + " " + palette.get(key)!!.get(4).toInt())
        }
    }
}

fun main(args: Array<String>){
    // Initialize Data Structures
    val inputPalette:      ColorPalette = ColorPalette()
    var image:             BufferedImage
    var url:               URL
    var pixel:             Color
    var total_pixel_count: Int = 0

    // Collect Color Palette
    while (true){
        val line = readLine()
        if (line == null) break

        val (color, r, g, b) = line.split("\\s+".toRegex())
        inputPalette.palette.put(color,
                                 floatArrayOf(r.toFloat(),
                                              g.toFloat(),
                                              b.toFloat(),
                                              0f, 0f))
        inputPalette.allColors.add(color)
    }

    // Execute program per flag in args
    for (flag in args){
        url               = URL("https://cs.fit.edu/~ryan/images/flags/large/" + flag + ".png")
        image             = ImageIO.read(url)
        total_pixel_count += image.getHeight() * image.getWidth()

        for (y in 0..image.getHeight() - 1){
            for (x in 0..image.getWidth() - 1){
                pixel = Color(image.getRGB(x, y))
                inputPalette.matchColor(pixel)
            }
        }
    }
    inputPalette.perCapita(total_pixel_count)
    inputPalette.printFrequencies()
}
