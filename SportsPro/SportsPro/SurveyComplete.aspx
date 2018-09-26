<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SurveyComplete.aspx.cs" Inherits="SportsPro.SurveyComplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <table class="w-100">
            <tr>
                <td>
                    <asp:Label ID="lblThanks" runat="server" CssClass="text-info" Font-Size="XX-Large" Text="Thank you for your feedback!"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMessage" runat="server" CssClass="text-info" Font-Size="X-Large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="brnReturnToSurvey" runat="server" CssClass="btn-primary" PostBackUrl="/CustomerSurvey" Text="Return to Survey" />
                </td>
            </tr>
        </table>
</asp:Content>
