<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/Attendance.Master" AutoEventWireup="true" CodeBehind="ViewMyAttendance.aspx.cs" Inherits="InstituteManagement.Attendance.ViewMyAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@900&family=Poppins:wght@500&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
        }

        .button {
            bottom: 25vh;
            left: 61vh;
            align-items: center;
            appearance: none;
            background-color: #24a0ed;
            border-radius: 24px;
            border-style: none;
            box-shadow: rgba(0, 0, 0, .2) 0 3px 5px -1px,rgba(0, 0, 0, .14) 0 6px 10px 0,rgba(0, 0, 0, .12) 0 1px 18px 0;
            box-sizing: border-box;
            color: white;
            cursor: pointer;
            display: inline-flex;
            fill: currentcolor;
            font-family: "Google Sans",Roboto,Arial,sans-serif;
            font-size: 14px;
            font-weight: 500;
            height: 48px;
            justify-content: center;
            letter-spacing: .25px;
            line-height: normal;
            max-width: 100%;
            overflow: visible;
            padding: 2px 24px;
            position: relative;
            text-align: center;
            text-transform: none;
            transition: box-shadow 280ms cubic-bezier(.4, 0, .2, 1),opacity 15ms linear 30ms,transform 270ms cubic-bezier(0, 0, .2, 1) 0ms;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            width: auto;
            will-change: transform,opacity;
            z-index: 0;
            width: 200px;
        }

            .button:hover {
                background: #F6F9FE;
                color: #174ea6;
            }

            .button:active {
                box-shadow: 0 4px 4px 0 rgb(60 64 67 / 30%), 0 8px 12px 6px rgb(60 64 67 / 15%);
                outline: none;
            }

            .button:focus {
                outline: none;
                border: 2px solid #4285f4;
            }

            .button:not(:disabled) {
                box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
            }

                .button:not(:disabled):hover {
                    box-shadow: rgba(60, 64, 67, .3) 0 2px 3px 0, rgba(60, 64, 67, .15) 0 6px 10px 4px;
                }

                .button:not(:disabled):focus {
                    box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
                }

                .button:not(:disabled):active {
                    box-shadow: rgba(60, 64, 67, .3) 0 4px 4px 0, rgba(60, 64, 67, .15) 0 8px 12px 6px;
                }

            .button:disabled {
                box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
            }

        .ViewmyAttendance {
            position: absolute;
            top: 15vh;
            transform: translateX(35vh);
            font-size: 4vh;
            font-weight: bolder;
        }

        .container img {
            position: relative;
            right: 50px;
        }


        .container {
            width: auto;
            max-width: 700px;
            padding: 20px;
            margin: 20px auto;
            background-color: #ecf0f3;
            box-shadow: 10px 10px 10px #d1d9e6, -10px -10px 10px #f9f9f9;
            border-radius: 12px;
            height: auto;
            border: 2px solid black;
        }

        .header {
            background-color: skyblue;
        }

        .Gridview {
            position: relative;
            border-radius: 20px 20px;
            height: auto;
            transform: translateX(10vh);
            bottom: 20vh;
            height: 200px;
            width: 500px;
        }


        .selectdropdown {
            position: absolute;
            top: 35vh;
            width: 15%;
            height: 40px;
            background-color: skyblue;
            border-radius: 20px;
            font-family: 'Poppins', sans-serif;
            font-size: medium;
            right: 62vh;
        }

        .SelectYear {
            position: absolute;
            top: 45vh;
            width: 15%;
            height: 40px;
            background-color: skyblue;
            border-radius: 20px;
            font-family: 'Poppins', sans-serif;
            font-size: medium;
            right: 62vh;
        }

        .ViewMyattendanceGridview {
            border-collapse: collapse;
            margin: auto;
            position: relative;
            border-radius: 20px 20px;
            height: auto;
            bottom: 15vh;
            min-width: 80vh;
        }

            .ViewMyattendanceGridview th, .ViewMyattendanceGridview td {
                text-align: center;
                padding: 8px;
            }

            .ViewMyattendanceGridview .radiobutton {
                display: block;
                margin: 0 auto;
            }

            .ViewMyattendanceGridview .Comment {
                width: 80%;
                margin: 0 auto;
                box-sizing: border-box;
            }

        .AttendanceGridview .iteamtemplate {
            text-align: center;
            min-height: 5vh;
        }

        .Message {
            position: absolute;
            margin-top: auto;
            left: 50%;
            transform: translateX(-50%);
            width: 100%;
            text-align: center;
            bottom:10vh;
        }
    </style>
    <div class="container">
        <asp:Label ID="TakeAttendanceLable" runat="server" CssClass="ViewmyAttendance" Text="View MyAttendance"></asp:Label>
        <img src="../Image/TakeAttendance.png" class="image" />
        <asp:DropDownList ID="SelectMonth" runat="server" AutoPostBack="false" CssClass="selectdropdown" required="required">
            <asp:ListItem Text="Select Month" Value="" />
            <asp:ListItem Text="January" Value="1" />
            <asp:ListItem Text="February" Value="2" />
            <asp:ListItem Text="March" Value="3" />
            <asp:ListItem Text="April" Value="4" />
            <asp:ListItem Text="May" Value="5" />
            <asp:ListItem Text="June" Value="6" />
            <asp:ListItem Text="July" Value="7" />
            <asp:ListItem Text="August" Value="8" />
            <asp:ListItem Text="September" Value="9" />
            <asp:ListItem Text="October" Value="10" />
            <asp:ListItem Text="November" Value="11" />
            <asp:ListItem Text="December" Value="12" />
        </asp:DropDownList>

        <asp:DropDownList ID="SelectYear" runat="server" AutoPostBack="false" CssClass="SelectYear" required="required">
            <asp:ListItem Text="Select Year"></asp:ListItem>
        </asp:DropDownList>

        <asp:Button ID="ViewmyAttendance" runat="server" CssClass="button" Text="View MyAttendance" OnClick="ViewmyAttendance_Click" />

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="ViewMyattendanceGridview" runat="server" Visible="false" CssClass="ViewMyattendanceGridview" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="StudentId" HeaderText="StundetId" Visible="false" />
                        <asp:BoundField DataField="AttendanceDate" HeaderText="Attendance Date" />
                        <asp:BoundField DataField="AttendaceStatus" HeaderText="Attendance Status" />
                        <asp:BoundField DataField="TakerName" HeaderText="Attendance Taker Name" />
                        <asp:BoundField DataField="Reason" HeaderText="Reason" />
                        <asp:BoundField DataField="UpdatedBy" HeaderText="Updated By" />
                        <asp:BoundField DataField="UpdatedDate" HeaderText="Updated Date" />
                    </Columns>
                    <HeaderStyle CssClass="header" />
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Label ID="Message" runat="server" Visible="false" CssClass="Message" ForeColor="Green"></asp:Label>
        <div class="attendance-summary">
            <h2>Attendance Summary</h2>
            <div class="total">
                <span>Total Days:</span>
                <asp:Label ID="TotaDays" runat="server"></asp:Label>
            </div>
            <div class="present">
                <span>Present Days:</span>
                <asp:Label ID="PresentDays" runat="server"></asp:Label>
            </div>
            <div class="absent">
                <span>Absent Days:</span>
                <span id="absent-students"></span>
                <asp:Label ID="AbsentDays" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
