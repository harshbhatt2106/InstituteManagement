<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/Attendance.Master" AutoEventWireup="true" CodeBehind="TakeAttendance.aspx.cs" Inherits="InstituteManagement.Attendance.TakeAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Css/TakeAttendance.css" rel="stylesheet" />
    <div class="container">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
            <ContentTemplate>
                <asp:Label ID="TakeAttendanceLable" runat="server" CssClass="TakeAttendanceLable" Text="Take Attendance"></asp:Label>
                <img src="../Image/TakeAttendance.png" class="image" />
                <label for="inp" class="input-container">
                    <asp:TextBox ID="AttendanceDate" EnableViewState="true" AutoEventWireup="true" runat="server" TextMode="Date" placeholder="&nbsp;" CssClass="input" required="required">
                    </asp:TextBox>
                    <span class="label">Select Date</span>
                </label>
                <asp:DropDownList ID="SelectClass" runat="server" CssClass="SelectClass" required="required">
                </asp:DropDownList>
                <asp:Button ID="ShowStudent" runat="server" CssClass="button" OnClick="ShowStudent_Click" Text="Show Student" />

                <asp:GridView ID="AttendanceGridview" runat="server"  OnRowDataBound="AttendanceGridview_RowDataBound" Visible="false" CssClass="AttendanceGridview" AutoGenerateColumns="False">

                    <Columns>
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                        <asp:BoundField DataField="UserId" HeaderStyle-CssClass="userid" ItemStyle-CssClass="userid" />

                        <asp:TemplateField HeaderText="Present">
                            <ItemTemplate>
                                <asp:RadioButton ID="Present" AutoPostBack="true" OnCheckedChanged="Present_CheckedChanged" Checked="true" runat="server" GroupName="Attendance" CssClass="radiobutton" />
                            </ItemTemplate>
                            <ControlStyle CssClass="iteamtemplate" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Absent">
                            <ItemTemplate>
                                <asp:RadioButton ID="Absent" runat="server" OnCheckedChanged="Absent_CheckedChanged" CssClass="radiobutton" AutoPostBack="true" GroupName="Attendance" />
                            </ItemTemplate>
                            <ControlStyle CssClass="iteamtemplate" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Comments">
                            <ItemTemplate>
                                <asp:TextBox ID="Reason" runat="server" placeholder="Enter Reson" CssClass="Comment" Visible="false"></asp:TextBox>
                            </ItemTemplate>
                            <ControlStyle CssClass="iteamtemplate" />
                        </asp:TemplateField>

                    </Columns>
                    <HeaderStyle CssClass="header" />
                </asp:GridView>
                <asp:Button ID="Takeattendance" runat="server" CssClass="button2" OnClick="Takeattendance_Click" Text="Take Attendance" Visible="false" />
                <asp:Label ID="SuccessMessage" runat="server" Visible="false" CssClass="successMessage" ForeColor="Green"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
