<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="municipios2.aspx.cs" Inherits="semana14_15_aplicacion_web_asp_net.municipios2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="nombre_departamento" DataValueField="iddepartamento">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pro1_dbConnectionString %>" SelectCommand="SELECT * FROM [t_departamento]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="idmunicipio" HeaderText="idmunicipio" SortExpression="idmunicipio" />
                <asp:BoundField DataField="nombre_municipio" HeaderText="nombre_municipio" SortExpression="nombre_municipio" />
                <asp:BoundField DataField="iddepartamento" HeaderText="iddepartamento" SortExpression="iddepartamento" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pro1_dbConnectionString %>" SelectCommand="SELECT * FROM [t_municipio] WHERE ([iddepartamento] = @iddepartamento)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="14" Name="iddepartamento" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
    </p>
</asp:Content>
