<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactDisplay.aspx.cs" Inherits="SportsPro.Administration.ContactDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <div class="row">
            <div class="col-lg-6">
                <asp:ListBox ID="lstCart" runat="server" Height="81px" Width="365px"></asp:ListBox>
           </div>
            
            <div class="col-sm-6">
                <asp:Button ID="btnRemoveContact" cssClass="col-lg-6 btn-primary" runat="server" OnClick="btnRemoveContact_Click" Text="Remove Contact" />
                <asp:Button ID="btnEmptyList" cssClass="col-lg-6 btn-primary" runat="server" OnClick="btnEmptyList_Click" Text="Empty List" />
            </div>
        </div>
       
        <asp:Button ID="btnSelectAdditionalCustomers" CssClass="btn-primary" runat="server" OnClick="btnSelectAdditionalCustomers_Click" Text="Select Additional Customers" />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
</asp:Content>
