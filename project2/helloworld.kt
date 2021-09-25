// Compile like so:
// $:_> kotlinc helloworld.kt -include-runtime -d helloworld.jar
// Run like so:
// $:_> kotlin helloworld.jar
// Or:
// $:_> java -jar helloworld.jar

import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import java.io.*
import java.net.*

fun main(){
    println("Hello World!")

    var width:  Int
    var height: Int
    var image:  BufferedImage
    var url:    URL = URL("https://cs.fit.edu/~ryan/images/flags/large/sau.png")

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
    System.out.println();
}
