package com.ccjt.ejy.web.service;

import org.apache.axiom.om.OMAbstractFactory;
import org.apache.axiom.om.OMElement;
import org.apache.axiom.om.OMFactory;
import org.apache.axiom.om.OMNamespace;
import org.apache.axis2.AxisFault;
import org.apache.axis2.addressing.EndpointReference;
import org.apache.axis2.client.Options;
import org.apache.axis2.client.ServiceClient;
import org.apache.axis2.transport.http.HTTPConstants;

public class SendMessageService {
    private static EndpointReference targetEPR = new EndpointReference("http://58.216.221.106:8001/EpointWebService_Czcq/WebSiteService.asmx");

    /**
     * 发送短信
     * @param userName 接口用户名
     * @param passWord 接口密码
     * @param phoneNum 发送方号码
     * @param content  发送内容
     * @return
     */
    public  String sendMessage(String userName,String passWord,String phoneNum,String content){
        String result;
        Options options = new Options();
        options.setAction("http://epoint.com.cn/SendMessage");// 调用接口方法
        options.setTo(targetEPR);
        options.setProperty(HTTPConstants.CHUNKED, "false");//设置不受限制.
        ServiceClient sender = null;
        try {
            sender = new ServiceClient();
            sender.setOptions(options);
            OMFactory fac = OMAbstractFactory.getOMFactory();
            OMNamespace omNs = fac.createOMNamespace("http://epoint.com.cn", "");
            OMElement method = fac.createOMElement("SendMessage", omNs);
            OMElement name = fac.createOMElement("userName", omNs);// 设置入参名称
            OMElement name2 = fac.createOMElement("passWord", omNs);// 设置入参名称
            OMElement name3 = fac.createOMElement("phoneNum", omNs);// 设置入参名称
            OMElement name4 = fac.createOMElement("content", omNs);// 设置入参名称
            name.setText(userName);// 设置入参值
            name2.setText(passWord);
            name3.setText(phoneNum);
            name4.setText(content);
            method.addChild(name);
            method.addChild(name2);
            method.addChild(name3);
            method.addChild(name4);
            method.build();
//            System.out.println("method：" + method.toString());
            OMElement response = sender.sendReceive(method);
//            System.out.println("response:" + response);
            OMElement elementReturn = response.getFirstElement();
//            System.out.println("cityCode:" + elementReturn.getText());
            result= elementReturn.getText();
        } catch (AxisFault e) {
            result="Error";
            e.printStackTrace();
        }


        return result;

    }

}
