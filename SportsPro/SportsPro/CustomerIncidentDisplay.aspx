<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerIncidentDisplay.aspx.cs" Inherits="SportsPro.CustomerIncidentDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <div class="form-group col-sm-12">
        <div class="col-sm-4">
            <asp:Label ID="lblSelectACustomer" runat="server" Text="Select a Customer:"></asp:Label>
        </div>
        <div class="col-sm-8">
            <asp:DropDownList ID="ddlSelectACustomer" CssClass="col-sm-8 form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [CustomerID], [Name] FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
        </div>
    </div>

    <div class="form-group col-sm-12">
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" CssClass="table table-bordered table-striped table-condensed" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" GridLines="Both">
            <FooterStyle BackColor="#CCCCCC"></FooterStyle>

            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>
            <HeaderTemplate>
                <span class="col-xs-3">Product/Incident</span>
                <span class="col-xs-3">Tech name</span>
                <span class="col-xs-3">Opened</span>
                <span class="col-xs-3">Closed</span>
            </HeaderTemplate>
            <ItemStyle BackColor="White"></ItemStyle>
            <ItemTemplate>
                <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" CssClass="col-xs-3" />

                <asp:Label Text='<%# Eval("Expr1") %>' runat="server" ID="Expr1Label" CssClass="col-xs-3" />



                <asp:Label Text='<%# Eval("DateOpened", "{0:d}") %>' runat="server" ID="DateOpenedLabel" CssClass="col-xs-3" />

                <asp:Label Text='<%# Eval("DateClosed", "{0:d}") %>' runat="server" ID="DateClosedLabel" CssClass="col-xs-3" /><br />

                <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" CssClass="col-xs-12" /><br />

            </ItemTemplate>
            <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedItemStyle>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT Products.Name, Technicians.Name AS Expr1, Incidents.Description, Incidents.DateOpened, Incidents.DateClosed FROM Incidents INNER JOIN Technicians ON Incidents.TechID = Technicians.TechID INNER JOIN Products ON Incidents.ProductCode = Products.ProductCode WHERE (Incidents.CustomerID = @CustomerID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSelectACustomer" PropertyName="SelectedValue" Name="CustomerID"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>


   
   
</asp:Content>
