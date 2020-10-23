<%-- 
    Document   : editPedido
    Created on : 21-oct-2020, 22:58:50
    Author     : ROG STRIX
--%>

<%@page import="ModeloDAO.daoPedido"%>
<%@page import="beans.beanPedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDIT PEDIDO</title>
    </head>
    <body>
        <h1>EDITAR PROVEEDORES</h1>
        <div class="col-lg-6">
            <%
                daoPedido dPed = new daoPedido();
                int idPed = Integer.parseInt((String) request.getAttribute("idPed"));
                beanPedido bPed = (beanPedido) dPed.list(idPed);
            %>
            <h1>EDITAR PROVEEDORES</h1>
            <form action="controladorPedido">
            
            PRODUCTO <br>
            <input class="form-control" type="text" name="txtIdPdto" value="<%= bPed.getId_Producto().getId_Producto()%>"><br><br>
                       
            REPARTIDOR <br>
            <input class="form-control" type="text" name="txtIdRep" value="<%= bPed.getId_Repartidor().getId_Repartidor()%>"><br><br>                     
            
            CLIENTE <br>
            <input class="form-control" type="text" name="txtIdCli" value="<%= bPed.getId_Cliente().getId_Cliente()%>"><br><br>           
            
            IMPORTE TOTAL <br>
            <input class="form-control" type="text" name="txtImpTot" value="<%= bPed.getPrecio()%>"><br><br>
            
            ESTADO PEDIDO <br>
            <input class="form-control"  type="text" name="txtIdEP" value="<%= bPed.getId_Estado_pedido().getId_Estado_pedido()%>"><br><br>         
            
             <input type="hidden" name="txtIdPed" value="<%= bPed.getId_Pedido()%>">
                <input type="submit" name="accion" value="Actualizar">
                <a href="controladorPed?accion=listarPed">Regresar</a>
            </form>
        </div>
    </body>
</html>
