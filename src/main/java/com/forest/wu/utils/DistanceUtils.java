package com.forest.wu.utils;

/**
 * ${DESCRIPTION}
 *
 * @author 任一
 * @create 2018-09-28 14:17
 * <p>
 * 直线距离计算工具类
 **/
public class DistanceUtils {
    private final static String BEIJING = "北京";
    private final static String SHANGHAI = "上海";
    private final static String SHENZHEN = "深圳";
    private final static String CHENGDU = "成都";

    /**
     *
     * @author: 任一
     * @Description
     * @Date: 13:38 2018/9/29
     * @Param：String
     * @return：int
     *
     */
    public static int getDistance(String cityA,String cityB) {
        int distance = 0;

        //北京<--->上海
        if ((cityA.equals(BEIJING) && cityB.equals(SHANGHAI)) ||
                (cityA.equals(SHANGHAI) && cityB.equals(BEIJING))) {
            distance = 1048;
        }

        //北京<--->深圳
        if ((cityA.equals(BEIJING) && cityB.equals(SHENZHEN)) ||
                (cityA.equals(SHENZHEN) && cityB.equals(BEIJING))) {
            distance = 1967;
        }

        //北京<--->成都
        if ((cityA.equals(BEIJING) && cityB.equals(CHENGDU)) ||
                (cityA.equals(CHENGDU) && cityB.equals(BEIJING))) {
            distance = 1526;
        }

        //上海<--->成都
        if ((cityA.equals(SHANGHAI) && cityB.equals(CHENGDU)) ||
                (cityA.equals(CHENGDU) && cityB.equals(SHANGHAI))) {
            distance = 1654;
        }

        //上海<--->深圳
        if ((cityA.equals(SHANGHAI) && cityB.equals(SHENZHEN)) ||
                (cityA.equals(SHENZHEN) && cityB.equals(SHANGHAI))) {
            distance = 1200;
        }

        //成都<--->深圳
        if ((cityA.equals(CHENGDU) && cityB.equals(SHENZHEN)) ||
                (cityA.equals(SHENZHEN) && cityB.equals(CHENGDU))) {
            distance = 1337;
        }
        return distance;
    }
}
