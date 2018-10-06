package com.forest.wu.utils.httpApiDemo;

import com.forest.wu.utils.httpApiDemo.common.Config;
import com.forest.wu.utils.httpApiDemo.common.HttpUtil;

import java.net.URLEncoder;
import java.util.Random;

/**
 * 验证码通知短信接口
 * 
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 *
 */
public class IndustrySMS
{
	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;
	private static String to = "18007303116";
	private static String smsContent = "【飞鸟物流】您的验证码为{1}，请于{2}分钟内正确输入，如非本人操作，请忽略此短信。";
	private static String result="";

	public static String getResult() {
		return result;
	}

	public static void setResult(String result) {
		IndustrySMS.result = result;
	}

	public static String getTo() {
		return to;
	}

	public static void setTo(String to) {
		IndustrySMS.to = to;
	}


	/**
	 * 随机生成短信验证码
	 */
	public static void SMS()
	{
		result="";
		Random random = new Random();
		for (int i=0;i<6;i++)
		{

			result+=random.nextInt(10);
		}
		IndustrySMS.smsContent= "【飞鸟物流】您的验证码为"+result+"，请于2分钟内正确输入，如非本人操作，请忽略此短信。";

	}
	
	
	
	/**
	 * 验证码通知短信
	 */
	public static void execute()
	{    
		IndustrySMS.SMS();
		String tmpSmsContent = null;
	    try{
	      tmpSmsContent = URLEncoder.encode(smsContent, "UTF-8");
	    }catch(Exception e){
	      
	    }
	    String url = Config.BASE_URL + operation;
	    String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + tmpSmsContent
	        + HttpUtil.createCommonParam();

	    // 提交请求
	    String result = HttpUtil.post(url, body);
	    System.out.println("result:" + System.lineSeparator() + result);
	}
}
