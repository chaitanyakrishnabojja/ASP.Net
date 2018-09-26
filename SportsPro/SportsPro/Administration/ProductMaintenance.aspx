<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductMaintenance.aspx.cs" Inherits="SportsPro.Administration.ProductMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="server">

    <div class="col-xs-12 table-responsive">

        <asp:GridView ID="GridView1" CssClass="table table-bordered table-condensed" runat="server" DataKeyNames="ProductCode" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                    OnPreRender="GridView1_PreRender" 
                    OnRowDeleted="GridView1_RowDeleted" 
                    OnRowUpdated="GridView1_RowUpdated">
            
            <Columns>                
                <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" ReadOnly="True" SortExpression="ProductCode" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White"></asp:BoundField>
                
                <asp:TemplateField HeaderText="Name" SortExpression="Name" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("Name") %>' ID="txtName"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                            ValidationGroup="Edit"
                            ErrorMessage="Name is a required field" Text="*"
                            CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("Name") %>' ID="lblName"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Version" SortExpression="Version" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Black">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("Version") %>' ID="txtVersion"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvVersion" runat="server" ControlToValidate="txtVersion"
                            ValidationGroup="Edit"
                            ErrorMessage="Version is a required field" Text="*"
                            CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvVersion" Display="Dynamic" runat="server" ValidationGroup="Edit" ErrorMessage="Version must be a number" ControlToValidate="txtVersion" Text="*" CssClass="text-danger" Type="Double" ViewStateMode="Inherit" Operator="DataTypeCheck"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("Version") %>' ID="lblVersion"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ReleaseDate" SortExpression="ReleaseDate" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("ReleaseDate", "{0:d}") %>' ID="txtReleaseDate"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regexpReleaseDate" runat="server" ControlToValidate="txtReleaseDate" ErrorMessage="ReleaseDate must be in MM/DD/YYYY format"
                            Text="*"  ValidationGroup="Edit" CssClass="text-danger" Display="Dynamic" ValidationExpression="^((0|1)?\d{1})/(0|1|2)?\d{1}/\d{4}"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvReleaseDate" runat="server" ControlToValidate="txtReleaseDate"
                            ValidationGroup="Edit"
                            ErrorMessage="ReleaseDate is a required field" Text="*"
                            CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        
                        <%--<asp:CompareValidator ID="cvReleaseDate" Display="Dynamic" runat="server" ValidationGroup="Edit" ErrorMessage="ReleaseDate must be in MM/DD/YYYY format" ControlToValidate="txtReleaseDate" Text="*" CssClass="text-danger" Type="Date" ViewStateMode="Inherit" Operator="DataTypeCheck"></asp:CompareValidator>--%>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("ReleaseDate", "{0:d}") %>' ID="lblReleaseDate"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:CommandField CausesValidation="True" ShowEditButton="True" ValidationGroup="Edit" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White"></asp:CommandField>
                <asp:CommandField CausesValidation="False" ShowDeleteButton="True" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Black"></asp:CommandField>

            </Columns>
                    
                    
        </asp:GridView>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Validation Summary" ValidationGroup="Edit" CssClass="text-danger" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate" InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (@ProductCode, @Name, @Version, @ReleaseDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ProductCode], [Name], [Version], [ReleaseDate] FROM [Products] ORDER BY [ProductCode]" UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Version] = @Version, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate">
            <DeleteParameters>
                <asp:Parameter Name="original_ProductCode" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Version" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="original_ReleaseDate" Type="DateTime"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductCode" Type="String"></asp:Parameter>
                <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="Version" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="ReleaseDate" Type="DateTime"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="Version" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="ReleaseDate" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="original_ProductCode" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Version" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="original_ReleaseDate" Type="DateTime"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <div class="col-xs-12">
                <p>To add a new product, enter the product information and click Add Product</p>
                <p><asp:Label ID="lblError" runat="server" EnableViewState="false" 
                        CssClass="text-danger"></asp:Label></p>
    </div>
                <div class="form-group col-sm-12">
                    <label for="txtProductCodeAdd" class="col-sm-2">Product Code:</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtProductCodeAdd" runat="server" MaxLength="10" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-offset-1 col-sm-4">
                            <asp:RequiredFieldValidator ID="rfvProductCodeAdd" runat="server" 
                                ControlToValidate="txtProductCodeAdd" CssClass="text-danger" 
                                ErrorMessage="ProductCode is a required field" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group col-sm-12">
                    <label for="txtNameAdd" class="col-sm-2">Name:</label>
                    <div class="col-sm-5">
                        <asp:TextBox ID="txtNameAdd" runat="server" MaxLength="15" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-offset-1 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvNameAdd" runat="server" 
                        ControlToValidate="txtNameAdd" CssClass="text-danger" 
                        ErrorMessage="Name is a required field" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>              
                <div class="form-group col-sm-12">
                    <label for="txtVersionAdd" class="col-sm-2">Version:</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtVersionAdd" runat="server" 
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-offset-1 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvVersionAdd" runat="server" 
                        ControlToValidate="txtVersionAdd" CssClass="text-danger" 
                        ErrorMessage="Version is a required field" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvVersionAdd" Display="Dynamic" runat="server" ErrorMessage="Version must be a number" ControlToValidate="txtVersionAdd" Text="Version must be a number" CssClass="text-danger" Type="Double" ViewStateMode="Inherit" Operator="DataTypeCheck"></asp:CompareValidator>
                    </div>
                </div>

               <div class="form-group col-sm-12">
                    <label for="txtReleaseDate" class="col-sm-2">Release Date:</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtReleaseDateAdd" runat="server" 
                            CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="col-sm-offset-1 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvReleaseDateAdd" runat="server" 
                        ControlToValidate="txtReleaseDateAdd" CssClass="text-danger" 
                        ErrorMessage="ReleaseDate is a required field" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvReleaseDateAdd" Display="Dynamic" runat="server" ErrorMessage="ReleaseDate must be  in MM/DD/YYYY format" ControlToValidate="txtReleaseDateAdd" Text="ReleaseDate must be in MM/DD/YYYY format" CssClass="text-danger" Type="Date" ViewStateMode="Inherit" Operator="DataTypeCheck"></asp:CompareValidator>
                    </div>
                </div>
                <div class="col-sm-12">
                    <asp:Button ID="btnAdd" cssClass="col-sm-offset-2 col-sm-3 btn btn-primary" runat="server" Text="Add Product" 
                  OnClick="btnAdd_Click" />
                </div>
                
             


</asp:Content>
