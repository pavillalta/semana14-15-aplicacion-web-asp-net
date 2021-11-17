<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="agregar_usuario.aspx.cs" Inherits="Agregar_agregar_usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

<br><br><br>
    <table align="center" class="style51" 
        style="border-color: #CCFFFF; background-color: #CCFFFF">
        <tr>
            <td colspan="2">
        <span class="style14" style="text-align: center">REGISTRO DE NUEVOS USUARIOS</span></td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                <br />
                    Nombre de Usuario<br />
                    <asp:TextBox ID="txtusuario" runat="server" BorderColor="#999999" 
                        BorderStyle="Solid" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033" 
                        style="text-align: left" Width="193px"></asp:TextBox>
                <br />
            </td>
            <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="validanombre" runat="server" 
                        ControlToValidate="txtusuario" CssClass="style44" 
                        ErrorMessage="Escriba un nombre de usuario" style="text-align: left"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                <br />
                Tipo de Usuario<br />
                    <asp:DropDownList ID="lsttipo" runat="server">
                        <asp:ListItem Selected="True" Value="1">Administrador</asp:ListItem>
                        <asp:ListItem Value="2">Empleado</asp:ListItem>
                        <asp:ListItem Value="3">Cliente</asp:ListItem>
                    </asp:DropDownList>
                    </td>
            <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="validacorreo" runat="server" 
                        ControlToValidate="lsttipo" 
                        ErrorMessage="Seleccione el tipo de usuario" style="color: #CC3300" 
                        CssClass="style45"></asp:RequiredFieldValidator>
                    </td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                <br />
                Clave<br />
                    <asp:TextBox ID="txtclave" runat="server" BorderColor="#999999" 
                        BorderStyle="Solid" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033" 
                        style="text-align: left" TextMode="Password" Width="197px"></asp:TextBox>
                </td>
            <td style="text-align: left" class="style53">
                    <asp:RequiredFieldValidator ID="validaclave" runat="server" 
                        ControlToValidate="txtclave" CssClass="style45" ErrorMessage="Escriba una clave" 
                        style="text-align: left"></asp:RequiredFieldValidator>
                    <br class="style45" />
                    <asp:CustomValidator ID="validaclave2" runat="server" 
                        ClientValidationFunction="validaclave.js" ControlToValidate="txtclave" 
                        CssClass="style45" ErrorMessage="La clave es muy corta" 
                        style="text-align: left"></asp:CustomValidator>
                    </td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                <br />
                Confirme su Clave<br />
                    <asp:TextBox ID="txtclave2" runat="server" BorderColor="#999999" 
                        BorderStyle="Solid" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033" 
                        style="text-align: left" TextMode="Password" Width="197px"></asp:TextBox>
                <br />
                <br />
            </td>
            <td style="text-align: left">
                    <asp:CompareValidator ID="validaclave3" runat="server" 
                        ControlToCompare="txtclave" ControlToValidate="txtclave2" CssClass="style44" 
                        ErrorMessage="Las claves no son iguales"></asp:CompareValidator>
                </td>
        </tr>
        <tr>
            <td colspan="2">
                    <asp:Button ID="btnagregar" runat="server" Font-Bold="True" 
                        style="text-align: center" Text="Registrar usuario" Width="204px" />
                    </td>
        </tr>
        <tr>
            <td colspan="2">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BASEALMACENConnectionString %>" 
                        SelectCommand="SELECT * FROM [usuario]"></asp:SqlDataSource>
                </td>
        </tr>
        <tr>
            <td colspan="2">
                    <asp:Label ID="lblmensaje" runat="server" 
                        style="font-size: medium; color: #000000" 
                        Text="Complete la información de registro"></asp:Label>
                </td>
        </tr>
    </table>
    
<br />
</asp:Content>

