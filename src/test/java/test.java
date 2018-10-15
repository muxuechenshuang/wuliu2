import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @Author 肖林辉
 * @Description //TODO $end$
 * @create 2018-10-10 18:32
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class test {
    public static int binary(int[] array, int value) {
        int low=0;
        int high=array.length-1;
        while(low<=high){
            int middle = (low+high)/2;
            if(value==array[middle])
            {
                return middle;
            }
            if(value >array[middle])
            {
                low=middle +1;
            }
            if(value<array[middle])
            {
                high=middle-1;
            }

        }
        return -1;
    }

    public static void main(String[] args) {
        int[] a = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        int value = binary(a, 9);
       System.out.print(value);
    }


}