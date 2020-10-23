<%-- 
    Document   : listarPedido
    Created on : 21-oct-2020, 22:58:58
    Author     : ROG STRIX
--%>

<%@page import="java.util.Iterator"%>
<%@page import="beans.beanPedido"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.daoPedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PEDIDOS</title>
    </head>
    <body>
        <h1>PEDIDOS</h1>
        <a href="controladorPedido?accion=addPed">Agregar</a>
        <br><br>
        <div class="table-responsive">
            <table border="1">
                <thead>
                    <tr>
                        <th align="center">ID PEDIDO</th>
                        <th align="center">FECHA INICIO</th>
                        <th align="center">FECHA ENTREGA</th>
                        <th align="center">NOMBRE CLIENTE</th>
                        <th align="center">NOMBRE PRODUCTO</th>
                        <th align="center">NOMBRE REPARTIDOR</th>
                        <th align="center">NOMBRE ESTADO PEDIDO</th>
                        <th align="center">IMPORTE TOTAL</th>
                        <th align="center">ACCIONES</th>
                    </tr>
                </thead>
                <% 
                    daoPedido dPed = new daoPedido();
                    List<beanPedido> lstPed = dPed.listarPedido();
                    Iterator<beanPedido> iter = lstPed.iterator();
                    beanPedido bPed = null;
                    while(iter.hasNext()){
                        bPed = iter.next();
                        
                %> 
                <tbody>
                    <tr>
                        <td align="center"><%= bPed.getId_Pedido()%></td>
                        <td align="center"><%= bPed.getFecha_inicio()%></td>
                        <td align="center"><%= bPed.getFecha_entrega()%></td>
                        <td align="center"><%= bPed.getId_Cliente().getNombre()%></td>
                        <td align="center"><%= bPed.getId_Producto().getNombre_producto()%></td>
                        <td align="center"><%= bPed.getId_Repartidor().getNombre()%></td>
                        <td align="center"><%= bPed.getId_Estado_pedido().getNombre_estado()%></td>
                        <td align="center"><%= bPed.getPrecio()%></td>
                        
                        <td align="center">
                            <a href="controladorPedido?accion=editarPed&idPed="<%= bPed.getId_Pedido()%>">EDIT</a>
                            <a href="controladorPedido?accion=eliminarPed&idPed="<%= bPed.getId_Pedido()%>">REMOVE</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
         </div>
    </body>
</html>
