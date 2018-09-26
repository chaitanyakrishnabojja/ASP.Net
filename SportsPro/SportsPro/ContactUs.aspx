<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="SportsPro.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <h3>How to contact us</h3>
    <h5>If you have any questions or comments about our products,
        <br />please be sure to contact us in whatever way is most convinient for you.
    </h5>
    <div class="row">
        <div class="col-lg-2">
            <h5>Phone:</h5>
        </div>
        <div class="col-lg-6">
            <h5>1-800-555-0400<br/>Weekends, 8 to 5 Pacific Time</h5>
        </div>
        <div class="col-lg-4"></div>
    </div>

    <div class="row">
        <div class="col-lg-2">
            <h5>E-mail:</h5>
        </div>
        <div class="col-lg-6">
            <h5><asp:HyperLink ID="hlinkEmail" runat="server" NavigateUrl="mailto:sportspro@sportsprosoftware.com">sportspro@sportsprosoftware.com</asp:HyperLink></h5>
        </div>
        <div class="col-lg-4"></div>
    </div>

    <div class="row">
        <div class="col-lg-2">
            <h5>Fax:</h5>
        </div>
        <div class="col-lg-6">
            <h5>1-559-555-2732</h5>
        </div>
        <div class="col-lg-4"></div>
    </div>

    <div class="row">
        <div class="col-lg-2">
            <h5>Address:</h5>
        </div>
        <div class="col-lg-6">
            <h5>SportsPro Software, Inc.<br/>1500 N Main Street<br/>Fresno, California 93710</h5>
        </div>
        <div class="col-lg-4"></div>
    </div>
</asp:Content>
