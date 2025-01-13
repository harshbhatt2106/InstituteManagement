<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineExamination/OnlineExamination.Master" AutoEventWireup="true" CodeBehind="ShowExam.aspx.cs" Inherits="InstituteManagement.OnlineExamination.ShowExam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .ExamLabel {
            display: flex;
            justify-content: flex-start;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .CustomLabel {
            display: inline-block;
            margin: 0;
            position: relative;
            font-weight: bold;
        }

        .ExamLabel {
            display: inline-block;
            margin: 0;
            position: relative;
            text-align: left;
        }

        .ExamDetail {
            padding: 25px;
            overflow: hidden;
            position: relative;
            box-shadow: 10px 10px 10px #d1d9e6, -10px -10px 10px #f9f9f9;
            width: auto;
            background-color: #ecf0f3;
            border-radius: 12px;
            margin: 20px;
            text-align: left;
            top: 10vh;
            min-width: 25vh;
            transform: translateX(20vh);
        }

        .ExamId {
            display: none;
        }

        .button {
            top: 2vh;
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
            height: 45px;
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
            width: 150px;
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
    </style>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <div class="ExamDetail">
                        <asp:Label ID="Warning" runat="server" Text="if You Page Refresh When<br> You Will Loss Your Exam" ForeColor="Red"></asp:Label>
                        <asp:Label ID="ExamId" runat="server" CssClass="ExamId" Text='<%# Eval("ExamId") %>'></asp:Label><br />

                        <p class="CustomLabel">Exam Name:</p>
                        <asp:Label ID="Subject" runat="server" CssClass="ExamLabel" Text='<%# Eval("ExamTitle") %>'></asp:Label><br />

                        <p class="CustomLabel">Total Mark:</p>
                        <asp:Label ID="Totalmark" runat="server" CssClass="ExamLabel" Text='<%# Eval("TotalMark") %>'></asp:Label><br />

                        <p class="CustomLabel">Passing Mark:</p>
                        <asp:Label ID="PassingMark" runat="server" CssClass="ExamLabel" Text='<%# Eval("PassingMark") %>'></asp:Label><br />

                        <p class="CustomLabel">Start:</p>
                        <asp:Label ID="Takentimeto" runat="server" CssClass="ExamLabel" Text='<%# Eval("TakenTimeFrom") %>'></asp:Label><br />

                        <p class="CustomLabel">End:</p>
                        <asp:Label ID="TakenTimeFrom" runat="server" CssClass="ExamLabel" Text='<%# Eval("TakenTimeTo") %>'></asp:Label><br />

                        <p class="CustomLabel">Created By:</p>
                        <asp:Label ID="ExamTakerName" runat="server" CssClass="ExamLabel" Text='<%# Eval("ExamTakeName") %>'></asp:Label><br />

                        <p class="CustomLabel">Duration:</p>
                        <asp:Label ID="Duration" runat="server" CssClass="ExamLabel" Text='<%# Eval("Duration") %>'></asp:Label><br />

                        <asp:Button ID="StartExam" runat="server" CssClass="button" OnClick="StartExam_Click" Text="Start Exam" />

                    </div>
                </ItemTemplate>
            </asp:DataList>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
