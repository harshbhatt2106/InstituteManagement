<%@ Page Title="" Language="C#" MasterPageFile="~/Usermanagement/Usermanagemnet.Master" AutoEventWireup="true" CodeBehind="ClassUpdate.aspx.cs" Inherits="InstituteManagement.Usermanagement.ClassUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@900&family=Poppins:wght@500&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
        }

        .currentclass {
            position: absolute;
            top: 10vh;
            width: 30%;
            height: 40px;
            background-color: skyblue;
            border-radius: 20px;
            font-family: 'Poppins', sans-serif;
            font-size: medium;
            right: 28vh;
        }

        .UpdateClass {
            position: absolute;
            top: 19vh;
            width: 30%;
            height: 40px;
            background-color: skyblue;
            border-radius: 20px;
            font-family: 'Poppins', sans-serif;
            font-size: medium;
            right: 28vh;
        }

        .button {
            top:22vh;
            left: 27vh;
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

        .UpdateClassLable {
            position: absolute;
            top: 10px;
            transform: translateX(28vh);
            font-size: 4vh;
            font-weight: bolder;
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
            transform: translateX(60vh);
            flex-direction: column;
            height: 40vh;
            width: 20vh;
            min-width: 85vh;
        }
    </style>
    <div class="contanier">

        <asp:Label ID="UpdateClassLable" runat="server" CssClass="UpdateClassLable" Text="Update Class"></asp:Label>
        <asp:DropDownList ID="CurrentClass" runat="server" AutoPostBack="false" CssClass="currentclass" required="required">
        </asp:DropDownList><br />
        <asp:DropDownList ID="Update" runat="server" AutoPostBack="false" CssClass="UpdateClass" required="required">
        </asp:DropDownList>
        <asp:Button ID="UpdateClass" runat="server" CssClass="button" Text="Update Class" />


    </div>
</asp:Content>
