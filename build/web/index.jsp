<%@page import="br.edu.fatecpg.poo.p2.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Prova POO</title>
         <%@include file="WEB-INF/jspf/menu.jspf" %>
    </head>
    <body>
        <h1>Avaliação POO</h1>
        <h1>Ewerton Luiz</h1>
        <div>Disciplinas matriculadas:  <%= Disciplina.getList().size() %></div>
    </body>
   
</html>
