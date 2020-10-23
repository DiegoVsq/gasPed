<%-- 
    Document   : addPedido
    Created on : 21-oct-2020, 23:00:23
    Author     : ROG STRIX
--%>


<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.daoProducto"%>
<%@page import="beans.beanProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD PEDIDO</title>
    </head>
    <body>
        <h1>AGREGAR PEDIDOS</h1>
        <form action="controladorPedido">
            ID PEDIDO: <br>
            <input class="form-control" readonly type="text" name="txtIdPed"><br><br>
            
            PRODUCTO: <br>
            <input class="form-control" type="text" name="txtIdPdto"><br><br>
            <% /*
                daoProducto dPdto = new daoProducto();
                List<beanProducto> lstPdto = dPdto.listar();
                Iterator<beanProducto> iter1 = lstPdto.iterator();
                beanProducto bPdto = null;
            */ %>
            <!-- 
            <select id="producto" class="form-control" name="txtIdPdto" required><br>
                <option value="1">Seleccione una opcion</option>
            <%  //    for (beanProducto i : lstPdto){%>
                <option value="<%  //     = i.getId_Producto()%>">
            <%  //    = i.getNombre_producto()%>
                </option>
            <% // } %>
            </select><br><br>
            -->
            
            REPARTIDOR: <br>
            <input class="form-control" type="text" name="txtIdRep"><br><br>                     
            CLIENTE: <br>
            <input class="form-control" type="text" name="txtIdCli"><br><br>           
            IMPORTE TOTAL <br>
            <input class="form-control" type="text" name="txtImpTot"><br><br>
            FECHA INICIO <br>
            <input class="form-control" readonly type="text" name="txtFchInic"><br><br>
            FECHA ENTREGA <br>
            <input class="form-control" readonly type="text" name="txtFchEntr"><br><br>         
            ESTADO PEDIDO <br>
            <input class="form-control"  type="text" name="txtIdEP"><br><br>         
            <!-- 
            <select class="form-control" name="txtIdEP">
                <option value="1"> Seleccione predeterminado </option>
                <option value="2"> 1 </option>
            </select><br><br>
            -->
            
            <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
            <a class="btn btn-primary" href="controladorPedido?accion=listarPed">Regresar</a>
        </form>   
    </body>
</html>
