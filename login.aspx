<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="Seguridad_login" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login usando base de datos</title>
        <link rel="stylesheet" type="text/css" href="styles/ejemplo_index_css.css" media="screen" />
    <style type="text/css">

        .style7
        {
            font-size: medium;
            color: #660033;
            text-align: center;
            font-family: Arial;
        }
        .style2
        {
            width: 28%;
            font-size: medium;
            color: #0000FF;
            height: 251px;
        }
        .style4
        {
            width: 24px;
        }
        .style9
        {
            font-family: Arial;
            width: 29px;
        }
        .style10
        {
            color: #000099;
            font-weight: bold;
        }
    </style>
</head>

<p class="style10" style="text-align: center">
    EJEMPLO FORMULARIO DE INGRESO</p>
<p class="style7">
    Este es un ejemplo de como podemos validar un usuario desde la base de datos.</p>
<p class="style7">
    Es un método más seguro que utilizar nombres de usuario y claves en el código, pero la contraseña aún no está 
    encriptada.</p>
<p class="style7">
    &nbsp;</p>
    <form id="form2" runat="server">
    <div>
    
        <table align="center" cellspacing="4" class="style2">
            <tr>
                <td class="style9">
                    <asp:Label ID="Label3" runat="server" style="font-weight: 700" Text="Usuario"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtusuario" runat="server" BorderStyle="Solid" 
                        Font-Names="Arial" Font-Size="11pt" Width="229px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9">
                    <asp:Label ID="Label4" runat="server" style="font-weight: 700" Text="Clave"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txtclave" runat="server" BorderStyle="Solid" 
                        Font-Names="Arial" Font-Size="11pt" TextMode="Password" Width="229px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnvalidar" runat="server" style="font-weight: 700" 
                        Text="Ingresar" Width="208px" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Label ID="lblmensaje" runat="server" 
                        style="font-weight: 700; color: #660033;"></asp:Label>
                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BASEALMACENConnectionString_usuario %>" 
                        SelectCommand="SELECT * FROM [usuario]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
    
    </div>
    </form>

</html>
