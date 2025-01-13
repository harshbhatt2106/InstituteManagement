<%@ Page Title="" Language="C#" MasterPageFile="~/KnowledgeRepository/KnowledgeRepository.Master" AutoEventWireup="true" CodeBehind="ShowContent.aspx.cs" Inherits="InstituteManagement.KnowledgeRepository.SHowContent" %>

<%@ Register Assembly="Spire.PdfViewer.Asp" Namespace="Spire.PdfViewer.Asp" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .ShowContent {
            display: inline-block;
            padding: 20px;
            background-color: #ecf0f3;
            box-shadow: 10px 10px 10px #d1d9e6, -10px -10px 10px #f9f9f9;
            border-radius: 12px;
            transition: box-shadow 0.3s ease;
            position: relative;
            top: 3vh;
            flex-direction: column;
            min-height:80vh;
            height: auto;
            width: auto;
            margin-bottom: 10px;
            min-width:80vh;
            transform: translateX(70vh);
        }

        .image {
            position: relative;
            top:3vh;
            left:10vh;
            height: 50vh;
            width: 50vh;
            border-radius:10%;
        }

        .container {
            /*display:flex;*/
        }

        .inline-span {
            font-weight: bolder;
        }

        .open {
            bottom: 2vh;
            left: 18vh;
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

            .open:hover {
                background: #F6F9FE;
                color: #174ea6;
            }

            .open:active {
                box-shadow: 0 4px 4px 0 rgb(60 64 67 / 30%), 0 8px 12px 6px rgb(60 64 67 / 15%);
                outline: none;
            }

            .open:focus {
                outline: none;
                border: 2px solid #4285f4;
            }

            .open:not(:disabled) {
                box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
            }

                .open:not(:disabled):hover {
                    box-shadow: rgba(60, 64, 67, .3) 0 2px 3px 0, rgba(60, 64, 67, .15) 0 6px 10px 4px;
                }

                .open:not(:disabled):focus {
                    box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
                }

                .open:not(:disabled):active {
                    box-shadow: rgba(60, 64, 67, .3) 0 4px 4px 0, rgba(60, 64, 67, .15) 0 8px 12px 6px;
                }

            .open:disabled {
                box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
            }

        .download {
            bottom: 2vh;
            right: 20vh;
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

            .download:hover {
                background: #F6F9FE;
                color: #174ea6;
            }

            .download:active {
                box-shadow: 0 4px 4px 0 rgb(60 64 67 / 30%), 0 8px 12px 6px rgb(60 64 67 / 15%);
                outline: none;
            }

            .download:focus {
                outline: none;
                border: 2px solid #4285f4;
            }

            .download:not(:disabled) {
                box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
            }

                .download:not(:disabled):hover {
                    box-shadow: rgba(60, 64, 67, .3) 0 2px 3px 0, rgba(60, 64, 67, .15) 0 6px 10px 4px;
                }

                .download:not(:disabled):focus {
                    box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
                }

                .download:not(:disabled):active {
                    box-shadow: rgba(60, 64, 67, .3) 0 4px 4px 0, rgba(60, 64, 67, .15) 0 8px 12px 6px;
                }

            .download:disabled {
                box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
            }

        .button-container {
            display: flex;
            margin-top: 10px;
        }
    </style>

    <div class="ShowContent">
        <div class="container">
            <span class="inline-span">Title:</span>
            <asp:Label ID="title" runat="server" Text="Title" CssClass="title-label"></asp:Label>
        </div>

        <div class="container">
            <span class="inline-span">UserName:</span>
            <asp:Label ID="username" runat="server" Text="Username" CssClass="info-label"></asp:Label>
        </div>

        <div class="container">
            <span class="inline-span">Category:</span>
            <asp:Label ID="category" runat="server" Text="Category" CssClass="info-label"></asp:Label>
        </div>

        <div class="container">
            <span class="inline-span">Description:</span>
            <asp:Label ID="Label1" runat="server" Text="Category" CssClass="info-label"></asp:Label>
        </div>

        <asp:Image ID="ProfilePicture" runat="server" CssClass="image" />

        <div class="button-container">
            <asp:Button ID="Open" runat="server" target="_blank"  CssClass="open"  OnClick="Open_Click" Text="open" />
           <asp:Button ID="Download" runat="server" CssClass="download" Text="Download" OnClick="Download_Click" />
        </div>
       <script type="text/javascript">
           function openPdfInNewTab(pdfUrl) {
               window.open(pdfUrl, '_blank');
           }
       </script>
        <cc1:PdfViewer ID="PdfViewer1" runat="server"></cc1:PdfViewer>
    </div>



</asp:Content>
