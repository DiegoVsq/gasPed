package Controlador;

import ModeloDAO.daoCliente;
import ModeloDAO.daoEstadoPed;
import ModeloDAO.daoPedido;
import ModeloDAO.daoProducto;
import ModeloDAO.daoRepartidor;
import beans.beanCliente;
import beans.beanEstadoPed;
import beans.beanPedido;
import beans.beanProducto;
import beans.beanRepartidor;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class controladorPedido extends HttpServlet {

    String listarPed = "vistaPedido/listarPedido.jsp";
    String editarPed = "vistaPedido/editPedido.jsp";
    String addPed = "vistaPedido/addPedido.jsp";
    
    beanPedido bPed = new beanPedido();
    daoPedido dPed = new daoPedido();
    
    beanCliente bC = new beanCliente();
    daoCliente dC = new daoCliente();
    
    beanProducto bPdt = new beanProducto();
    daoProducto dPdt = new daoProducto();

    beanRepartidor bRep = new beanRepartidor();
    daoRepartidor dRep = new daoRepartidor();
    
    beanEstadoPed bEP = new beanEstadoPed();
    daoEstadoPed dEP = new daoEstadoPed();
    
    int id; 
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet controladorPedido</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controladorPedido at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String acceso ="";
       String action = request.getParameter("accion");
       if(action.equalsIgnoreCase("listarPed")){
           acceso = listarPed;
       }else if(action.equalsIgnoreCase("addPed")){
           acceso = addPed;
       }else if(action.equalsIgnoreCase("Agregar")){
           bC = dC.list(Integer.parseInt(request.getParameter("txtIdCli")));
           bPdt = dPdt.list(Integer.parseInt(request.getParameter("txtIdPdto")));
           bRep = dRep.listRep(Integer.parseInt(request.getParameter("txtIdRep")));
           bEP = dEP.list(Integer.parseInt(request.getParameter("txtIdEP")));
           
           bPed.setId_Pedido(Integer.parseInt(request.getParameter("txtIdPed")));
           bPed.setPrecio(Integer.parseInt(request.getParameter("txtImpTot")));
           bPed.setId_Cliente(bC);
           bPed.setId_Estado_pedido(bEP);
           bPed.setId_Producto(bPdt);
           bPed.setId_Repartidor(bRep);
           
           dPed.add(bPed);
           acceso = listarPed;
       }else if(action.equalsIgnoreCase("editarPed")){
           request.setAttribute("idPed", request.getParameter("idPed"));
           acceso = editarPed;
       }else if(action.equalsIgnoreCase("Actualizar")){
           int id = Integer.parseInt(request.getParameter("txtIdPed"));
           bC = dC.list(Integer.parseInt(request.getParameter("txtIdCli")));
           bPdt = dPdt.list(Integer.parseInt(request.getParameter("txtIdPdto")));
           bRep = dRep.listRep(Integer.parseInt(request.getParameter("txtIdRep")));
           bEP = dEP.list(Integer.parseInt(request.getParameter("txtIdEP")));
           
           bPed.setId_Pedido(id);
           bPed.setPrecio(Integer.parseInt(request.getParameter("txtImpTot")));
           bPed.setId_Cliente(bC);
           bPed.setId_Estado_pedido(bEP);
           bPed.setId_Producto(bPdt);
           bPed.setId_Repartidor(bRep);
           
           dPed.edit(bPed);
           acceso = listarPed;
       }else if(action.equalsIgnoreCase("eliminarPed")){
           id = Integer.parseInt(request.getParameter("idPed"));
           bPed.setId_Pedido(id);
           dPed.eliminar(id);
           acceso= listarPed;
       }
       RequestDispatcher vistaT = request.getRequestDispatcher(acceso);
       vistaT.forward(request, response);    
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
