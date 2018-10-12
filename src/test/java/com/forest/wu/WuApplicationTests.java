package com.forest.wu;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.text.SimpleDateFormat;
import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest
public class WuApplicationTests {
    Logger logger = LoggerFactory.getLogger(getClass());
    @Test
    public static void  main(String[] args) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        System.out.println(format.format(new Date(System.currentTimeMillis())) );
    }




//        @Test
//        public static void main(String[] args){
//            int[] arr = new int[]{12,24,35,46,55,67,78,89,90};
//            System.out.println(binary(arr,35));
//            System.out.println(binary(arr,55));
//        }

        public static int binary(int[] arr,int key){
            int start=0;
            int end=arr.length-1;
            while(start<=end){
                int middle = (start+end)/2;
                if(key<arr[middle]){
                    end=middle-1;
                }else if(key>arr[middle]){
                    start=middle+1;
                }else{
                    return middle;
                }
            }
            return -1;
        }



}
