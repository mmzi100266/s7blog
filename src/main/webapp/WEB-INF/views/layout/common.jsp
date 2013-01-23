<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@include file="../taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title><tiles:insertAttribute name="title" ignore="true"/></title>
    <tiles:insertAttribute name="jscss"/>
</head>
<body>

<div id="page">

    <div id="header">
        <tiles:insertAttribute name="header"/>
    </div>

    <div id="body" class="container">
        <div class='row-fluid'>
            <tiles:insertAttribute name="leftslidebar"/>
            <tiles:insertAttribute name="body"/>
        </div>
    </div>

    <div id="footer">
        <tiles:insertAttribute name="footer"/>
    </div>

</div>

</body>

</html>