// Author: Adonay Pichardo, apichardo2019@my.fit.edu
// Course: CSE 4250, Summer 2021
// Project: Proj2, The Color of Flags

// This program compiles with kotlin version:
// Kotlin version 1.5.31-release-548
// (JRE 1.8.0_292-8u292-b10-0ubuntu1~16.04.1-b10)

// Copyright 2015 Thilo Planz
//
// Licensed under the Apache License, Version 2.0 (the "License"); 
// you may not use this file except in compliance with the License. 
// You may obtain a copy of the License at 
// 
// http://www.apache.org/licenses/LICENSE-2.0 
// 
// Unless required by applicable law or agreed to in writing, software 
// distributed under the License is distributed on an "AS IS" BASIS, 
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
// See the License for the specific language governing permissions and 
// limitations under the License.
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;

import javax.imageio.ImageIO;

/**
 * Counts the number of pixels in given RGB colour ranges that an image has.
 * 
 * @author Thilo Planz
 *
 */

public class PixelCounter {

    /** 
     * Demonstration driver, displays the number
     * of "red", "green", "blue" pixels in the given image file
     * @throws IOException 
     * 
     */
    public static void main(String[] args) throws IOException {

        File f = new File(args[0]);

        PixelCounter counter = new PixelCounter();

        System.out.println(Arrays.asList("Red", "Green", "Blue", "total pixels")+" in "+f.getName());

        System.out.println(Arrays.toString(counter.count(f, 
                counter.rgb(255,0,0,255),
                counter.rgb(0,255,0,255),
                counter.rgb(0,0,255,255))));
    }

    /**
     * returns an array with the number of pixels in the image.
     *
     * @return an array with the number of pixels in each colour range that was passed in,
     * as well as an extra entry at the end with the total number of pixels in the image
     */
    public int[] count(BufferedImage image, RGBRange... ranges){
        int[] result = new int[ranges.length+1];
        int h = image.getHeight();
        int w = image.getWidth();
        result[ranges.length] = h * w;
        int[] rgbArray = null;
        for (int y = 0; y < h; y++){
            rgbArray = image.getRGB(0, y, w, 1, rgbArray, 0, w);
            for (int r = 0; r<ranges.length; r++){
                result[r] += ranges[r].count(rgbArray);
            }
        }
        return result;
    }

    /**
     * returns an array with the number of pixels in the image.
     *
     * @return an array with the number of pixels in each colour range that was passed in,
     * as well as an extra entry at the end with the total number of pixels in the image
     */
    public int[] count(File image, RGBRange... ranges) throws IOException{
        return count(ImageIO.read(image), ranges);
    }

    /**
     * Simple wrapper class to hold an RGB colour range
     */

    public static class RGBRange{
        private final int minR, minG, minB, maxR, maxG, maxB;
        RGBRange(int minR, int minG, int minB, int maxR, int maxG, int maxB){
            // handle possibly reversed ranges
            this.minR = Math.min(minR, maxR);
            this.minG = Math.min(minG, maxG);
            this.minB = Math.min(minB, maxB);
            this.maxR = Math.max(minR, maxR);
            this.maxG = Math.max(minG, maxG);
            this.maxB = Math.max(minB, maxB);
        }
        /**
         * count the pixels that fall into this range for the given "rgbArray" ({@link BufferedImage#getRGB(int, int, int, int, int[], int, int)}
         */
        int count(int[] rgbArray){
            int count = 0;
            for (int pixel: rgbArray){
                // see Color#getRed
                int r = (pixel >> 16) & 0xFF;
                if (r < minR || r > maxR) continue;
                int g = (pixel >> 8) & 0xFF;
                if (g < minG || g > maxG) continue;
                int b = (pixel >> 0) & 0xFF;
                if (b < minB || b > maxB) continue;
                count++;
            }
            return count;
        }
    }

    /**
     * create a range by specifying upper and lower bounds for all three components.
     * All values are inclusive bounds.
     */
    public RGBRange rgb(int minR, int minG, int minB, int maxR, int maxG, int maxB){
        return new RGBRange(minR, minG, minB, maxR, maxG, maxB);
    }

    /**
     * create a range by specifying a "central point" and a maximum delta 
     */

    public RGBRange rgb(int r, int g, int b, int maxDelta){
        return new RGBRange(r-maxDelta, g-maxDelta, b-maxDelta,r+maxDelta, g+maxDelta, b+maxDelta);
    }
}
