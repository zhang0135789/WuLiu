<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connection" scope="page" class="com.wy.util.JDBConnection"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="CSS/style.css">
<title>
CarMessage_change page
</title>
</head>
<Script language="javascript">
function check()
{
 if(form1.numbers.value=="")
{
alert("�����복�ƺţ���");
form1.numbers.focus();
return false;
}
if(form1.type.value=="")
{
alert("�����복�����ͣ�1");
form1.type.focus();
return false;
}
if(form1.carname.value=="")
{
alert("�����복Ʒ������");
form1.carname.focus();
return false;
}
if(form1.loads.value=="")
{
alert("�����복�����أ�����");
form1.loads.focus();
return false;
}
if(form1.usetime.value=="")
{
alert("�����복��ʹ��ʱ�䣡����");
form1.usetime.focus();
return false;
}
if(form1.transtyle.value=="")
{
alert("�������������ͣ�����");
form1.style.focus();
return false;
}
if(form1.name.value=="")
{
alert("�������ʻԱ��������1");
form1.name.focus();
return false;
}
if(form1.number.value=="")
{
alert("�������֤���룡����");
form1.number.focus();
return false;
}
if(form1.styles.value=="")
{
alert("�������֤���ͣ�����");
form1.styles.focus();
return false;
}
if(form1.time.value=="")
{
alert("�������ʻԱ���䣡��");
form1.time.focus();
return false;
}
if(form1.linkman.value=="")
{alert("��������ϵ������������");
form1.linkman.focus();
return false;
}
if(form1.phone.value=="")
{
alert("��������ϵ�绰����");
form1.phone.focus();
return false;
}
}
</Script>
<%!
ResultSet rs=null;
String sql;
String userName;
int code;
%>
<body bgcolor="#ffffff">

<jsp:include page="top.jsp"/>
<form action="car_changeConfig.jsp" name="form1">
<table  width="786" border="1" align="center" cellpadding="0" cellspacing="0"bordercolor="#FFFFFF" bordercolordark="#333333" bordercolorlight="#FFFFFF">
  <tr>
    <td width="100%" height="38" colspan="4">
      <p align="center"><font size="7" >������Ϣ�޸�</font></td>
  </tr>
<%
sql="select * from tb_CarMessage where Code="+request.getParameter("id");
try
{
rs=connection.executeQuery(sql);
if(rs.next())
{
code=rs.getInt("Code");
%>
  <tr>
    <td width="18%" height="34">���ƺ�</td>
    <td width="32%" height="34"><input type="text" readonly="yes"  name="numbers" size="20"value="<%=rs.getString("TradeMark")%>"></td>
    <td width="19%" height="34">��Ʒ��</td>
    <td width="31%" height="34"><input type="text" name="carname" size="20"value="<%=rs.getString("Brand")%>"></td>
  </tr>
  <tr>
    <td width="18%" height="36">��������</td>
    <td width="32%" height="36"><input type="text" name="type" size="20"value="<%=rs.getString("Style")%>"></td>
    <td width="19%" height="36">����</td>
    <td width="31%" height="36"><input type="text" name="loads" size="20"value="<%=rs.getString("CarLoad")%>">��</td>
  </tr>
  <tr>
    <td width="18%" height="37">ʹ��ʱ��</td>
    <td width="32%" height="37"><input type="text" name="usetime" size="20"value="<%=rs.getString("UsedTime")%>">��</td>
       <td width="18%" height="37">��ʻԱ����</td>
    <td width="32%" height="37"><input type="text" name="name" size="20"value="<%=rs.getString("DriverName")%>"></td>
  </tr>
  <tr>
    <td width="19%" height="37">����</td>
    <td width="31%" height="37"><input type="text" name="time" size="20"value="<%=rs.getString("DriverTime")%>"></td>
    <td width="18%" height="36">��ʻ֤����</td>
    <td width="32%" height="36"><input type="text" name="number" size="20"value="<%=rs.getString("LicenceNumber")%>"></td>
  </tr>
  <tr>
    <td width="19%" height="36">��ʻ֤����</td>
    <td width="31%" height="36"><input type="text" name="styles" size="20"value="<%=rs.getString("LicenceStyle")%>"></td>
   <td width="19%" height="37">��������</td>
     <td width="31%" height="37"><input type="text" name="transtyle" size="20"value="<%=rs.getString("TranspotStyle")%>"></td>
</tr>
  <tr>
    <td width="18%" height="42">��ϵ��</td>
    <td width="32%" height="42"><input type="text" name="linkman" size="20"value="<%=rs.getString("LinkMan")%>"></td>
    <td width="19%" height="42">��ϵ�绰</td>
    <td width="31%" height="42"><input type="text" name="phone" size="20"value="<%=rs.getString("LinkPhone")%>"></td>
  </tr>
  <tr>
    <td width="18%" height="65">��ע</td>
    <td width="82%" height="65" colspan="3">
   <textarea rows="3" name="remark" cols="76">
  <%=rs.getString("Remark")%></textarea></td>
  </tr>
  <tr>
    <td width="18%" height="42">����ʱ��</td>
    <td width="32%" height="42">
<input type="text" name="issuedate" size="20"value="<%=rs.getString("IssueDate")%>"></td>
    <td width="19%" height="42">ID:</td>
    <td width="31%" height="42"><input type="hidden" name="numb" value="<%=code%>"> <%=code%> </td>
  </tr>
<tr>
    <tr>
    <td width="18%" height="23">������</td>
    <td width="32%" height="23" colspan="3"><%=rs.getString("UserName")%>

<input type="hidden" name="user" size="20"value="<%=rs.getString("UserName")%>"></td>
  </tr>
<tr>
 <td width="786" height="40" colspan="4">

   <div align="center">
       <input type="submit" name="show" value="�޸�" onClick="return check()">
     &nbsp;&nbsp;
       <input type="submit" name="reset" value="��д">
&nbsp;&nbsp; 
    <input type="button" name="back" value="����" onClick="history.back()">
   </div></td>
</tr>

<%
}


}catch(SQLException e)
{
 System.out.print("��ѯ�쳣");
}
%>
</table>
</form>
</body>
</html>
