// Author: Adonay Pichardo, apichardo2019@my.fit.edu
// Course: CSE 4250, Summer 2021
// Project: Proj2, The Color of Flags

// This program compiles with kotlin version:
// Kotlin version 1.5.31-release-548
// (JRE 1.8.0_292-8u292-b10-0ubuntu1~16.04.1-b10)

// Compile like so:
// $:_> kotlinc project2.kt -include-runtime -d project2.jar
// Run like so:
// $:_> kotlin project2.jar sau
// Or:
// $:_> java -jar project2.jar sau

import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import java.io.*
import java.net.*
import java.util.*

class ImageInfo constructor(given_pallet: String){
    val pallete = HashMap<String, IntArray>()
}

class ImageInfoList{
    var list: ArrayList<ImageInfo> = ArrayList()
}

fun main(args: Array<String>){
    println("Hello World!")

    var current_image: ImageInfo = ImageInfo("Hello")
    var ranking_list:  ImageInfoList = ImageInfoList()

    ranking_list.list.add(current_image)

    var width:  Int
    var height: Int
    var image:  BufferedImage
    var url:    URL = URL("https://cs.fit.edu/~ryan/images/flags/large/" + args[0] + ".png")

    image = ImageIO.read(url)
    height=image.getHeight()
    width=image.getWidth()

    System.out.println("W:" +width +" H:" +height)

    var img = Array(height, {IntArray(width)})

    for (y in 0..height - 1){
        for (x in 0..width - 1){
            img[y][x]= image.getData().getSample(x, y, 0)
            System.out.println("read in:_> " + img[y][x])
        }
    }
    // printImg(img, height, width)
}

fun printImg(image: Array<IntArray>, height: Int, width: Int){
    for (y in 0..height - 1){
        for (x in 0..width - 1){
            System.out.printf("%d", image[y][x])
        }
    }
    // FINAL OUTPUT
    System.out.println("red");
    System.out.println("blue");
    System.out.println("green");
    // red    789
    // blue   111
    // green  100
}
