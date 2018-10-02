package com.forest.wu.utils;

import java.math.BigDecimal;

/**
 * ${DESCRIPTION}
 *
 * @author 任一
 * @create 2018-09-29 13:41
 *
 * 预估！运算计费时效
 **/
public class CalculateMoneyEstimate {
    /**
     *
     * @author: 任一
     * @Description
     * @Date: 14:13 2018/9/29
     * @Param：int
     * @return：String
     *
     * 计算运送时间
     */
    public static String calculateTime(int distance){
        String estimate = "";
        //一天最大运输2000KM
        //市外运输+1小时富余+8小时市内派送
        double t = (double)distance/2000*24;
        int time = (int)t+1+8;

        int day = time/24;
        //运送时间多余1天的情况
        if(day>=1){
            int hours = time-24*day;
            estimate=day+"天"+hours+"小时";
        }else{
            estimate=time+"小时";
        }
        return estimate;
    }

    /**
     *
     * @author: 任一
     * @Description
     * @Date: 14:31 2018/9/29
     * @Param：int,double
     * @return：double
     *
     * 计算预估费用，保留一位小数
     */
    public static double calculateMoney(int distance,int estimatedWeight){
        //五元起手费+距离/0.01*重量
        double money = 5+distance*0.01*estimatedWeight;
        //保留一位小数点
        BigDecimal m = new BigDecimal(money);
        money = m.setScale(1,BigDecimal.ROUND_HALF_UP).doubleValue();

        return money;
    }
}
