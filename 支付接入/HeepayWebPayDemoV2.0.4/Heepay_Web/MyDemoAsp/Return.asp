﻿<!--#include file="md5.asp" -->
<%
	'
	'判断是否登陆  
	'
	
	'
	'接收参数，请加上判断 是否符合当前要求
	'比如钱是否为空了，格式等问题
	'
	
	
	'以下仅为参考
	
	dim result,pay_message,agent_id,jnet_bill_no,agent_bill_id,pay_type,pay_amt,remark,returnSign,key,sign
	
	result=request("result")
	pay_message=request("pay_message")
	agent_id=request("agent_id")
	jnet_bill_no=request("jnet_bill_no")
	agent_bill_id=request("agent_bill_id")
	pay_type=request("pay_type")
	
	pay_amt=request("pay_amt")
	remark=request("remark")
	
	returnSign=request("sign")
	
	key = "商户密钥"
	
	signStr=""
	signStr  = signStr & "result=" & result
	signStr  = signStr & "&agent_id=" & agent_id
	signStr  = signStr & "&jnet_bill_no=" & jnet_bill_no
	signStr  = signStr & "&agent_bill_id=" & agent_bill_id
	signStr  = signStr & "&pay_type=" & pay_type
	signStr  = signStr & "&pay_amt=" & pay_amt
	signStr  = signStr & "&remark=" & remark
	signStr = signStr & "&key=" & key
	
	sign=""
	sign=LCase(md5(signStr))
	
	if(sign==returnSign){   '比较MD5签名结果 是否相等 确定交易是否成功  成功显示给客户信息
		%> 
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>
            无标题页
        </title>
            <style>
                .tab
                {
                    border-collapse: collapse;
                    width: 700px;
                    border: #999 1px dashed;
                }
                .tab td
                {
                    padding: 5px;
                    border: #999 1px dashed;
                }
            </style>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        </head>
<body>
        
            <div style="height: 50px">
            </div>
            <div>
                <table class="tab" width="100%" border="0" align="center">
                    <tr>
                        <td align="center" colspan="2">
                            商户显示页面：
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 150px">
                            支付结果信息：
                        </td>
                        <td>
                            <%= pay_message %>
                        </td>
                    </tr>
                    <tr>
                      <td align="left">
                            交易号：
                      </td>
                      <td>
                            <%= jnet_bill_no %>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" style="width: 150px">
                            定单号：
                      </td>
                        <td>
                            <%= agent_bill_id %>
                        </td>
                    </tr>
                   
                    <tr>
                        <td align="left">
                            支付金额：
                        </td>
                        <td>
                            <%= result %>
                        </td>
                    </tr>
                </table>
            </div>
</body>
</html>

		<%
	}
	else{
		response.Write("出错了")
	}
%>
