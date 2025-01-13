<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="InstituteManagement.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HomePage</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@900&family=Poppins:wght@500&display=swap');

        body {
            margin: 0;
            padding: 0;
            font-family: "Google Sans",Roboto,Arial,sans-serif;
            overflow:hidden;
        }


        .navbar {
            display: flex;
            justify-content: space-between;
            background-color: skyblue;
            color: #fff;
            padding: 10px;
            height: 65px;
        }

        .user-profile {
            display: flex;
            align-items: center;
        }

        .user-photo {
            position: relative;
            transform: translateX(1230px);
            width: 80px;
            height: 80px;
            background-color: #fff;
            border-radius: 50%;
            overflow: hidden;
            border: 2px solid white;
            border-radius: 50%;
            box-shadow: 1px 1px 6px 1px black;
        }

            .user-photo img {
                position: relative;
                bottom: 5px;
                height: 90px;
                width: 90px;
                border-radius: 40%;
            }

        .user-name {
            position: relative;
            top: 16px;
            left: 600px;
            color: black;
        }

        .circle {
            position: relative;
            width: 100px;
            height: 100px;
            border-radius: 50%;
            overflow: hidden;
            margin: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            margin-right: 90px;
        }

            .circle img {
                width: 100px;
                height: 100px;
                object-fit: cover;
            }

        .container .text {
            display: inline;
            position: relative;
            margin-bottom: 0px;
            margin-left: 120px;
            color: lightskyblue;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 8px;
            position: relative;
            height: 600px;
            width: 350px;
            padding: 25px;
            background-color: white;
            box-shadow: 10px 10px 20px #d1d9e6, -10px 10px 10px #f9f9f9;
            border-radius: 12px;
            overflow: hidden;
            left: 600px;
        }

        .onebox {
            display: flex;
            position: relative;
            transform: translateX(20px);
        }

        .box {
            margin: 20px;
            position: relative;
            transform: translateX(220px);
            border: 2px solid White;
            border-radius: 40px;
            height: 180px;
            width: 300px;
            top: 50px;
            box-shadow: 0 10px 10px 0 black;
            background-color: #00CCFF;
        }

        .secodbox {
            position: relative;
            top: 20px;
            display: flex;
            transform: translateX(180px);
        }

        .box:hover {
            box-shadow: 0px 10px 25px 0px skyblue;
        }

        .TakeAttendance {
            position: relative;
            display: inline;
            top: 8px;
            border: 2px solid white;
            border-radius: 50%;
            box-shadow: 1px 1px 6px 1px black;
            margin-left: 80px;
            height: 100px;
        }

        .TakeAttendanceName {
            position: relative;
            color: black;
            top: 30px;
            left: 60px;
            margin-right: 10px;
            font-family: 'Poppins', sans-serif;
            font-size: 20px;
        }

        .OnlineExamination {
            position: relative;
            top: 5px;
            height: 106px;
            margin-left: 80px;
            border: 2px solid white;
            border-radius: 50%;
            box-shadow: 1px 1px 6px 1px black;
        }

        .OnlineExaminationName {
            position: relative;
            left: 60px;
            top: 20px;
            margin-right: 10px;
            font-family: 'Poppins', sans-serif;
            font-size: 20px;
        }


        .library {
            position: relative;
            top: 5px;
            display: inline;
            height: 100px;
            margin-left: 90px;
            border: 2px solid White;
            border-radius: 50%;
            box-shadow: 1px 1px 6px 1px black;
        }

        .libraryName {
            position: relative;
            right: 90px;
            font-family: 'Poppins', sans-serif;
            top: 50px;
            font-size: 20px;
        }

        .KnowladgeRepository {
            position: relative;
            top: 5px;
            height: 100px;
            margin-left: 80px;
            border: 2px solid white;
            border-radius: 50%;
            box-shadow: 1px 1px 6px 1px black;
        }

        .KnowladgeRepositoryName {
            position: relative;
            left: 40px;
            font-family: 'Poppins', sans-serif;
            top: 30px;
            font-size: 20px;
        }

        .UserManagement {
            position: relative;
            top: 5px;
            height: 100px;
            border: 2px solid White;
            border-radius: 50%;
            box-shadow: 1px 1px 6px 1px black;
            margin-left: 90px;
        }

        .UserManagementName {
            position: relative;
            left: 60px;
            font-family: 'Poppins', sans-serif;
            top: 30px;
            font-size: 20px;
        }

        @media only screen and (max-width: 768px) {

            .user-name {
                left: 0;
                text-align: center;
                margin-top: 10px;
            }

            .container {
                width: 100%;
                left: 0;
                margin: 0;
            }

            .onebox, .secodbox {
                flex-direction: column;
                align-items: center;
                margin-left: 0;
                transform: translateX(0);
            }

            .box {
                transform: translateX(0);
                margin-left: 0;
                margin-right: 0;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar">
            <div class="user-profile">
                <div class="user-photo">
                    <asp:Image ID="ProfilePicture" runat="server" />
                </div>
            </div>
            <asp:Label ID="Username" runat="server" CssClass="user-name"></asp:Label>
             <asp:ImageButton ID="Logout" runat="server" ImageUrl="~/Image/logout.png" OnClick="Logout_Click" ToolTip="Logout" />
        </nav>
        <div class="onebox">
            <div class="box">
                <asp:ImageButton ID="TakeAttendance" runat="server" CssClass="TakeAttendance" OnClick="TakeAttendance_Click" ImageUrl="~/Image/Aettendence.png" />
                <asp:Label ID="Label1" runat="server" Text="TakeAttendance" CssClass="TakeAttendanceName"></asp:Label>
            </div>
            <div class="box">
                <asp:ImageButton ID="OnlineExamination" runat="server" CssClass="OnlineExamination" OnClick="OnlineExamination_Click" ImageUrl="~/Image/onlineExamination.png" />
                <asp:Label ID="Label3" runat="server" Text="OnlineExamination" CssClass="OnlineExaminationName"></asp:Label>
            </div>
            <div class="box">
                <asp:ImageButton ID="library" OnClick="library_Click" runat="server" CssClass="library" ImageUrl="~/Image/library.png" />
                <asp:Label ID="Label2" runat="server" Text="Library" CssClass="libraryName"></asp:Label>
            </div>
        </div>
        <div class="secodbox">
            <div class="box">
                <asp:ImageButton ID="KnowladgeRepository" runat="server" CssClass="KnowladgeRepository" OnClick="KnowladgeRepository_Click" ImageUrl="~/Image/Knowlagerepository.png" />
                <asp:Label ID="Label4" runat="server" Text="Knowladge  Repository" CssClass="KnowladgeRepositoryName"></asp:Label>
            </div>
            <div class="box">
                <asp:ImageButton ID="UserManagement" runat="server" OnClick="UserManagement_Click" CssClass="UserManagement" ImageUrl="~/Image/UserManagemnet.png" />
                <asp:Label ID="Label5" runat="server" Text="UserManagement" CssClass="UserManagementName"></asp:Label>
            </div>
        </div>

    </form>
</body>
</html>
