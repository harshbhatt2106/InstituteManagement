<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineExamination/OnlineExamination.Master" AutoEventWireup="true" CodeBehind="CreateQuestion.aspx.cs" Inherits="InstituteManagement.OnlineExamination.CreateQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@900&family=Poppins:wght@500&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
        }

        .input-container {
            position: relative;
            top: 45px;
            right: 250px;
            margin: -3px;
            width: 400px;
            max-width: 100%;
            border-radius: 3px;
            background-color: black;
            margin-bottom: 20px;
            left: 1px;
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

            .input-container .input {
                -webkit-appearance: none;
                appearance: none;
                width: 100%;
                border: 0;
                font-family: inherit;
                height: 56px;
                font-size: 16px;
                font-weight: 400;
                box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.3);
                color: #000;
                transition: all 0.15s ease;
                vertical-align: middle;
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
                bottom: 15px;
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
            display: flex;
            flex-direction: column;
            bottom: 5vh;
            position: relative;
            width: 400px;
            padding: 25px;
            background-color: #ecf0f3;
            box-shadow: 10px 10px 10px #d1d9e6, -10px -10px 10px #f9f9f9;
            border-radius: 12px;
            overflow: hidden;
            top: 10vh;
            left: 550px;
            height: 100vh;
        }

        .button {
            top: 4vh;
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
            left: 80px;
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


        .message {
            position: relative;
            color: forestgreen;
            top: 5vh;
        }

        .CreateQuestion {
            position: absolute;
            top: 12vh;
            transform: translateX(86vh);
            font-size: 5vh;
            font-weight: bolder;
        }

        .ExamList {
            position: absolute;
            height: 40px;
            background-color: skyblue;
            border-radius: 20px;
            font-family: 'Poppins', sans-serif;
            font-size: medium;
            width: 49%;
            top: 8px;
            right: 25vh;
        }
        .RightAnswer{
            position:relative;
            top:5vh;
        }
        .lable{
            position:relative;
            top:5vh;
        }
    </style>
    <asp:Label ID="CreatequestionLable" runat="server" CssClass="CreateQuestion" Text="Create Question"></asp:Label>

    <div class="container">
        <asp:DropDownList ID="ExamList" runat="server" CssClass="ExamList" required="required">
        </asp:DropDownList>
        <label for="inp" class="input-container">
            <asp:TextBox ID="Question" runat="server" TextMode="MultiLine" placeholder="&nbsp;" CssClass="input" required="required"></asp:TextBox>
            <span class="label">Question</span>
        </label>

        <label for="inp" class="input-container">
            <asp:TextBox ID="Option1" runat="server" placeholder="&nbsp;" CssClass="input" required="required"></asp:TextBox>
            <span class="label">Option1</span>
        </label>

        <label for="inp" class="input-container">
            <asp:TextBox ID="Option2" runat="server" placeholder="&nbsp;" CssClass="input" required="required"></asp:TextBox>
            <span class="label">Option2</span>
        </label>

        <label for="inp" class="input-container">
            <asp:TextBox ID="Option3" runat="server" placeholder="&nbsp;" CssClass="input" required="required"></asp:TextBox>
            <span class="label">Option3</span>
        </label>

        <label for="inp" class="input-container">
            <asp:TextBox ID="Option4" runat="server" placeholder="&nbsp;" CssClass="input" required="required"></asp:TextBox>
            <span class="label">Option4</span>
        </label>
       <p class="lable">Select Right Answer</p>
        <asp:RadioButtonList ID="RightAnswer" runat="server" CssClass="RightAnswer">
            <asp:ListItem Text="Option1" ></asp:ListItem>
            <asp:ListItem Text="Option2" ></asp:ListItem>
            <asp:ListItem Text="Option3"></asp:ListItem>
            <asp:ListItem Text="Option4"></asp:ListItem>
        </asp:RadioButtonList>

        <label for="inp" class="input-container">
            <asp:TextBox ID="Subject" runat="server" placeholder="&nbsp;" CssClass="input" required="required"></asp:TextBox>
            <span class="label">Subject</span>
        </label>

        <asp:Button ID="Createquestions" runat="server" CssClass="button" OnClick="Createquestions_Click" Text="Create Question" />
        <asp:Label ID="SuccessMessage" CssClass="message" runat="server" Visible="false" Text="Question Created Succesfully..."></asp:Label>
    </div>
</asp:Content>
