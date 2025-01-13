<%@ Page Title="" Language="C#" MasterPageFile="~/Attendance/Attendance.Master" AutoEventWireup="true" CodeBehind="ViewAttendnace.aspx.cs" Inherits="InstituteManagement.Attendance.ViewAttendnace" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@900&family=Poppins:wght@500&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
        }

        .calendar {
            position: absolute;
            top: 20vh;
            transform: translateX(50vh);
            background-color: skyblue;
            display: inline-block;
            padding: 10px;
            border-radius: 20px;
            left: 13vh;
        }

        .button {
            bottom: 25vh;
            left: 30vh;
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



        .SelectClass {
            position: absolute;
            top: 30vh;
            width: 15%;
            height: 40px;
            background-color: skyblue;
            border-radius: 20px;
            font-family: 'Poppins', sans-serif;
            font-size: medium;
            right: 62vh;
        }

        .ViewAttendance {
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

        .input-container {
            position: relative;
            right: 250px;
            margin: auto;
            width: 215px;
            max-width: 100%;
            border-radius: 3px;
            background-color: black;
            margin-bottom: 20px;
            left: 60vh;
            bottom: 42vh;
            display: inline-block;
            height: 50px;
        }

            .input-container .input {
                -webkit-appearance: none;
                width: 215px;
                appearance: none;
                border: 0;
                font-family: inherit;
                height: 56px;
                font-size: 20px;
                font-weight: 400;
                box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.3);
                color: #000;
                transition: all 0.15s ease;
                vertical-align: middle;
                margin-bottom: 20px;
            }

            .input-container .focus-bg {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.05);
                z-index: -1;
                transform: scaleX(0);
                transform-origin: left;
            }


            .input-container .input:hover {
                box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.5);
            }

            .input-container .input:not(:placeholder-shown) + .label {
                color: rgba(0, 0, 0, 0.5);
                transform: translate3d(0, -30px, 0) scale(0.75);
            }

            .input-container .input:focus {
                outline: none;
                box-shadow: inset 0 -2px 0 #0077FF;
            }

                .input-container .input:focus + .label {
                    color: #0077FF;
                    transform: translate3d(0, -30px, 0) scale(0.75);
                }

                    .input-container .input:focus + .label + .focus-bg {
                        transform: scaleX(1);
                        transition: all 0.1s ease;
                    }

            .input-container .label {
                position: absolute;
                width: 400px;
                bottom: 8px;
                left: 5px;
                font-size: 20px;
                color: rgba(0, 0, 0, 0.5);
                font-weight: 500;
                transform-origin: 0 0;
                transform: translate3d(0, 0, 0);
                transition: all 0.2s ease;
                pointer-events: none;
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

        .Emptydata {
            position: relative;
            transform: translateX(20vh);
        }

        .ViewAttendanceGridview {
            border-collapse: collapse;
            margin: auto;
            position: relative;
            border-radius: 20px 20px;
            height: auto;
            bottom: 20vh;
            min-width: 80vh;
        }

            .ViewAttendanceGridview th, .ViewAttendanceGridview td {
                text-align: center;
                padding: 8px;
            }

            .ViewAttendanceGridview .radiobutton {
                display: block;
                margin: 0 auto;
            }

            .ViewAttendanceGridview .Comment {
                width: 80%;
                margin: 0 auto;
                box-sizing: border-box;
            }

            .ViewAttendanceGridview .iteamtemplate {
                text-align: center;
                min-height: 5vh;
            }
    </style>
    <div class="container">
        <asp:Label ID="TakeAttendanceLable" runat="server" CssClass="ViewAttendance" Text="View Attendance"></asp:Label>

        <img src="../Image/TakeAttendance.png" class="image" />

        <label for="inp" class="input-container">
            <asp:TextBox ID="Date" runat="server" TextMode="Date" placeholder="&nbsp;" CssClass="input" required="required"></asp:TextBox>
            <span class="label">Select Date</span>
        </label>

        <asp:DropDownList ID="SelectClass" runat="server" AutoPostBack="false" CssClass="SelectClass" required="required">
            <asp:ListItem Text="Select Class" Value="" />
        </asp:DropDownList>

        <asp:Button ID="ViewAttendance" runat="server" CssClass="button" Text="View Attendance" OnClick="ShowStudent_Click" />

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                <asp:GridView ID="ViewAttendanceGridview" runat="server" Visible="false" CssClass="ViewAttendanceGridview" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField HeaderText="FullName" DataField="FullName" ControlStyle-CssClass="iteamtemplate" />
                        <asp:BoundField HeaderText="IsPresent" DataField="AttendaceStatus" ControlStyle-CssClass="iteamtemplate" />
                        <asp:BoundField HeaderText="Comment" DataField="Reason" ControlStyle-CssClass="iteamtemplate" />
                    </Columns>

                    <EmptyDataTemplate>
                        No Take Attendance For This Day
                    </EmptyDataTemplate>

                    <HeaderStyle CssClass="header" />
                    <EmptyDataRowStyle CssClass="Emptydata" />

                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="attendance-summary">
            <h2>Attendance Summary</h2>
            <div class="total">
                <span>Total Students:</span>
                <asp:Label ID="TotalStudent" runat="server" Text="0" ></asp:Label>
            </div>
            <div class="present">
                <span>Present Students:</span>
                <asp:Label ID="PresentStudent" runat="server" Text="0" ></asp:Label>
            </div>
            <div class="absent">
                <span>Absent Students:</span>
                <asp:Label ID="AbsentStudent" runat="server" Text="0" ></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

