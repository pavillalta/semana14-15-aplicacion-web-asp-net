<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="modificar_empleado.aspx.cs" Inherits="Modificar_modificar_empleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <p>
        &nbsp;</p>
    <asp:SqlDataSource ID="SqlDataSourcePuestos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BASEALMACENConnectionString %>" 
        SelectCommand="SELECT [codigopuesto], [puesto] FROM [puesto]">
    </asp:SqlDataSource>
    <br />
    Seleccione el cargo que desempeña el empleado<br />
    <br />
                    <asp:DropDownList ID="lstpuesto" runat="server" 
                    DataSourceID="SqlDataSourcePuestos" DataTextField="puesto" 
                    DataValueField="codigopuesto" Height="30px" Width="246px" 
        AutoPostBack="True" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033">
                </asp:DropDownList>
            <br />
    <asp:SqlDataSource ID="SqlDataSourceEmpleados" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BASEALMACENConnectionString %>" 
        
        SelectCommand="SELECT [codigo], [nombre], [apellido] FROM [empleado] WHERE ([codigopuesto] = @codigopuesto)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lstpuesto" Name="codigopuesto" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    Seleccione el empleado que desea modificar<br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataKeyNames="codigo" DataSourceID="SqlDataSourceEmpleados" 
        style="font-size: small" Width="373px">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="codigo" HeaderText="codigo" ReadOnly="True" 
                SortExpression="codigo" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" 
                SortExpression="nombre" />
            <asp:BoundField DataField="apellido" HeaderText="apellido" 
                SortExpression="apellido" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <br />
    <br />
    <br />
    <table align="center" class="style51" 
        style="border-color: #CCFFCC; background-color: #CCFFFF">
        <tr>
            <td colspan="2" class="style57">
                MODIFIQUE 
                LOS DATOS DEL EMPLEADO SELECCIONADO</td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                Codigo<br />
                    <asp:TextBox ID="txtcodigo" runat="server" BorderColor="#999999" 
                        BorderStyle="Solid" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033" 
                        style="text-align: left" Width="93px" MaxLength="10" Enabled="False"></asp:TextBox>
            </td>
            <td style="text-align: left" class="style54">
                    <asp:RequiredFieldValidator ID="validacodigo" runat="server" 
                        ControlToValidate="txtcodigo" CssClass="style44" 
                        ErrorMessage="Asigne codigo a empleado" style="text-align: left"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                Nombres<br />
                    <asp:TextBox ID="txtnombres" runat="server" BorderColor="#999999" 
                        BorderStyle="Solid" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033" 
                        style="text-align: left" Width="248px" MaxLength="25" Columns="1"></asp:TextBox>
            </td>
            <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="validanombre" runat="server" 
                        ControlToValidate="txtnombres" CssClass="style44" 
                        ErrorMessage="Escriba nombres" style="text-align: left"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                Apellidos<br />
                    <asp:TextBox ID="txtapellidos" runat="server" BorderColor="#999999" 
                        BorderStyle="Solid" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033" 
                        style="text-align: left" Width="248px" MaxLength="25" Columns="2"></asp:TextBox>
                <br />
                    </td>
            <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="validaapellidos" runat="server" 
                        ControlToValidate="txtapellidos" CssClass="style44" 
                        ErrorMessage="Escriba apellidos" style="text-align: left"></asp:RequiredFieldValidator>
                    </td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                N° dui<br />
                    <asp:TextBox ID="txtdui" runat="server" BorderColor="#999999" 
                        BorderStyle="Solid" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033" 
                        style="text-align: left" Width="130px" MaxLength="9"></asp:TextBox>
                </td>
            <td style="text-align: left" class="style53">
                    <asp:RequiredFieldValidator ID="validadui" runat="server" 
                        ControlToValidate="txtdui" CssClass="style44" 
                        ErrorMessage="Escriba numero de dui" style="text-align: left"></asp:RequiredFieldValidator>
                    <br class="style54" />
                    </td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                N° nit<br />
                    <asp:TextBox ID="txtnit" runat="server" BorderColor="#999999" 
                        BorderStyle="Solid" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033" 
                        style="text-align: left" Width="130px" MaxLength="17"></asp:TextBox>
                <br />
            </td>
            <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="validanit" runat="server" 
                        ControlToValidate="txtnit" CssClass="style44" 
                        ErrorMessage="Escriba numero de nit" style="text-align: left"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                N° afp<br />
                    <asp:TextBox ID="txtafp" runat="server" BorderColor="#999999" 
                        BorderStyle="Solid" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033" 
                        style="text-align: left" Width="130px" MaxLength="12"></asp:TextBox>
                </td>
            <td style="text-align: left" class="style54">
                    <asp:RequiredFieldValidator ID="validaafp" runat="server" 
                        ControlToValidate="txtafp" CssClass="style44" 
                        ErrorMessage="Escriba numero de afp" style="text-align: left"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                N° ISSS<br />
                    <asp:TextBox ID="txtisss" runat="server" BorderColor="#999999" 
                        BorderStyle="Solid" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033" 
                        style="text-align: left" Width="130px" MaxLength="9"></asp:TextBox>
                </td>
            <td style="text-align: left" class="style54">
                    <asp:RequiredFieldValidator ID="validaisss" runat="server" 
                        ControlToValidate="txtisss" CssClass="style44" 
                        ErrorMessage="Escriba numero de seguro social" style="text-align: left"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                N° Telefono<br />
                    <asp:TextBox ID="txttelefono" runat="server" BorderColor="#999999" 
                        BorderStyle="Solid" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033" 
                        style="text-align: left" Width="130px" MaxLength="8"></asp:TextBox>
                </td>
            <td style="text-align: left" class="style54">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style55" style="text-align: left">
                Correo Electronico<br />
                    <asp:TextBox ID="txtcorreo" runat="server" BorderColor="#999999" 
                        BorderStyle="Solid" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033" 
                        style="text-align: left" Width="247px" MaxLength="30"></asp:TextBox>
                </td>
            <td style="text-align: left" class="style56">
                    <asp:RegularExpressionValidator ID="validacorreo" runat="server" 
                        ControlToValidate="txtcorreo" ErrorMessage="Correo no valido" 
                        ForeColor="#CC3300" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                Salario $<br />
                    <asp:TextBox ID="txtsalario" runat="server" BorderColor="#999999" 
                        BorderStyle="Solid" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033" 
                        style="text-align: left" Width="130px"></asp:TextBox>
                </td>
            <td style="text-align: left" class="style54">
                    <asp:RequiredFieldValidator ID="validasalario" runat="server" 
                        ControlToValidate="txtsalario" CssClass="style44" 
                        ErrorMessage="Asigne un salario" style="text-align: left"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RangeValidator ID="validasalario2" runat="server" 
                        ControlToValidate="txtsalario" ErrorMessage="Salario no valido" 
                        MaximumValue="5,000.00" MinimumValue="120.00" style="color: #CC3300"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                Fecha de Contrato (Año-Dia-Mes)<br />
                    <asp:TextBox ID="txtfechacontrato" runat="server" BorderColor="#999999" 
                        BorderStyle="Solid" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033" 
                        style="text-align: left" Width="130px"></asp:TextBox>
                </td>
            <td style="text-align: left" class="style54">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                Cargo Asignado<br />
                    <asp:DropDownList ID="lstpuesto0" runat="server" 
                    DataSourceID="SqlDataSourcePuestos" DataTextField="puesto" 
                    DataValueField="codigopuesto" Height="30px" Width="246px" 
                    Font-Names="Arial" Font-Size="12pt" ForeColor="#660033">
                </asp:DropDownList>
            </td>
            <td style="text-align: left" class="style54">
                    <asp:RequiredFieldValidator ID="validapuesto" runat="server" 
                        ControlToValidate="lstpuesto" CssClass="style44" 
                        ErrorMessage="Asigne un cargo" style="text-align: left"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                Direccion de Domicilio<br />
                    <asp:TextBox ID="txtdireccion" runat="server" BorderColor="#999999" 
                        BorderStyle="Solid" Font-Names="Arial" Font-Size="12pt" ForeColor="#660033" 
                        style="text-align: left" TextMode="MultiLine" Width="245px" 
                    Height="73px" MaxLength="100"></asp:TextBox>
                </td>
            <td style="text-align: left" class="style54">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" style="text-align: left">
                &nbsp;</td>
            <td style="text-align: left">
                    &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                    <asp:Button ID="btnguardar" runat="server" Font-Bold="True" 
                        style="text-align: center" Text="Guardar Cambios" Width="204px" />
                    </td>
        </tr>
        <tr>
            <td colspan="2">
                    <asp:SqlDataSource ID="SqlDataSource_empleado" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BASEALMACENConnectionString %>" 
                        SelectCommand="SELECT * FROM [empleado] WHERE ([codigo] = @codigo)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="codigo" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                </td>
        </tr>
        <tr>
            <td colspan="2">
                    <asp:Label ID="lblmensaje" runat="server" 
                        style="font-size: medium; color: #000000" 
                        Text="Realice los cambios necesarios"></asp:Label>
                </td>
        </tr>
    </table>
    
    <br />
    <br />
</asp:Content>

