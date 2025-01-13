<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineExamination/OnlineExamination.Master" AutoEventWireup="true" CodeBehind="MyResult.aspx.cs" Inherits="InstituteManagement.OnlineExamination.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@900&family=Poppins:wght@500&display=swap');

        .exam-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 50px;
            padding: 25px;
            position: relative;
            width: auto;
            margin: 20px;
            text-align: left;
            min-width: 25vh;
        }

            .exam-table td {
                border: 1px solid #ddd;
                padding: 8px;
            }

            .exam-table p {
                margin: 0;
                font-weight: bold;
            }

            .exam-table tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .exam-table tr:hover {
                background-color: #ddd;
            }

        .Resultlable {
            position: relative;
            font-family: 'Playfair Display', serif;
            font-family: 'Poppins', sans-serif;
            font-weight: bold;
            font-size: 40px;
            left: 80vh;
        }
    </style>
    <asp:Label ID="Label1" runat="server" Text="Your Result" CssClass="Resultlable"></asp:Label>
    <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="3">
        <ItemTemplate>
            <table class="exam-table">
                <tr>
                    <td>
                        <p>Exam Title:</p>
                    </td>
                    <td>
                        <asp:Label ID="ExamTitle" runat="server" Text='<%# Eval("ExamTitle") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <p>Total Marks:</p>
                    </td>
                    <td>
                        <asp:Label ID="TotalMark" runat="server" Text='<%# Eval("TotalMark") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <p>Passing Marks:</p>
                    </td>
                    <td>
                        <asp:Label ID="PassingMark" runat="server" Text='<%# Eval("PassingMark") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <p>Mark:</p>
                    </td>
                    <td>
                        <asp:Label ID="Mark" runat="server" Text='<%# Eval("Mark") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <p>Created By:</p>
                    </td>
                    <td>
                        <asp:Label ID="ExamCreatedBy" runat="server" Text='<%# Eval("ExamCreatedBy") %>'></asp:Label></td>

                </tr>
                <tr>
                    <td>
                        <p>TakeDate:</p>
                    </td>
                    <td>
                        <asp:Label ID="Takedate" runat="server" Text='<%# Eval("TakeDate") %>'></asp:Label></td>
                </tr>
            </table>

        </ItemTemplate>
    </asp:DataList>


</asp:Content>
