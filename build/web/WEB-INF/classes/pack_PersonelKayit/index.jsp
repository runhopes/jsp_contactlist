<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" import="javax.sql.*" %>
<!DOCTYPE html>
<html>
    <%@ include file = "parts/head.jsp" %>
    <%@ include file = "parts/menu.jsp" %>
    <%@ include file = "connection/connect.jsp" %>
    <%@ include file = "pages/array.jsp" %>
    <body>
        
        <div class="col-md-4 mx-auto mt-5 shadow-sm p-3 mb-5 bg-white rounded">
            <div class="col-md-12 text-center"><h5> Kayıt yapmak istediğiniz personelin bilgilerini giriniz. </h5> </div>
            <table class="table">
                <tr>
                    <td> <input type="text" form="kayitform" class="form-control" placeholder="Personelin adını giriniz."> </td>
                    <td> <input type="text" form="kayitform" class="form-control" placeholder="Personelin soyadını giriniz."> </td>
                </tr>
                <tr>
                    <td> <input type="text" form="kayitform" class="form-control" placeholder="Personelin kan grubunu giriniz."> </td>
                    <td> <input type="text" form="kayitform" class="form-control" placeholder="Telefon numarası giriniz."> </td>
                </tr>
                <tr>
                    <td colspan="2"><textarea form="kayitform" class="form-control"></textarea></td>
                </tr>                
                <tr>
                    <td></td>
                    <td><button class="btn btn-success" form="kayitform" type="submit" style="float:right;"> Kayıt Yap </button></td>
                </tr>
            </table>
        </div>
        
        <jsp:useBean id="giris" class="pack_PersonelKayit.class_Kayit" scope="page" />
        
        <jsp:setProperty name="giris" property="per_name" value="deger" />
        <jsp:getProperty name="giris" property="per_name"/>
        
        
        
        <div class="col-md-6 mx-auto mt-5 shadow-sm p-3 mb-5 bg-white rounded">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Personel ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Surname</th>
                        <th scope="col">Blood</th>
                        <th scope="col">Telephone</th>
                        <th scope="col">Adress</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                     String conURL = "jdbc:mysql://localhost:3306/proje_ikkayit";
                     Connection baglanti = null;
                     Statement sorgu = null;
                     ResultSet sonuc = null;
                     Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                     baglanti = DriverManager.getConnection(conURL, "root", "");
                     sorgu = baglanti.createStatement();
                     sonuc = sorgu.executeQuery("SELECT * FROM t_personel");
                     while (sonuc.next()) { %>
                     <tr>
                         <% out.println("<td>" + sonuc.getString("person_id")+"</td>"); %>
                         <% out.println("<td>" + sonuc.getString("person_name")+"</td>"); %>
                         <% out.println("<td>" + sonuc.getString("person_surname")+"</td>"); %>
                         <% out.println("<td>" + sonuc.getString("person_blood")+"</td>"); %>
                         <% out.println("<td>" + sonuc.getString("person_tel")+"</td>"); %>
                         <% out.println("<td>" + sonuc.getString("person_adress")+"</td>"); %>
                     </tr>       
                     <%    }
                         sonuc.close(); 
                     %>
                </tbody>
            </table>   
        </div>
        
        
    </body>

    <%@  include file = "parts/footer.jsp" %>
</html>
