// Compile like so:
// $:_> kotlinc helloworld.kt -include-runtime -d helloworld.jar
// Run like so:
// $:_> kotlin helloworld.jar sau
// Or:
// $:_> java -jar helloworld.jar sau

import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import java.io.*
import java.net.*
import java.util.*

class ImageInfo constructor(new_R: Int, new_G: Int, new_B: Int){
    val R: Int = new_R // Red pixel count
    val G: Int = new_G // Green pixel count
    val B: Int = new_B // Blue pixel count
}

class ImageInfoList{
    var list: ArrayList<ImageInfo> = ArrayList()
}

fun main(args: Array<String>){
    println("Hello World!")

    var current_image: ImageInfo = ImageInfo(0, 0, 0)
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
        }
    }
    printImg(img, height, width)
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
