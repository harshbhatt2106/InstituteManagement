<%@ Page Title="" Language="C#" MasterPageFile="~/LibraryManagement/LibraryManagement.Master" AutoEventWireup="true" CodeBehind="MypurchasedBook.aspx.cs" Inherits="InstituteManagement.LibraryManagement.MypurchasedBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
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
            height: 70vh;
            width: 85vh;
        }

        .MyAvailableBook {
            position: absolute;
            top: 10px;
            transform: translateX(26vh);
            font-size: 4vh;
            font-weight: bolder;
        }

        .header {
            background-color: skyblue;
            position: relative;
            height: auto;
            width: auto;
        }

        .ShowMyPrchasedBook {
            margin: auto;
            position: relative;
            top:8vh;
            height: auto;
            min-width: 50vh;
            text-align: center;
        }
    </style>

    <div class="contanier">
        <asp:Label ID="MyAvailableBook" runat="server" CssClass="MyAvailableBook" Text="My Purchased Book"></asp:Label>
        <asp:GridView ID="ShowMyPrchasedBook" runat="server" CssClass="ShowMyPrchasedBook" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="BookName" HeaderText="BookName" />
                <asp:BoundField DataField="BookAuthor" HeaderText="BookAuthor" />
                <asp:BoundField DataField="BookCode" HeaderText="BookCode" />
                <asp:BoundField DataField="GiveDate" HeaderText="GiveDate" />
                <asp:BoundField DataField="ReturnDate" HeaderText="ReturnDate" />
            </Columns>
            <HeaderStyle CssClass="header" />
        </asp:GridView>
    </div>
</asp:Content>
