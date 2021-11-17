<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="listado.aspx.cs" Inherits="semana14_15_aplicacion_web_asp_net.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
    &nbsp;</p>
<p>
    <br />
    LISTADO DE USUARIOS</p>
<p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="iddepartamento" HeaderText="iddepartamento" SortExpression="iddepartamento" />
            <asp:BoundField DataField="nombre_departamento" HeaderText="nombre_departamento" SortExpression="nombre_departamento" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pro1_dbConnectionString %>" SelectCommand="SELECT [iddepartamento], [nombre_departamento] FROM [t_departamento]"></asp:SqlDataSource>
</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="iddepartamento" DataValueField="iddepartamento">
        </asp:DropDownList>
</p>
    <p>
        &nbsp;</p>
<p>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource_MUNICIPIOS">
        <Columns>
            <asp:BoundField DataField="idmunicipio" HeaderText="idmunicipio" SortExpression="idmunicipio" />
            <asp:BoundField DataField="nombre_municipio" HeaderText="nombre_municipio" SortExpression="nombre_municipio" />
            <asp:BoundField DataField="iddepartamento" HeaderText="iddepartamento" SortExpression="iddepartamento" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource_MUNICIPIOS" runat="server" ConnectionString="<%$ ConnectionStrings:pro1_dbConnectionString %>" SelectCommand="SELECT [idmunicipio], [nombre_municipio], [iddepartamento] FROM [t_municipio] WHERE ([iddepartamento] = @iddepartamento2)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="iddepartamento2" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
</asp:Content>
