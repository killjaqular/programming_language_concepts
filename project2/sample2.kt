// Author: Adonay Pichardo, apichardo2019@my.fit.edu
// Course: CSE 4250, Summer 2021
// Project: Proj2, The Color of Flags

// This program compiles with kotlin version:
// Kotlin version 1.5.31-release-548
// (JRE 1.8.0_292-8u292-b10-0ubuntu1~16.04.1-b10)

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.*;

public class Quiz {

    static int width,height;

    public static void main( String[] args ){
        try {
            BufferedImage image = null;
            URL url=new URL("http://imc.kean.edu/cps2231/program6.png");
            image = ImageIO.read(url);
            height=image.getHeight();
            width=image.getWidth();
            System.out.println("width:"+width+ " height:"+height);

            int [][] img=new int[height][width];

            for (int y=0;y<height;y++)>
            for (int x=0;x<width;x++)>
            img[y][x]= image.getData().getSample(x, y, 0);

            printImg(img);

            int color=2;
            int cX=0;
            int cY=0;
            int pixels=0;

            for (int y=0;y<height;y++)> for (int x=0;x<width;x++){>
                if (img[y][x] ==0){
                    label(img, x, y, color);
                    System.out.println("Color: " + color + " Object size: " + pixels + " pixels," + " Center at "+"("+cX+","+cY+")");
                    color++;

                }
            }
        }

            System.out.println("Total number of black objects:"+ (color-2));
            printImg(img);
        }catch (IOException e){
            e.printStackTrace();
            }
    }

        static void label(int[][] A, int x, int y, int color) {
            if ((x>=0) && (y>=0) && (x<width)
                System.out.printf("(%d,%d) color:%d\n",x,y,color);

            A[y][x]=color;
            label(A, x, y-1, color);
            label(A, x-1,y, color);
            label(A, x, y+1, color);
            label(A, x+1, y, color);
        }
    }

        static void printImg(int[][] A) {
            for (int y=0;y<height;y++)>
                for (int x=0;x<width;x++)>
                System.out.printf("%d",A[y][x]);
            System.out.println();
        }
    }
}
