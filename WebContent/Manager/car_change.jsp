<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connection" scope="page" class="com.wy.JDBConnection"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../CSS/style.css">
<title>
CarMessage_change page
</title>
</head>
<Script language="javascript">
function check()
{
 if(form1.numbers.value=="")
{
alert("����д���ƺ��룡��");
form1.numbers.focus();
return false;
}
if(form1.type.value=="")
{
alert("����д�������ͣ�����");
form1.type.focus();
return false;
}
if(form1.carname.value=="")
{
alert("����д����Ʒ�ƣ�����");
form1.carname.focus();
return false;
}
if(form1.loads.value=="")
{
alert("����д�������أ�����");
form1.loads.focus();
return false;
}
if(form1.usetime.value=="")
{
alert("����дʹ�����ޣ�����");
form1.usetime.focus();
return false;
}
if(form1.transtyle.value=="")
{
alert("����д�������ͣ�����");
form1.transtyle.focus();
return false;
}
if(form1.name.value=="")
{
alert("����д��ʻԱ����������");
form1.name.focus();
return false;
}
if(form1.number.value=="")
{
alert("����д��ʻ֤���룡����");
form1.number.focus();
return false;
}
if(form1.styles.value=="")
{
alert("����д��ʻ֤���ͣ�����");
form1.styles.focus();
return false;
}
if(form1.time.value=="")
{
alert("����д��ʻԱ���䣡����");
form1.time.focus();
return false;
}
if(form1.linkman.value=="")
{alert("����д��ϵ�ˣ�����");
form1.linkman.focus();
return false;
}
if(form1.phone.value=="")
{
alert("����д��ϵ�绰������");
form1.phone.focus();
return false;
}
}
</Script>
<%!
ResultSet rs=null;
String sql;
String userName;
int num,code;
%>

<body bgcolor="#ffffff"><jsp:include page="mtop.jsp"/>
<form action="car_changeConfig.jsp" method="post"name="form1">
<table width="785" border="1" align="center" cellpadding="0" cellspacing="0"bordercolor="#FFFFFF" bordercolordark="#333333" bordercolorlight="#FFFFFF">
  <tr>
    <td width="100%" height="62" colspan="4" align="center">������Ϣ�޸�</td>
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
    <td width="18%" height="34" align="center">���ƺ��룺</td>
    <td width="32%" height="34" align="center"><input type="text" name="numbers" size="20"value="<%=rs.getString("TradeMark")%>"></td>
    <td width="19%" height="34" align="center">����Ʒ����</td>
    <td width="31%" height="34" align="center"><input type="text" name="carname" size="20"value="<%=rs.getString("Brand")%>"></td>
  </tr>
  <tr>
    <td width="18%" height="36" align="center">�������ͣ�</td>
    <td width="32%" height="36" align="center"><input type="text" name="type" size="20"value="<%=rs.getString("Style")%>"></td>
    <td width="19%" height="36" align="center">����������</td>
    <td width="31%" height="36" align="center"><input type="text" name="loads" size="20"value="<%=rs.getString("CarLoad")%>">��</td>
  </tr>
  <tr>
    <td width="18%" height="37" align="center">��ʹ�ã�</td>
    <td width="32%" height="37" align="center"><input type="text" name="usetime" size="20"value="<%=rs.getString("UsedTime")%>">��</td>
       <td width="18%" height="37" align="center">��ʻԱ���ƣ�</td>
    <td width="32%" height="37" align="center"><input type="text" name="name" size="20"value="<%=rs.getString("DriverName")%>"></td>
  </tr>
  <tr>
    <td width="19%" height="37" align="center">��ʻԱ���䣺</td>
    <td width="31%" height="37" align="center"><input type="text" name="time" size="20"value="<%=rs.getString("DriverTime")%>">��</td>
    <td width="18%" height="36" align="center">��ʻ֤���룺</td>
    <td width="32%" height="36" align="center"><input type="text" name="number" size="20"value="<%=rs.getString("LicenceNumber")%>"></td>
  </tr>
  <tr>
    <td width="19%" height="36" align="center">��ʻ֤���ͣ�</td>
    <td width="31%" height="36" align="center">
      <%
String styles=rs.getString("LicenceStyle");
 %>
     &nbsp; <select size="1" name="styles">
       <option value="<%=styles%>" selected><%=styles%></option>
        <option value="A��">A��</option>
        <option value="B��">B��</option>
        <option value="C��">C��</option>
       </select>
  </td>
   <td width="19%" height="37" align="center">�������ͣ�</td>
     <td width="31%" height="37" align="center">
      <%
String trans=rs.getString("TranspotStyle");
 %>
<select size="1" name="transtyle">
       <option value="<%=trans%>" selected><%=trans%></option>
        <option value="��;">��;</option>
        <option value="��;">��;</option>
       </select>
  </td>
</tr>
  <tr>
    <td width="18%" height="42" align="center">��ϵ�ˣ�</td>
    <td width="32%" height="42" align="center"><input type="text" name="linkman" size="20"value="<%=rs.getString("LinkMan")%>"></td>
    <td width="19%" height="42" align="center">��ϵ�绰��</td>
    <td width="31%" height="42" align="center"><input type="text" name="phone" size="20"value="<%=rs.getString("LinkPhone")%>"></td>
  </tr>
  <tr>
    <td width="18%" height="65" align="center">��ע��</td>
    <td width="82%" height="65" colspan="3">
   <textarea rows="3" name="meg" cols="76">
  <%=rs.getString("Remark")%></textarea></td>
  </tr>
  <tr>
    <td width="18%" height="42" align="center">����ʱ�䣺</td>
    <td width="32%" height="42">
      <p align="center"><%=rs.getString("IssueDate")%></td>
    <td width="19%" height="42" align="center">ID:</td>
    <td width="31%" height="42"><%=code%><input type="hidden" name="code" value="<%=code%>">  </td>
  </tr>
<tr>
    <td width="18%" height="42" align="center">�����ˣ�</td>
    <td width="32%" height="42" colspan="3">
 
    <input type="text" name="username" size="20"value="<%=rs.getString("UserName")%>"></td>
  
  </tr>
<tr>
 <td width="104%" height="40" colspan="4">
    <p align="center">
 <input type="submit" name="show" value="�޸�" onClick="return check()">&nbsp;&nbsp;
  <input type="submit" name="reset" value="����">       </td>
</tr>

<%
}

}catch(SQLException e)
{
 System.out.print("��ѯ�쳣����");
}
%>
</table>
</form><jsp:include page="down.jsp"/>
</body>
</html>
