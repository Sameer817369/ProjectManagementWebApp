<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.master" CodeBehind="HomePage.aspx.cs" Inherits="ProjectManagement.HomePage" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <title>Home Page</title>
      <link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">     
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT user_id, username, user_email, user_contact, task_completed
FROM (
    SELECT 
        u.user_id, 
        u.username, 
        u.user_email, 
        u.user_contact, 
        COUNT(upt.task_id) AS task_completed
    FROM users u
    JOIN userprojcettasks upt ON u.user_id = upt.user_id
    JOIN task t ON upt.task_id = t.task_id
    WHERE t.status = 'Completed'
    GROUP BY u.user_id, u.username, u.user_email, u.user_contact
    ORDER BY task_completed DESC
) 
WHERE ROWNUM &lt;= 5">
        </asp:SqlDataSource>
        <div class="container mt-4 pb-3">
            <div class="card mb-4">
                <div class="card-header bg-primary text-white">
                    Top 5 User With Most Task Complete
                </div>
                <div class="card-body">
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="1000px">
                         <Series>
                             <asp:Series Name="Series1" XValueMember="username" YValueMembers="task_completed">
                             </asp:Series>
                         </Series>
                         <ChartAreas>
                             <asp:ChartArea Name="ChartArea1">
                             </asp:ChartArea>
                         </ChartAreas>
                    </asp:Chart>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select project_name, project_due_date from project where project_status = 'Active'"></asp:SqlDataSource>
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="card pb-1">
                        <div class="card-header bg-success text-white">
                            Active Projects
                        </div>
                        <div class="card-body">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table table-bordered table-striped">
                                <Columns>
                                    <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT_NAME" SortExpression="PROJECT_NAME" />
                                    <asp:BoundField DataField="PROJECT_DUE_DATE" HeaderText="PROJECT_DUE_DATE" SortExpression="PROJECT_DUE_DATE" />
                                </Columns>
                           </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4">
                        <div class="card pb-1">
                            <div class="card-header bg-warning text-white">
                                Upcoming Projects
                            </div>
                            <div class="card-body">
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" CssClass="table table-bordered table-striped">
                                    <Columns>
                                        <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT_NAME" SortExpression="PROJECT_NAME" />
                                        <asp:BoundField DataField="PROJECT_START_DATE" HeaderText="PROJECT_START_DATE" SortExpression="PROJECT_START_DATE" />
                                    </Columns>
                                </asp:GridView>
                           </div>
                      </div>
                  </div>
          </div>
      </div>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select project_name, project_start_date from project where project_status= 'Upcoming'"></asp:SqlDataSource>          
</asp:Content>

