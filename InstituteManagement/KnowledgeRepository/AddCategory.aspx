<%@ Page Title="" Language="C#" MasterPageFile="~/KnowledgeRepository/KnowledgeRepository.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="InstituteManagement.KnowledgeRepository.AddCategory" %>
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
            right: 250px;
            margin: auto;
            width: 400px;
            max-width: 100%;
            border-radius: 3px;
            background-color: black;
            margin-bottom: 20px;
            left: 45vh;
            bottom: 35vh;
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
                width: 52%;
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

        .contanier {
            display: inline-block;
            padding: 20px;
            background-color: #ecf0f3;
            box-shadow: 10px 10px 10px #d1d9e6, -10px -10px 10px #f9f9f9;
            border-radius: 12px;
            transition: box-shadow 0.3s ease;
            border: 2px solid black;
            position: relative;
            top: 3vh;
            transform: translateX(58vh);
            flex-direction: column;
            height: 65vh;
            width: 95vh;
        }

            .contanier img {
                position: relative;
                right:3vh;
                top: 4vh;
                height: 50vh;
            }

        .AddCategoryLable {
            position: absolute;
            top: 10px;
            transform: translateX(30vh);
            font-size: 4vh;
            font-weight: bolder;
        }

        .button {
            bottom: 30vh;
            left: 45vh;
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
            .SuccessMessage{
                position:absolute;
                bottom:5vh;
                transform:translateX(14vh);
                color:forestgreen;
            }
    </style>
    <div class="contanier">
        <asp:Label ID="AddBookLable" runat="server" CssClass="AddCategoryLable" Text="Add Category"></asp:Label>
        <img src="../Image/AddCategory.png" />
        <label for="inp" class="input-container">
            <asp:TextBox ID="CategoryName" runat="server" placeholder="&nbsp;" CssClass="input" required="required"></asp:TextBox>
            <span class="label">Category Name</span>
        </label>
        <br />
        <asp:Button ID="addcategory" runat="server" OnClick="addcategory_Click" CssClass="button"  Text="Add Category" />
        <asp:Label ID="successmessage" runat="server"  CssClass="SuccessMessage" Visible="true" ></asp:Label>
    </div>
</asp:Content>
