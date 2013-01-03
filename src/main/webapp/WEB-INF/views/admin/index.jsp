<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<body class="easyui-layout">  
    <div data-options="region:'west',title:'West',split:true" style="width:100px;">
    	<a href="#" class="easyui-linkbutton" onclick="addTab('google','http://www.google.com')">google</a>  
	    <a href="#" class="easyui-linkbutton" onclick="addTab('jquery','http://jquery.com/')">jquery</a>  
	    <a href="#" class="easyui-linkbutton" onclick="addTab('easyui','http://jeasyui.com/')">easyui</a>  
    </div>  
    <div data-options="region:'center',title:'center title'">
	    <div id="tt" class="easyui-tabs" data-option="fit:true">  
		    <div title="Home">  
		    </div>  
		</div> 
    </div>  
</body> 
<script type="text/javascript">
	function addTab(title, url){  
	    if ($('#tt').tabs('exists', title)){  
	        $('#tt').tabs('select', title);  
	    } else {  
	        var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';  
	        $('#tt').tabs('add',{  
	            title:title,  
	            content:content,  
	            closable:true  
	        });  
	    }  
	} 
</script>