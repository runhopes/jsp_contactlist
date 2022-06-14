<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" import="javax.sql.*" %>
<!DOCTYPE html>
<html>
    <%@ include file = "parts/head.jsp" %>
    <%@ include file = "parts/menu.jsp" %>
    <%@ include file = "connection/connect.jsp" %>
    <%@ include file = "pages/array.jsp" %>
    <body>
        
        
        <%
            String pagenumber = "0";
            if(request.getMethod().equals("GET"))
            pagenumber = request.getParameter("pagenumber");
            if(pagenumber == null) pagenumber = "0";
            String conURL = "jdbc:mysql://localhost:3306/proje_ikkayit";
            Connection baglanti = null;
            Statement sorgu = null;
            ResultSet sonuc = null;
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            baglanti = DriverManager.getConnection(conURL, "root", "");
            sorgu = baglanti.createStatement();
        %>
            
        <% if(pagenumber.equals("0")){ %>
            <div class="col-md-4 mx-auto mt-5 shadow-sm p-3 mb-5 bg-white rounded text-center">
                
                <h3> Personel kayıt sistemine hoşgeldiniz. </h3>
                <h4> İstediğiniz menüyü seçerek işlem gerçekleştirebilirsiniz </h4>
                
            </div>
        <% } %>
        
        
        <% if(pagenumber.equals("1")){ %>
       
        <div class="col-md-4 mx-auto mt-5 shadow-sm p-3 mb-5 bg-white rounded">
            <div class="col-md-12 text-center"><h5> Kayıt yapmak istediğiniz personelin bilgilerini giriniz. </h5> </div>
            <table class="table">
                <tr>
                    <td> <input type="text" name="per_name" form="kayitform" class="form-control" placeholder="Personelin adını giriniz."> </td>
                    <td> <input type="text" name="per_surname" form="kayitform" class="form-control" placeholder="Personelin soyadını giriniz."> </td>
                </tr>
                <tr>
                    <td> 
                        
                        <select name="per_blood" form="kayitform" class="form-control">
                            <option value="-">Kan Grubunu Seçiniz</option>
                            <option value="A">A</option>
                            <option value="A Rh+">A Rh+</option>
                            <option value="Ab">Ab</option>
                            <option value="Ab Rh+">Ab Rh+</option>
                            <option value="0 Rh-">0 Rh-</option>
                            <option value="0 Rh+">0 Rh+</option>
                        </select>
                    
                    
                    </td>
                    <td> <input type="text" name="per_tel" form="kayitform" class="form-control" placeholder="Telefon numarası giriniz."> </td>
                </tr>
                <tr>
                    <td colspan="2"><textarea name="per_adress" form="kayitform" class="form-control"></textarea></td>
                </tr>                
                <tr>
                    <td></td>
                    <td><button class="btn btn-success" form="kayitform" type="submit" style="float:right;"> Personeli Kaydet </button></td>
                </tr>
            </table>
        </div>
        
        <% } %>
        
        
        
        <% if(pagenumber.equals("2")){ %>
        <div class="col-md-6 mx-auto mt-5 shadow-sm p-3 mb-5 bg-white rounded" style="height:600px;overflow-x:auto;">
            <h5> Sistemde ekli olan personeller. </h5>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Personel ID</th>
                        <th scope="col">Adı</th>
                        <th scope="col">SOYADI</th>
                        <th scope="col">Kan Grubu</th>
                        <th scope="col">Telefon</th>
                        <th scope="col">Adress</th>
                    </tr>
                </thead>
                <tbody>
                    <%                     
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
                     <% } %>
                </tbody>
            </table>   
        </div>
            <% } 

            if(request.getMethod().equals("POST"))
            {
                String per_name = request.getParameter("per_name");
                String per_surname = request.getParameter("per_surname");
                String per_blood = request.getParameter("per_blood");
                String per_tel = request.getParameter("per_tel");
                String per_adress = request.getParameter("per_adress");
                sorgu.executeUpdate("insert into t_personel (person_name,person_surname,person_blood,person_tel,person_adress) values ('"+per_name+"','"+per_surname+"','"+per_blood+"','"+per_tel+"','"+per_adress+"')");
            }

            %>
        
        
    </body>

    <%@  include file = "parts/footer.jsp" %>
</html>
