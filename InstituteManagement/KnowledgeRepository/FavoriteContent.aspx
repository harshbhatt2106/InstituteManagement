<%@ Page Title="" Language="C#" MasterPageFile="~/KnowledgeRepository/KnowledgeRepository.Master" AutoEventWireup="true" CodeBehind="FavoriteContent.aspx.cs" Inherits="InstituteManagement.KnowledgeRepository.FavoriteContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@900&family=Poppins:wght@500&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
        }

        .CategoryList {
            position: absolute;
            top: 14vh;
            width: 12%;
            height: 40px;
            background-color: skyblue;
            border-radius: 20px;
            font-family: 'Poppins', sans-serif;
            font-size: medium;
            left: 5vh;
        }

        .button {
            bottom: 1vh;
            left: 180vh;
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

        .ShowContent {
            bottom: 2vh;
            left: 170vh;
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
            position: absolute;
            text-align: center;
            text-transform: none;
            transition: box-shadow 280ms cubic-bezier(.4, 0, .2, 1),opacity 15ms linear 30ms,transform 270ms cubic-bezier(0, 0, .2, 1) 0ms;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            width: auto;
            will-change: transform,opacity;
            z-index: 0;
            width: 120px;
        }

            .ShowContent:hover {
                background: #F6F9FE;
                color: #174ea6;
            }

            .ShowContent:active {
                box-shadow: 0 4px 4px 0 rgb(60 64 67 / 30%), 0 8px 12px 6px rgb(60 64 67 / 15%);
                outline: none;
            }

            .ShowContent:focus {
                outline: none;
                border: 2px solid #4285f4;
            }

            .ShowContent:not(:disabled) {
                box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
            }

                .ShowContent:not(:disabled):hover {
                    box-shadow: rgba(60, 64, 67, .3) 0 2px 3px 0, rgba(60, 64, 67, .15) 0 6px 10px 4px;
                }

                .ShowContent:not(:disabled):focus {
                    box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
                }

                .ShowContent:not(:disabled):active {
                    box-shadow: rgba(60, 64, 67, .3) 0 4px 4px 0, rgba(60, 64, 67, .15) 0 8px 12px 6px;
                }

            .ShowContent:disabled {
                box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
            }

        .AddToFevorite {
            bottom: 2vh;
            left: 190vh;
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
            position: absolute;
            text-align: center;
            text-transform: none;
            transition: box-shadow 280ms cubic-bezier(.4, 0, .2, 1),opacity 15ms linear 30ms,transform 270ms cubic-bezier(0, 0, .2, 1) 0ms;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            width: auto;
            will-change: transform,opacity;
            z-index: 0;
            width: 153px;
        }

            .AddToFevorite:hover {
                background: #F6F9FE;
                color: #174ea6;
            }

            .AddToFevorite:active {
                box-shadow: 0 4px 4px 0 rgb(60 64 67 / 30%), 0 8px 12px 6px rgb(60 64 67 / 15%);
                outline: none;
            }

            .AddToFevorite:focus {
                outline: none;
                border: 2px solid #4285f4;
            }

            .AddToFevorite:not(:disabled) {
                box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
            }

                .AddToFevorite:not(:disabled):hover {
                    box-shadow: rgba(60, 64, 67, .3) 0 2px 3px 0, rgba(60, 64, 67, .15) 0 6px 10px 4px;
                }

                .AddToFevorite:not(:disabled):focus {
                    box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
                }

                .AddToFevorite:not(:disabled):active {
                    box-shadow: rgba(60, 64, 67, .3) 0 4px 4px 0, rgba(60, 64, 67, .15) 0 8px 12px 6px;
                }

            .AddToFevorite:disabled {
                box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
            }

        .ShowRepositories {
            display: inline-block;
            padding: 20px;
            background-color: #ecf0f3;
            box-shadow: 10px 10px 10px #d1d9e6, -10px -10px 10px #f9f9f9;
            border-radius: 12px;
            transition: box-shadow 0.3s ease;
            position: relative;
            top: 3vh;
            flex-direction: column;
            height: 10vh;
            width: 215vh;
            margin-bottom: 10px;
        }

        .label {
            margin: 80px; 
        }

        .UploadedDate {
            position: absolute;
            left: 120vh;
        }

        .DocumentType {
            position: absolute;
            left: 95vh;
        }

        .StudentName {
            position: absolute;
            left: 70vh;
        }

        .Title {
            position: absolute;
            left: 50vh;
            text-overflow: ellipsis;
        }

        .CategoryName {
            position: absolute;
            left: 20vh;
        }

        .KnowladgeRepositorylable {
            position: relative;
            font-weight: bold;
            font-size: 30px;
            left: 87vh;
            font-family: 'Poppins', sans-serif;
        }   
        .message {
            position: relative;
            top:25vh;
            font-size: 30px;
            left: 50vh;
            font-family: 'Poppins', sans-serif;
        }

        .Contentid {
            display: none;
        }
    </style>
    <asp:Label ID="lable" runat="server" Text="Favorite Content" CssClass="KnowladgeRepositorylable"></asp:Label>
    <asp:Label ID="message" runat="server"  CssClass="message" ></asp:Label>

    <asp:DataList ID="ShowRepositories" runat="server" RepeatDirection="Vertical">
        <ItemTemplate>
            <div class="ShowRepositories">
                <div class="lable">
                    <asp:Label ID="CategoryName" runat="server" Text='<%# Eval("CategoryName") %>' CssClass="CategoryName"></asp:Label>
                    <asp:Label ID="contentid" runat="server" Text='<%# Eval("ContentId") %>' CssClass="Contentid"></asp:Label>
                    <asp:Label ID="Title" runat="server" Text='<%#  Eval("Title")%>' CssClass="Title"></asp:Label>
                    <asp:Label ID="StudentName" runat="server" Text='<%# Eval("StudentName") %>' CssClass="StudentName"></asp:Label>
                    <asp:Label ID="DocumentType" runat="server" Text='<%# Eval("DocumentType") %>' CssClass="DocumentType"></asp:Label>
                    <asp:Label ID="UploadedDate" runat="server" Text='<%# Eval("UploadedDate") %>' CssClass="UploadedDate"></asp:Label>
                    <asp:Button ID="ShowContent" runat="server" CssClass="ShowContent" OnClick="ShowContent_Click" Text="Show Content" />
                    <asp:Button ID="Remove" runat="server" CssClass="AddToFevorite" OnClick="Remove_Click" Text="Remove From Favorite" />
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>

</asp:Content>
