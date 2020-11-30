package br.edu.fatecpg.poo.p2;

import java.util.ArrayList;
import java.sql.*;

public class Disciplina {
    private String nome;   
    private String ementa;   
    private int ciclo;   
    private float nota;

    public Disciplina(String nome, String ementa, int ciclo, float nota) {
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
        this.nota = nota;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmenta() {
        return ementa;
    }

    public void setEmenta(String ementa) {
        this.ementa = ementa;
    }

    public int getCiclo() {
        return ciclo;
    }

    public void setCiclo(int ciclo) {
        this.ciclo = ciclo;
    }

    public float getNota() {
        return nota;
    }

    public void setNota(float nota) {
        this.nota = nota;
    }
    
     public static void InserirDisciplina(String nome, String ementa, int ciclo, float nota) throws Exception{
        Connection con = Listener.getConnection();
        PreparedStatement stmt = con.prepareStatement
        ("INSERT INTO discs VALUES(?,?,?,?)");
        stmt.setString(1, nome);
        stmt.setString(2, ementa);
        stmt.setInt(3, ciclo);
        stmt.setFloat(4, nota);
        stmt.execute();
        stmt.close();
        con.close();
    }
      
     public static void ExcluirDisciplina(String nome) throws Exception{
        Connection con = Listener.getConnection();
        PreparedStatement stmt = con.prepareStatement
        ("DELETE FROM discs WHERE nome = ?");
        stmt.setString(1, nome);
        stmt.execute();
        stmt.close();
        con.close();
    }
      public static void AlterarNota(String nome, float nota) throws Exception{
        Connection con = Listener.getConnection();
        PreparedStatement stmt = con.prepareStatement
        ("UPDATE discs SET nota= ? WHERE nome = ?");
        stmt.setFloat(1, nota);
        stmt.setString(2, nome);
        stmt.execute();
        stmt.close();
        con.close();
    }
            
    public static ArrayList<Disciplina> getList() throws Exception{
        ArrayList<Disciplina> list = new ArrayList();
        Connection con = Listener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT *FROM discs");
        while(rs.next()){
            list.add(new Disciplina(
                    rs.getString("nome"),
                    rs.getString("ementa"),
                    rs.getInt("ciclo"),
                    rs.getFloat("nota")
            ));
        }
        rs.close();
        stmt.close();
        con.close();
        
        return list;
    }
    
      
    public static String GetCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS discs("
                + "nome VARCHAR(50) NOT NULL,"
                + "ementa VARCHAR(500) NOT NULL,"
                + "ciclo INTEGER NOT NULL,"
                + "nota FLOAT"
                + ")";
    }
}
