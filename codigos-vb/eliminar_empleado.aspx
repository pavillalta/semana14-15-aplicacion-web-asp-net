<%@ Page Title="" Language="VB" MasterPageFile="~/index.master" AutoEventWireup="false" CodeFile="eliminar_empleado.aspx.vb" Inherits="Agregar_eliminar_empleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style57
        {
            text-align: center;
            font-family: Arial;
            font-weight: bold;
            font-size: medium;
        }
        .style52
        {
        }
    
        .style54
        {
            font-size: small;
        }
            
        .style44
        {
            height: 128px;
            text-align: center;
            width: 14%;
            font-size: small;
            color: #CC3300;
        }
        
        .style51
        {
            width: 90%;
            border-style: solid;
            border-width: 1px;
            background-color: #CCFF66;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
    </p>
    <table align="center" class="style51" 
        style="border-color: #CCFFCC; background-color: #CCFFFF">
        <tr>
            <td colspan="2" class="style57">
                ELIMINAR EMPLEADO</td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                Codigo del empleado<br />
                    <asp:TextBox ID="txtcodigo" runat="server" BorderColor="#999999" 
                        BorderStyle="Solid" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033" 
                        style="text-align: left" Width="111px" MaxLength="10"></asp:TextBox>
            </td>
            <td style="text-align: left" class="style54">
                    <asp:RequiredFieldValidator ID="validacodigo" runat="server" 
                        ControlToValidate="txtcodigo" CssClass="style44" 
                        ErrorMessage="Ingrese el codigo" style="text-align: left"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left" colspan="2">
                    <asp:SqlDataSource ID="SqlDataSource_empleados" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BASEALMACENConnectionString2 %>" 
                        SelectCommand="SELECT * FROM [empleado]" 
                    ProviderName="<%$ ConnectionStrings:BASEALMACENConnectionString2.ProviderName %>"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style52" style="text-align: center" colspan="2">
                    <asp:Button ID="btnagregar" runat="server" Font-Bold="True" 
                        style="text-align: center" Text="Eliminar  Empleado" Width="204px" />
                    <br />
                <br />
                    <asp:Label ID="lblmensaje" runat="server" 
                        style="font-size: medium; color: #000000" 
                        Text="Ingrese codigo a eliminar"></asp:Label>
                <br />
                    <br />
            </td>
        </tr>
    </table>
    
</asp:Content>

