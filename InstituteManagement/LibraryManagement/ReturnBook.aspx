<%@ Page Title="" Language="C#" MasterPageFile="~/LibraryManagement/LibraryManagement.Master" AutoEventWireup="true" CodeBehind="ReturnBook.aspx.cs" Inherits="InstituteManagement.LibraryManagement.ReturnBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .container {
            width: auto;
            max-width: 600px;
            padding: 20px;
            margin: 20px auto;
            background-color: #ecf0f3;
            box-shadow: 10px 10px 10px #d1d9e6, -10px -10px 10px #f9f9f9;
            border-radius: 12px;
        }

            .container img {
                position: relative;
                right: 10vh;
                top: 5vh;
                height: 50vh;
            }

        .BookTransactionLable {
            position: absolute;
            top: 20vh;
            transform: translateX(30vh);
            font-size: 4vh;
            font-weight: bolder;
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
            right: 75vh;
        }

        .SelectName {
            position: absolute;
            top: 38vh;
            width: 15%;
            height: 40px;
            background-color: skyblue;
            border-radius: 20px;
            font-family: 'Poppins', sans-serif;
            font-size: medium;
            right: 75vh;
        }

        .BookCodeList {
            position: absolute;
            top: 46vh;
            width: 15%;
            height: 40px;
            background-color: skyblue;
            border-radius: 20px;
            font-family: 'Poppins', sans-serif;
            font-size: medium;
            right: 75vh;
        }

        .button {
            bottom: 8vh;
            right: 9vh;
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
    </style>
    <div class="container">
        <asp:Label ID="BookTransactionLable" runat="server" CssClass="BookTransactionLable" Text="Return Book"></asp:Label>
        <img src="../Image/Library.png" />

        <asp:DropDownList ID="SelectClass" runat="server" OnSelectedIndexChanged="SelectClass_SelectedIndexChanged" AutoPostBack="true" CssClass="SelectClass" required="required">
        </asp:DropDownList>

        <asp:DropDownList ID="StudentList" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="StudentList_SelectedIndexChanged" runat="server" CssClass="SelectName" required="required">
        </asp:DropDownList>

        <asp:DropDownList ID="BookCodeList" Visible="false" runat="server" CssClass="BookCodeList" required="required">
        </asp:DropDownList>

        <asp:Button ID="GaveBook" runat="server" CssClass="button" OnClick="GaveBook_Click" Text="GiveBook" />
    </div>

</asp:Content>
