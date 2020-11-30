
package br.edu.fatecpg.poo.p2;

import br.edu.fatecpg.poo.p2.Disciplina;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.*;


public class Listener implements ServletContextListener {
    public static final String CLASS_NAME="org.sqlite.JDBC";
    public static final String URL="jdbc:sqlite:C:\\Users\\Home\\Documents\\Fatec 4 modulo\\Pupo\\ProgramacaoOrientadaObjetosP2\\data\\banco.bd";
    
    public static String Message;
    public static String exceptionMessage;
    
    public static Connection getConnection() throws Exception{
     return DriverManager.getConnection(URL);
    } 

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Connection con = null;
        Statement stmt = null;
        
        try{
          Class.forName(CLASS_NAME);
          con = DriverManager.getConnection(URL);
          Message = "funcionou";
          stmt = con.createStatement();
                    Message += " funcionou 2";

          stmt.execute(Disciplina.GetCreateStatement());
                    Message += " funcionou 3";
                    
              if(Disciplina.getList().isEmpty()){
                            Message += " funcionou 4";

              }      
            
            
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
            
        }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
