<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineExamination/OnlineExamination.Master" AutoEventWireup="true" CodeBehind="SubmitExam.aspx.cs" Inherits="InstituteManagement.OnlineExamination.SubmitExam" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   s
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Questrial&family=Roboto+Slab:wght@300&display=swap');

        body {
            font-family: 'Questrial', sans-serif;
            font-size: large;
            font-weight: bold;
        }


        .SubmitExamlable {
            top: 12vh;
            position: absolute;
            transform: translateX(90vh);
            font-size: 5vh;
            font-weight: bolder;
        }

        .Questionlable {
            top: 87vh;
            position: absolute;
            transform: translateX(95vh);
            font-size: 5vh;
            font-weight: bolder;
        }

        .button2 {
            top: 12vh;
            left: 35vh;
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

            .button2:hover {
                background: #F6F9FE;
                color: #174ea6;
            }

            .button2:active {
                box-shadow: 0 4px 4px 0 rgb(60 64 67 / 30%), 0 8px 12px 6px rgb(60 64 67 / 15%);
                outline: none;
            }

            .button2:focus {
                outline: none;
                border: 2px solid #4285f4;
            }

            .button2:not(:disabled) {
                box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
            }

                .button2:not(:disabled):hover {
                    box-shadow: rgba(60, 64, 67, .3) 0 2px 3px 0, rgba(60, 64, 67, .15) 0 6px 10px 4px;
                }

                .button2:not(:disabled):focus {
                    box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
                }

                .button2:not(:disabled):active {
                    box-shadow: rgba(60, 64, 67, .3) 0 4px 4px 0, rgba(60, 64, 67, .15) 0 8px 12px 6px;
                }

            .button2:disabled {
                box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
            }


        .successMessage {
            position: absolute;
            margin-top: auto;
            width: 100%;
            text-align: center;
        }

        .AllButton {
            display: flex;
            display: inline-block;
            flex-wrap: wrap;
            justify-content: space-between;
            max-width: 50vh;
            margin: 0 auto;
            border-radius: 5px;
            color: #3498db;
            background-color: #ffffff;
        }

        .DynmicButton {
            display: inline-block;
            position: relative;
            padding: 10px 20px;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            border: 2px solid #3498db;
            color: #3498db;
            background-color: deepskyblue;
            width: calc(33.33% - 10px);
            box-sizing: border-box;
            margin: 5px;
            width: 8vh;
            color: white;
            transition: background-color 0.3s, color 0.3s;
            top: 15vh;
        }

            .DynmicButton:hover {
                background-color: #3498db;
                color: #ffffff;
            }

        .NextButton {
            display: inline-block;
            position: relative;
            padding: 10px 20px;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            border: 2px solid #3498db;
            border-radius: 5px;
            color: #3498db;
            background-color: #ffffff;
            width: calc(33.33% - 10px);
            box-sizing: border-box;
            margin: 5px;
            width: 20vh;
            transition: background-color 0.3s, color 0.3s;
            top: 55vh;
            left: 130vh;
        }

            .NextButton:hover {
                background-color: #3498db;
                color: #ffffff;
            }

        .container {
            width: 80%;
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }


        .QuestionId {
            display: none;
        }

        .Question {
            font-size: 18px;
            color: #333;
            position: relative;
            font-weight: bold;
        }

        .option {
            position: relative;
            top: 2vh;
        }


        .radiobuttonlist {
            list-style: none;
            margin: 0;
            padding: 0;
        }

            .radiobuttonlist label {
                display: flex;
                align-items: center;
                padding: 10px;
                margin-bottom: 5px;
                border: 1px solid #ddd;
                cursor: pointer;
                background-color: #fff;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }

            .radiobuttonlist input[type="radio"] {
                display: none;
            }

                .radiobuttonlist input[type="radio"] + label::before {
                    content: '';
                    display: inline-block;
                    width: 20px;
                    height: 20px;
                    margin-right: 10px;
                    border: 2px solid #ddd;
                    border-radius: 50%;
                    background-color: #fff;
                }

                .radiobuttonlist input[type="radio"]:checked + label::before {
                    background-color: #006DA4;
                    border-color: #006DA4;
                }

        .timer-container {
            position: absolute;
            top: 12vh;
            transform: translateX(72vh);
            text-align: center;
        }

        .timer-label {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }

        .timer-value {
            font-size: 2rem;
            font-weight: bold;
            color: #e44d26;
            padding: 0.2em 0.5em;
            border-radius: 0.2em;
            background-color: #fff;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            margin: 0 0.5em;
        }
    </style>


    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Timer ID="CountDuration" Interval="1000"  OnTick="CountDuration_Tick1" runat="server"></asp:Timer>
            <div class="timer-container">
                <span class="timer-label">Minutes:</span>
                <asp:Label ID="minite" runat="server" CssClass="timer-value" Text="00"></asp:Label>
                <span class="timer-label">Seconds:</span>
                <asp:Label ID="second" runat="server" CssClass="timer-value" Text="00"></asp:Label>
            </div>
            <asp:Panel ID="DynamicaButton" runat="server" CssClass="AllButton"></asp:Panel>

            <asp:Button ID="NextButton" OnClick="NextButton_Click" CssClass="NextButton" runat="server" Text="Next Button" />

            <div class="container">

                <asp:Label ID="QuestionId" runat="server" CssClass="QuestionId"></asp:Label>
                <div class="Question">
                    <asp:Label ID="Question" runat="server"></asp:Label>
                </div>

                <div class="option">
                    <asp:RadioButtonList ID="OptionsRadioButtonList" OnSelectedIndexChanged="OptionsRadioButtonList_SelectedIndexChanged" CssClass="radiobuttonlist" AutoPostBack="true" runat="server" RepeatDirection="Vertical">
                    </asp:RadioButtonList>
                </div>
             
                <asp:Button ID="submitExam" runat="server" CssClass="button2" OnClientClick="return myFunction();" OnClick="submitExam_Click" Text="Submt Exam" />

                <asp:HiddenField ID="ConfromationforExamSubmission" runat="server" />
            </div>
            </div>
            <br />
            <script>

                function myFunction() {
                    let text;
                    let message = confirm("Are You Conform Submit Exam");
                    if (message) {
                        text = "Yes";
                    } else {
                        text = "No";
                    }
                    document.getElementById('<%= ConfromationforExamSubmission.ClientID %>').value = text;
                }
                function updateTimerValues()
                {
                    alert("Your Time is Over And Exam is Loss.");
                }
            </script>
         
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
