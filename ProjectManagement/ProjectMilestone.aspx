<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.master" CodeBehind="ProjectMilestone.aspx.cs" Inherits="ProjectManagement.ProjectMilestone" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <title>Project Milestone</title>
      <link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" CssClass="ms-3 shadow-sm border border-secondary rounded-3 p-2 bg-light">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECT&quot; WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID" InsertCommand="INSERT INTO &quot;PROJECT&quot; (&quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot;) VALUES (:PROJECT_ID, :PROJECT_NAME)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECT&quot;" UpdateCommand="UPDATE &quot;PROJECT&quot; SET &quot;PROJECT_NAME&quot; = :PROJECT_NAME WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID">
                <DeleteParameters>
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                    <asp:Parameter Name="PROJECT_NAME" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PROJECT_NAME" Type="String" />
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            </div>
               <div class="container mt-5">
                    <div class="card shadow-lg border-0 rounded-3">
                         <!-- Header -->
                         <div class="card-header bg-success bg-gradient text-center py-4">
                             <h2 class="text-white fw-bold">Project Milestones</h2>
                         </div>
                             <!-- Card Body -->
                         <div class="card-body p-4">
                             <div class="table-responsive">
                                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID,MILESTONE_ID" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-hover text-center">
                                          <HeaderStyle CssClass="bg-dark text-white" />
                                          <Columns>
                                              <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                                              <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT_NAME" SortExpression="PROJECT_NAME" />
                                              <asp:BoundField DataField="PROJECT_START_DATE" HeaderText="PROJECT_START_DATE" SortExpression="PROJECT_START_DATE" />
                                              <asp:BoundField DataField="PROJECT_DUE_DATE" HeaderText="PROJECT_DUE_DATE" SortExpression="PROJECT_DUE_DATE" />
                                              <asp:BoundField DataField="PROJECT_STATUS" HeaderText="PROJECT_STATUS" SortExpression="PROJECT_STATUS" />
                                              <asp:BoundField DataField="MILESTONE_ID" HeaderText="MILESTONE_ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                                              <asp:BoundField DataField="MILESTONE_NAME" HeaderText="MILESTONE_NAME" SortExpression="MILESTONE_NAME" />
                                          </Columns>
                                  </asp:GridView>
                             </div>
                         </div>
                    </div>
               </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select p.PROJECT_ID,p.PROJECT_NAME,p.PROJECT_START_DATE,p.PROJECT_DUE_DATE,p.PROJECT_STATUS,m.MILESTONE_ID,m.MILESTONE_NAME from milestone m Join project p on m.project_id = p.project_id join project pr on p.project_id = pr.project_id where p.project_id = :project">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="project" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Content>
