<%@page import="br.edu.fatecpg.poo.p2.Disciplina"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
    String exceptionMessage = null;
    if(request.getParameter("Cancelar")!=null){
        response.sendRedirect(request.getRequestURI());

    }
   if(request.getParameter("formInserir")!=null){
       try{
       String nome = request.getParameter("nome");
       String ementa = request.getParameter("ementa");
       int ciclo = Integer.parseInt(request.getParameter("ciclo"));
       float nota = Float.parseFloat(request.getParameter("notainicial"));
       Disciplina.InserirDisciplina(nome, ementa, ciclo, nota);
       
        response.sendRedirect(request.getRequestURI());

       }catch(Exception ex){
           exceptionMessage = ex.getLocalizedMessage();
       } 
   }
   if(request.getParameter("Excluir")!= null){
       try{
       String nome = request.getParameter("nome");
            Disciplina.ExcluirDisciplina(nome);
        response.sendRedirect(request.getRequestURI());

       }catch(Exception ex){
           exceptionMessage = ex.getLocalizedMessage();
       } 

   }
   
    try{
        if(request.getParameter("nota")!= null ){
        float nota = Float.parseFloat(request.getParameter("n"));
        String nome = request.getParameter("nome2");
        Disciplina.AlterarNota(nome, nota);
        }
    }catch(Exception ex){
        exceptionMessage = ex.getLocalizedMessage();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Prova POO</title>
         <%@include file="WEB-INF/jspf/menu.jspf" %>
    </head>
    <body>
                
         <%if(request.getParameter("PrepararInsert")!=null){%>
                <fieldset>
             <legend>Inserir Disciplina</legend>
         <form method="post">
             
             <li>
             <label>Nome da disciplina:</label> 
             <input type="text" name="nome">
           
             <label>Ementa: </label> 
             <input type="text" name="ementa"/>
             
             <label>Ciclo</label> 
             
             <input type="number" name="ciclo" min="1" max="6">
             
             </li>
             
                         
                   
             <div>
                 <input type="hidden" name="notainicial" value="0">
             </div>
             
             <hr/>
             
             <input type="submit" name="formInserir" value="Inserir Disciplina"/>
             <input type="submit" name="Cancelar" value="Cancelar"/>

         </form>
         </fieldset>
           
         
        <%}else if(request.getParameter("PrepararDelete")!= null){%>
                           
    

              <%}else if(request.getParameter("PrepararNota")!= null){%>
                <fieldset>
             <legend>Alterar categoria</legend>
             <%String nome = request.getParameter("nome");%>
        <form method="post">
            Alterar a nota da disciplina <b><%= nome%></b>?
                    <input type="hidden" name="nome2" value="<%=nome%>">
                    <input type="number" name="n" step="0.1" min="0" max="10">
                    <input type="submit" name="nota" value="Confirmar">
                    <input type="submit" name="Cancelar" value="Cancelar"/>

                </form>
         </fieldset>

            <%}else{%>
            
             <form method="post">
                
                <input type="submit" name="PrepararInsert" value="adicionar disciplina">
            </form>
            <%}%>
            
    <table border="1" >
        <tr>
            <th>Disciplina</th>
            <th>Ementa</th>
            <th>Ciclo</th>
            <th>Nota</th>
            <th style="text-align: center">Comandos</th>
        </tr>        
       
        <%for(Disciplina disc:Disciplina.getList()){%>
        <tr>
            <td><%=disc.getNome() %></td>
            <td><%=disc.getEmenta() %></td>
            <td><%=disc.getCiclo() %></td>
            <td><%=disc.getNota() %></td>
            <td>
                <form method="post">
                     <input type="hidden" name="nome" value="<%=disc.getNome() %>">
                         <input type="submit" name="Excluir" value="Excluir">
                         <input type="submit" name="PrepararNota" value="Alterar Nota">
                </form>
            </td>
        </tr>
        <%}%>
    </table>

        
    </body>
        
       </html>
