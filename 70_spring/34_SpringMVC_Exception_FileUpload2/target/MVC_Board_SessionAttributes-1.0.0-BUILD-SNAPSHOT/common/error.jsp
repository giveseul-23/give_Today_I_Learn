<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021-03-10
  Time: 오후 4:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>에러화면</title>
    <style>
        #container{
            width: 700px;
            margin: 0 auto;
        }
        h2, p{
            text-align: center;
        }
        .orange{
            background-color: orange;
        }
    </style>
</head>
<body>
    <div id="container">
        <h2>기본 에러 화면입니다.</h2>
        <hr>
        <p class="orange">Message : ${exception.message}</p>
        <p>시스템 담당자(8282)에게 연락바랍니다</p>
    </div>
</body>
</html>
