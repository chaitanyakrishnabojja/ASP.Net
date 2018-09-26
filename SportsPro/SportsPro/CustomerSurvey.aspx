<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerSurvey.aspx.cs" Inherits="SportsPro.CustomerSurvey" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" runat="server">
    <div class="form-group row">
                    <div class="col-lg-3">
                        <asp:Label ID="lblEnterYourCustomerID" runat="server" CssClass="col-lg-12" Text="Enter your customer ID:"></asp:Label>
                    </div>                 
                    <div class="col-lg-3">
                         <asp:TextBox ID="txtEnterYourCustomerID" CssClass="col-lg-12" runat="server" ValidationGroup="CustomerID"></asp:TextBox>
                        
                    </div>
                    <div class="col-lg-3">
                        <asp:Button ID="btnGetIncidents" runat="server" CssClass="btn-primary col-lg-12" Text="Get Incidents" CommandName="customerID" OnCommand="validatorsGroup_Command" OnClick="btnGetIncidents_Click" ValidationGroup="CustomerID" />
                    </div>
                    <div class="col-lg-3">

                    </div>
                     
                </div>
                    
                <div class="form-group row col-lg-8">
                    <div class="col-lg-5">

                    </div>
                    <div class="col-lg-6">
                        <asp:Label ID="lblCustomerIDMessage" runat="server" CssClass="text-info text-center"></asp:Label>
                        <asp:RequiredFieldValidator ID="rfvCustomerID" runat="server" ControlToValidate="txtEnterYourCustomerID" CssClass="text-danger text-center" Display="Dynamic" ErrorMessage="Please enter Customer ID" ValidationGroup="CustomerID" SetFocusOnError="True">Please enter Customer ID</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvCustomerID" runat="server" ControlToValidate="txtEnterYourCustomerID" CssClass="text-danger text-center" Display="Dynamic" ErrorMessage="Customer ID must be an integer" Operator="DataTypeCheck" SetFocusOnError="True" Type="Integer" ValidationGroup="CustomerID">CustomerID must be an Integer</asp:CompareValidator>
                    </div>
                    
                    </div>
     <div class="row col-lg-12">
                    <div class="col-lg-9">
                        <asp:ListBox ID="lstIncidents" CssClass="form-control" runat="server"></asp:ListBox>
                    </div>
                     <div class="col-lg-3">

                     </div>
                </div>
        
                   
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Incidents] ORDER BY [CustomerID]"></asp:SqlDataSource>
                  <div class="row col-lg-12">
                      <div class="col-lg-4">

                      </div>
                      <div class="col-lg-8">
                          <asp:RequiredFieldValidator ID="rfvIncidents" runat="server" ControlToValidate="lstIncidents" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please select insident" InitialValue="none" ValidationGroup="Survey">Please select Incident</asp:RequiredFieldValidator>
                      </div>
                      
                  </div>  
                    
           <div class="row col-lg-12">
               <h2><asp:Label ID="lblLongratingsmessage" runat="server" Text="Please rate this incident by the following categories:"></asp:Label></h2>
           </div>  
        
        <div class="row col-lg-12">
            <div class="col-lg-2">
                <asp:Label ID="lblResponseTime" runat="server" Text="Response Time:"></asp:Label>
            </div>
            <div class="col-lg-10">
                <asp:RadioButtonList ID="rdolstResponseTime" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">Not Satisfied</asp:ListItem>
                        <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                        <asp:ListItem Value="3">Satisfied</asp:ListItem>
                        <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>

        <div class="row col-lg-12">
            <div class="col-lg-2">
                <asp:Label ID="lblTechnicianEfficiency" runat="server" Text="Technician Efficiency:"></asp:Label>
            </div>
            <div class="col-lg-10">
                <asp:RadioButtonList ID="rdolstTechnicianEfficiency" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                        <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                        <asp:ListItem Value="3">Satisfied</asp:ListItem>
                        <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                    </asp:RadioButtonList>
            </div>
        </div>

        <div class="row col-lg-12">
            <div class="col-lg-2">
                <asp:Label ID="lblProblemResolution" runat="server" Text="Problem resolution:"></asp:Label>
            </div>
            <div class="col-lg-10">
                <asp:RadioButtonList ID="rdolstProblemResolution" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                        <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                        <asp:ListItem Value="3">Satisfied</asp:ListItem>
                        <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                    </asp:RadioButtonList>
            </div>
        </div>
          
        
        <div class="row col-lg-12">
            <div class="col-lg-2">
                <asp:Label ID="lblAddComments" runat="server" Text="Additional Comments:"></asp:Label>
            </div>
            <div class="col-lg-10">
                <asp:TextBox ID="txtAdditionalComments" runat="server" CssClass="col-lg-8" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>
            
        </div>
                    
              
                
                
        
        
                    
               
        
       <div class="row col-lg-12">
           <asp:CheckBox ID="cbxPleaseContactMeToDiscussThisIncident" runat="server" Text="Please contact me to discuss this incident" />
       </div>
                    
             
       <div class="col-lg-12">
           <asp:RadioButton ID="rdoContactByEmail" runat="server" Text="Contact By Email" GroupName="contact"/>
       </div>
        <div class="col-lg-12">
            <asp:RadioButton ID="rdoContactByPhone" runat="server" Text="Contact by phone" GroupName="contact"/>
        </div>
           
       
                    
                
        <div class="col-lg-12">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CommandName="survey" OnCommand="validatorsGroup_Command" ValidationGroup="Survey" CssClass="btn-primary" OnClick="btnSubmit_Click" />
        </div>
</asp:Content>
