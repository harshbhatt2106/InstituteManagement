<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePassword.aspx.cs" Inherits="Institute_priject_new_try.password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ForgetPassword</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@900&family=Poppins:wght@500&display=swap');

        * {
            font-family: "Google Sans",Roboto,Arial,sans-serif;
        }

        body {
            background-color: whitesmoke;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: #ecf0f3;
            box-shadow: 10px 10px 10px #d1d9e6, -10px -10px 10px #f9f9f9;
            border-radius: 12px;
            width: 300px;
            margin: 0 auto;
            padding: 25px;
            height: 90vh;
            overflow: hidden;
        }

        .PasswordImage {
            position: relative;
            height: 300px;
            width: 70vh;
            bottom: 60px;
        }

        .input-container {
            display: flex;
            align-items: center;
            width: 100%;
            max-width: 400px;
            margin: 10px;
            position: relative;
            bottom: 40px;
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
                width: 100%;
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

        .button {
            appearance: none;
            background-color: #24a0ed;
            border-radius: 24px;
            border: none;
            box-shadow: rgba(0, 0, 0, .2) 0 3px 5px -1px, rgba(0, 0, 0, .14) 0 6px 10px 0, rgba(0, 0, 0, .12) 0 1px 18px 0;
            box-sizing: border-box;
            color: white;
            cursor: pointer;
            display: inline-flex;
            fill: currentcolor;
            font-family: "Google Sans", Roboto, Arial, sans-serif;
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
            transition: box-shadow 280ms cubic-bezier(.4, 0, .2, 1), opacity 15ms linear 30ms, transform 270ms cubic-bezier(0, 0, .2, 1) 0ms;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            width: 40vh;
            will-change: transform, opacity;
            margin-top: 10px;
            right: 2px;
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

       .container .PasswordMessage {
            position: relative;
            top: 20px;
            right: 20px;
            color: forestgreen;
        }

        .container h1 {
            position: relative;
            bottom: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <img src="../Image/passwodandconfrompaasword.jpg" class="PasswordImage" runat="server" />
            <h1>UpdatePassword</h1>
            <label for="inp" class="input-container">
                <asp:TextBox ID="Password" runat="server" placeholder="&nbsp;" CssClass="input" required="requried"></asp:TextBox>
                <span class="label">Password</span>
            </label>
            <label for="inp" class="input-container">
                <asp:TextBox ID="ConfromPaasword" runat="server" placeholder="&nbsp;" CssClass="input" required="requried"></asp:TextBox>
                <span class="label">ConfromPassword</span>
            </label>
            <asp:CompareValidator ID="CompareValidator1" ControlToCompare="ConfromPaasword" ControlToValidate="Password" runat="server" ForeColor="Red" ErrorMessage="Password Does Not Match"></asp:CompareValidator>
            <asp:Button ID="Paasoword" runat="server" CssClass="button" Text="Submit" OnClick="Paasoword_Click" />
            <asp:Label ID="PasswordMessage" runat="server" CssClass="PasswordMessage" Text="Password Updated Successfully" Visible="false"></asp:Label>

        </div>
        
    </form>
</body>
</html>
