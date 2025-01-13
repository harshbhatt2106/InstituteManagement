<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="InstituteManagement.Login.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ForgetPassword</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" media="screen" runat="server" />
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@900&family=Poppins:wght@500&display=swap');

        .form-gap {
            padding-top: 70px;
        }

        * {
            font-family: "Google Sans",Roboto,Arial,sans-serif;
        }

        body {
            background-color: white;
        }

        .panelpanel-default {
            position: relative;
            border-radius: 10px 10px;
            box-shadow: 10px 10px 10px #d1d9e6, -10px -10px 10px #f9f9f9;
            height: auto;
        }

        img {
            position: relative;
            bottom: 25px;
            height: 300px;
            width: 300px;
        }

        .input-group img {
            height: 30px;
            width: 30px;
            position: relative;
            right: 100px;
            top: 10px;
        }

        .form-gap {
            margin: 0;
            padding: 0;
        }

        .panel.panel-default {
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
            text-align: center;
        }

        .panel .panel-body {
            margin-top: 20px;
        }

        .panel h2 {
            font-size: 24px;
        }

        .panel p {
            font-size: 16px;
            color: #555;
        }

        .form .form-group {
            margin: 20px 0;
        }

        .form .input-group {
            position: relative;
        }

        .form .inp {
            width: 100%;
            max-width: 250px;
            border-radius: 3px;
            overflow: hidden;
            position: relative;
            left: 50px;
            background-color: black;
        }

            .form .inp .label {
                position: absolute;
                bottom: 3px;
                left: 5px;
                font-size: 20px;
                color: rgba(0, 0, 0, 0.5);
                font-weight: 500;
                transform-origin: 0 0;
                transform: translate3d(0, 0, 0);
                transition: all 0.2s ease;
                pointer-events: none;
            }

            .form .inp .focus-bg {
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

            .form .inp .Emailaddress {
                -webkit-appearance: none;
                appearance: none;
                width: 105%;
                border: 0;
                bottom: 20px;
                font-family: inherit;
                padding: 12px;
                height: 40px;
                font-size: 18px;
                font-weight: 400;
                box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.3);
                color: #000;
                transition: all 0.15s ease;
            }

                .form .inp .Emailaddress:hover {
                    box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.5);
                }

                .form .inp .Emailaddress:not(:placeholder-shown) + .label {
                    color: rgba(0, 0, 0, 0.5);
                    transform: translate3d(0, -12px, 0) scale(0.75);
                }

                .form .inp .Emailaddress:focus {
                    outline: none;
                    box-shadow: inset 0 -2px 0 #0077FF;
                }

                    .form .inp .Emailaddress:focus + .label {
                        color: #0077FF;
                        transform: translate3d(0, -12px, 0) scale(0.75);
                    }

                        .form .inp .Emailaddress:focus + .label + .focus-bg {
                            transform: scaleX(1);
                            transition: all 0.1s ease;
                        }

        .form img {
            max-width: 100%;
            height: auto;
        }

        /* CSS */
        .button {
            top: 25px;
            align-items: center;
            appearance: none;
            background-color: #fff;
            border-radius: 24px;
            border-style: none;
            box-shadow: rgba(0, 0, 0, .2) 0 3px 5px -1px,rgba(0, 0, 0, .14) 0 6px 10px 0,rgba(0, 0, 0, .12) 0 1px 18px 0;
            box-sizing: border-box;
            color: #3c4043;
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
            left: 50px;
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

        .Resendotp {
            position: relative;
            left:10vh;
            top: 15px;
            font-size: 20px;
            bottom:5vh;
        }

        .otpsuccessmessage {
            position: relative;
            color: red;
            left: 8vh;
        }

        .form-group .input-group img {
            position: relative;
            bottom: 50px;
        }

        .input-group .emailicon {
            position: relative;
            top: 40px;
            right: 10px;
        }

        .p {
            position: relative;
            transform: translateX(50px);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-gap"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panelpanel-default">
                        <div class="panel-body">
                            <div class="te  xt-center">
                                <h3><i class="fa fa-lock fa-4x"></i></h3>
                                <img src="../Image/forgetpasswordLogo.jpg" />
                                <h2 class="text-center">Forgot Password?</h2>
                                <p class="p">You can reset your password here.</p>
                                <div class="panel-body">
                                    <div class="form">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <img src="../Image/mail.png" id="Emailicon" runat="server" class="emailicon" />
                                                <label for="inp" class="inp">
                                                    <asp:TextBox ID="Emailaddress" runat="server" CssClass="Emailaddress" placeholder="&nbsp;" required="required"></asp:TextBox>
                                                    <span class="label">Email Address</span>
                                                </label>
                                                <label for="inp" class="inp">
                                                    <asp:TextBox ID="EnterOtp"  runat="server" CssClass="Emailaddress" Visible="false" placeholder="&nbsp;"></asp:TextBox>
                                                    <span class="label">EnterOtp</span>
                                                </label>
                                            </div>
                                            <asp:Label ID="otpsuccessmessage" runat="server" Text="#" CssClass="otpsuccessmessage"></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <asp:Button ID="GetOpt" runat="server" CssClass="button" OnClick="GetOpt_Click" Text="GetOtp" />
                                        </div>
                                   <asp:LinkButton ID="resendotp" OnClick="resendotp_Click"  Visible="false" runat="server" ForeColor="Green" CssClass="Resendotp">ResendOtp </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
