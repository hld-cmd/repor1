<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>JSON�첽ˢ�±������</title>
</head>
<script type="text/javascript">
	function searchData()
	{
		var xmlHttpRequest;
		if (window.XMLHttpRequest) {  
	        //Firefox,Netscape,Chrome,Safari�������  
	        xmlHttpRequest = new XMLHttpRequest(); 
	    } else if (window.ActiveXObject) { //IE�����  
	        try {  
	        	xmlHttpRequest = new ActiveXObject("Msxml2.XMLHTTP"); //����xmlHttp����  
	        } catch (e) {  
	            try {  
	            	xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP"); //����xmlHttp����  
	            } catch (e) { }  
	        }  
	    }
		xmlHttpRequest.open("GET", "jsonServlet");
		xmlHttpRequest.onreadystatechange = function () {
	        if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
	        	var data = xmlHttpRequest.responseText;
	        	for(var i = document.getElementById("tby").childNodes.length - 1; i >= 0 ;i--) 
				{ 
					document.getElementById("tby").removeChild(document.getElementById("tby").childNodes[i]); 
				}
	        	var jsondata = eval("("+data+")");
	        	for(var i = 0 ; i< jsondata.length;i++)
	        	{
	        		var row = document.getElementById("tby").insertRow();
	        		var cell1 = row.insertCell();
	        		var cell2 = row.insertCell();
	        		cell1.innerHTML = jsondata[i].userid;
	        		cell2.innerHTML = jsondata[i].username;
	        	}
	        }
	    }
		xmlHttpRequest.send();
	}
</script>
<body>
	<form>
		<input type="button" onclick="searchData();" value="��ѯ"/>
		<table>
			<tr>
				<th>id</th>
				<th>name</th>
			</tr>
			<tbody id="tby">
				<tr>
					<td colspan="2">���ѯ</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>