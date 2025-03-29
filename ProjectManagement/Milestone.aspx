<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.master" CodeBehind="Milestone.aspx.cs" Inherits="ProjectManagement.Milestone" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <title>Milestone</title>
      <link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="card shadow-lg border-0 rounded-3">
             <!-- Header -->
             <div class="card-header bg-success bg-gradient text-center py-4">
                 <h2 class="text-white fw-bold">Milestones Management</h2>
             </div>
                 <!-- Card Body -->
             <div class="card-body p-4">
                 <div class="table-responsive">
                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1"  CssClass="table table-bordered table-striped table-hover text-center">
                          <Columns>
                              <asp:CommandField  ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" />
                              <asp:CommandField ShowDeleteButton="True"  ControlStyle-CssClass="btn btn-danger" />
                              <asp:BoundField DataField="MILESTONE_ID" HeaderText="MILESTONE_ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                              <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" SortExpression="PROJECT_ID" />
                              <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" SortExpression="USER_ID" />
                              <asp:BoundField DataField="TASK_ID" HeaderText="TASK_ID" SortExpression="TASK_ID" />
                              <asp:BoundField DataField="MILESTONE_NAME" HeaderText="MILESTONE_NAME" SortExpression="MILESTONE_NAME" />
                              <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION" />
                              <asp:BoundField DataField="START_DATE" HeaderText="START_DATE" SortExpression="START_DATE" />
                              <asp:BoundField DataField="DUE_DATE" HeaderText="DUE_DATE" SortExpression="DUE_DATE" />
                              <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                          </Columns>
                     </asp:GridView>
                     </div>
                 </div>
            </div>
  <div class="container mt-4">
      <div class="card shadow border-0 rounded-3">
          <div class="card-header bg-primary text-white text-center">
              <h4>Milestone Form</h4>
          </div>
          <div class="card-body">
              <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1">
                    <EditItemTemplate>
                        MILESTONE_ID:
                        <asp:Label ID="MILESTONE_IDLabel1" runat="server" Text='<%# Eval("MILESTONE_ID") %>' />
                        <br />
                        PROJECT_ID:
                        <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' />
                        <br />
                        USER_ID:
                        <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' />
                        <br />
                        TASK_ID:
                        <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' />
                        <br />
                        MILESTONE_NAME:
                        <asp:TextBox ID="MILESTONE_NAMETextBox" runat="server" Text='<%# Bind("MILESTONE_NAME") %>' />
                        <br />
                        DESCRIPTION:
                        <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>' />
                        <br />
                        START_DATE:
                        <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE") %>' />
                        <br />
                        DUE_DATE:
                        <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE") %>' />
                        <br />
                        STATUS:
                        <asp:TextBox ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        MILESTONE_ID:
                        <asp:TextBox ID="MILESTONE_IDTextBox" runat="server" Text='<%# Bind("MILESTONE_ID") %>' CssClass="form-control" />
                        <br />
                        PROJECT_ID:
                        <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' CssClass="form-control" />
                        <br />
                        USER_ID:
                        <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' CssClass="form-control" />
                        <br />
                        TASK_ID:
                        <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' CssClass="form-control" />
                        <br />
                        MILESTONE_NAME:
                        <asp:TextBox ID="MILESTONE_NAMETextBox" runat="server" Text='<%# Bind("MILESTONE_NAME") %>' CssClass="form-control" />
                        <br />
                        DESCRIPTION:
                        <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>' CssClass="form-control" />
                        <br />
                        START_DATE:
                        <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE") %>' CssClass="form-control" />
                        <br />
                        DUE_DATE:
                        <asp:TextBox ID="DUE_DATETextBox" runat="server" Text='<%# Bind("DUE_DATE") %>' CssClass="form-control" />
                        <br />
                        STATUS:
                        <asp:TextBox ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>' CssClass="form-control" />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert"  CssClass="btn btn-success" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"  CssClass="btn btn-danger" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-outline-primary" />
                    </ItemTemplate>
                </asp:FormView>
              </div>
          </div>
      </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MILESTONE&quot; WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID" InsertCommand="INSERT INTO &quot;MILESTONE&quot; (&quot;MILESTONE_ID&quot;, &quot;PROJECT_ID&quot;, &quot;USER_ID&quot;, &quot;TASK_ID&quot;, &quot;MILESTONE_NAME&quot;, &quot;DESCRIPTION&quot;, &quot;START_DATE&quot;, &quot;DUE_DATE&quot;, &quot;STATUS&quot;) VALUES (:MILESTONE_ID, :PROJECT_ID, :USER_ID, :TASK_ID, :MILESTONE_NAME, :DESCRIPTION, :START_DATE, :DUE_DATE, :STATUS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;MILESTONE&quot;" UpdateCommand="UPDATE &quot;MILESTONE&quot; SET &quot;PROJECT_ID&quot; = :PROJECT_ID, &quot;USER_ID&quot; = :USER_ID, &quot;TASK_ID&quot; = :TASK_ID, &quot;MILESTONE_NAME&quot; = :MILESTONE_NAME, &quot;DESCRIPTION&quot; = :DESCRIPTION, &quot;START_DATE&quot; = :START_DATE, &quot;DUE_DATE&quot; = :DUE_DATE, &quot;STATUS&quot; = :STATUS WHERE &quot;MILESTONE_ID&quot; = :MILESTONE_ID">
                <DeleteParameters>
                    <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                    <asp:Parameter Name="USER_ID" Type="Decimal" />
                    <asp:Parameter Name="TASK_ID" Type="Decimal" />
                    <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                    <asp:Parameter Name="DESCRIPTION" Type="String" />
                    <asp:Parameter Name="START_DATE" Type="DateTime" />
                    <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                    <asp:Parameter Name="STATUS" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                    <asp:Parameter Name="USER_ID" Type="Decimal" />
                    <asp:Parameter Name="TASK_ID" Type="Decimal" />
                    <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                    <asp:Parameter Name="DESCRIPTION" Type="String" />
                    <asp:Parameter Name="START_DATE" Type="DateTime" />
                    <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                    <asp:Parameter Name="STATUS" Type="String" />
                    <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
</asp:Content>
