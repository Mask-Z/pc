package com.ccjt.ejy.web;
//import org.apache.axis.client.Call;
//import org.apache.axis.client.Service;

import javax.xml.namespace.QName;
import java.net.URL;
/**
 * Created by Mr丶周 on 2017/11/2.
 */



public class WebServiceDemo {
//	public static void main(String[] args) throws Exception {
//		Service sv = new Service();  //new 一个服务
//		Call call = (Call) sv.createCall();  //创建一个call对象
//		call.setTargetEndpointAddress(new URL("http://58.216.221.106:8001/EpointWebService_Czcq/WebSiteService.asmx?wsdl"));  //设置要调用的接口地址以上一篇的为例子
//		call.setOperationName(new QName("SendMessage"));  //设置要调用的接口方法
//		call.addParameter("userName", org.apache.axis.encoding.XMLType.XSD_STRING,javax.xml.rpc.ParameterMode.IN);//设置参数名 id  第二个参数表示String类型,第三个参数表示入参
//		call.addParameter("passWord", org.apache.axis.encoding.XMLType.XSD_STRING,javax.xml.rpc.ParameterMode.IN);//设置参数名 id  第二个参数表示String类型,第三个参数表示入参
//		call.addParameter("phoneNum", org.apache.axis.encoding.XMLType.XSD_STRING,javax.xml.rpc.ParameterMode.IN);//设置参数名 id  第二个参数表示String类型,第三个参数表示入参
//		call.addParameter("content", org.apache.axis.encoding.XMLType.XSD_STRING,javax.xml.rpc.ParameterMode.IN);//设置参数名 id  第二个参数表示String类型,第三个参数表示入参
//		call.setReturnType(org.apache.axis.encoding.XMLType.XSD_STRING);//返回参数类型
//		//开始调用方法,假设我传入的参数id的内容是1001   调用之后会根据id返回users信息，以xml格式的字符串返回，也可以json格式主要看对方用什么方式返回
//		String result = (String) call.invoke(new Object[]{"test","test","15851932796","sss"});
//		System.out.println(result);//打印字符串
//	}
}
