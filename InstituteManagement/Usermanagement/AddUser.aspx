<%@ Page Title="" Language="C#" MasterPageFile="~/Usermanagement/Usermanagemnet.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="InstituteManagement.Usermanagement.AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
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
            display: flex;
            flex-direction: column;
            position: relative;
            width: 400px;
            padding: 25px;
            background-color: #ecf0f3;
            box-shadow: 10px 10px 10px #d1d9e6, -10px -10px 10px #f9f9f9;
            border-radius: 12px;
            overflow: hidden;
            top: 20px;
            left: 550px;
        }

            .container h2 {
                display: inline;
                position: relative;
                bottom: 10px;
                font-family: 'Times New Roman', Times, serif;
                font-size: 35px;
            }

        .selectclass {
            background-color: #24a0ed;
            border: 2px solid white;
            border-radius: 50px;
            position: relative;
            width: 200px;
            color: white;
            border: none;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
            margin: 2px;
            cursor: pointer;
            left: 80px;
            bottom:40px;
        }

        .usertype {
            background-color: #24a0ed;
            border: 2px solid white;
            border-radius: 50px;
            position: relative;
            width: 190px;
            color: white;
            border: none;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
            margin: 2px;
            cursor: pointer;
            bottom: 48px;
            left: 180px;
        }

        .selectgender {
            background-color: #24a0ed;
            border: 2px solid white;
            border-radius: 50px;
            position: relative;
            bottom: 5px;
            width: 200px;
            color: white;
            border: none;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
            margin: 2px;
            cursor: pointer;
            right: 20px;
        }

        .custom-dropdown .listiteam {
            background-color: black;
        }

        .custom-file-upload {
            background-color: #24a0ed;
            border-radius: 24px;
            color: white;
            padding: 10px;
            border: 2px solid white;
            border-radius: 50px;
            font-size: 16px;
            cursor: pointer;
            width: 200px;
            position: relative;
            bottom: 3vh;
            transform:translateX(11vh);
        }

        .button {
            top: 10px;
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
    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="container">
                <h2>
                    <center>Add User</center>
                </h2>
                <label for="inp" class="input-container">
                    <asp:TextBox ID="UserName" runat="server" placeholder="&nbsp;" CssClass="input" required="required"></asp:TextBox>
                    <span class="label">UserName</span>
                </label>

                <label for="inp" class="input-container">
                    <asp:TextBox ID="FirstName" runat="server" placeholder="&nbsp;" CssClass="input" required="required"></asp:TextBox>
                    <span class="label">FirstName</span>

                </label>

                <label for="inp" class="input-container">
                    <asp:TextBox ID="LastName" runat="server" placeholder="&nbsp;" CssClass="input" required="required"></asp:TextBox>
                    <span class="label">LastName</span>

                </label>
                <label for="inp" class="input-container">
                    <asp:TextBox ID="SecondName" runat="server" placeholder="&nbsp;" CssClass="input" required="required"></asp:TextBox>
                    <span class="label">SecondName</span>

                </label>

                <label for="inp" class="input-container">
                    <asp:TextBox ID="ContactNumber" TextMode="Number" runat="server" placeholder="&nbsp;" CssClass="input" required="required"></asp:TextBox>
                    <span class="label">ContactNumber</span>

                </label>

                <label for="inp" class="input-container">
                    <asp:TextBox ID="EmailAdress" runat="server" placeholder="&nbsp;" CssClass="input" required="required"></asp:TextBox>
                    <span class="label">EmailAdress</span>
                </label>

                <label for="inp" class="input-container">
                    <asp:TextBox ID="Address" runat="server" placeholder="&nbsp;" CssClass="input" required="required"></asp:TextBox>
                    <span class="label">Address</span>
                </label>

                <label for="inp" class="input-container">
                    <asp:TextBox ID="Password" runat="server" TextMode="Password" placeholder="&nbsp;" CssClass="input" required="required"></asp:TextBox>
                    <span class="label">Password</span>
                </label>

                <asp:DropDownList ID="SelectGender" runat="server" CssClass="selectgender" required="required">
                    <asp:ListItem Text="Select Gender" Value="" />
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Female" Value="Female" />
                </asp:DropDownList>


                <asp:DropDownList ID="UserTypes" runat="server" OnSelectedIndexChanged="UserTypes_SelectedIndexChanged" AutoPostBack="true" CssClass="usertype" required="required">
                </asp:DropDownList>

                <asp:DropDownList ID="SelectClass" runat="server" CssClass="selectclass" AutoPostBack="true" Visible="false" required="required">
                </asp:DropDownList>

                <asp:FileUpload ID="ProfilePicture" runat="server" CssClass="custom-file-upload" required="required" />
                <asp:Button ID="addUser" runat="server" CssClass="button" OnClick="addUser_Click" Text="Add" />
                <asp:Label ID="Successmessage" runat="server" Text=""></asp:Label>

            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="AddUser" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
