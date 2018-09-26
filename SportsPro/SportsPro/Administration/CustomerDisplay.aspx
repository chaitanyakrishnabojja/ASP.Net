<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerDisplay.aspx.cs" Inherits="SportsPro.Administration.CustomerDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <div class="form-group">
                        
                        <div class="row">
                            <label class="control-label col-lg-3" for="ddlCustomer">&nbsp;&nbsp;&nbsp; Select a Customer:</label>
                            
                            <asp:DropDownList cssClass="form-control auto-style1 col-lg-8 col-md-8 col-sm-12" ID="ddlCustomer" runat="server" AutoPostBack="True"  DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerID" Height="35px" style="top: 2px; width: 97%" OnSelectedIndexChanged="ddlCustomer_SelectedIndexChanged1" >
                            </asp:DropDownList>
                         </div>
                          
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
                



            <div class="form-group">
                <label class="control-label col-lg-3" for="lblAddress">Address:</label>&nbsp;&nbsp;&nbsp;
                
                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                
            </div>

            <div class="form-group">
                <label class="control-label col-lg-3" for="lblPhone">Phone:</label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblPhone" runat="server"></asp:Label>
                
            </div>

            <div class="form-group">
                <label class="control-label col-lg-3" for="lblEmail">Email:</label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblEmail" runat="server"></asp:Label>
                
            </div>

            <div class ="row">
                   <div class="col-lg-6">
                        <asp:Button ID="btnAddToContactList" cssClass="btn-primary col-lg-4" runat="server" OnClick="btnAddToContactList_Click" Text="Add to Contact List" />
                  </div>

                  <div class="col-lg-6">
                        <asp:Button ID="btnDisplayContactList" cssClass="btn-primary col-lg-4" runat="server" Text="Display Contact List" OnClick="btnDisplayContactList_Click" />
                  </div>

             </div>
</asp:Content>
