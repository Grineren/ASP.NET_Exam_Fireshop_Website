<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="KontaktAdmin.aspx.cs" Inherits="Admin_KontaktAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <asp:Panel ID="Panel_VisAlleKontakt" runat="server" Visible="false">
                <h1 class="text-center">Kontakt admin</h1>

                <asp:Repeater ID="Repeater_AlleKontakt" runat="server" ItemType="Kontakt">

                    <HeaderTemplate>


                        <table class="table table-hover">
                            <tr>
                                <th style="width: 50px;">Ret</th>

                                <th style="width: 60px;">Id</th>
                                <th>Oplysninger</th>


                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <a href="KontaktAdmin.aspx?handling=rediger&amp;kontakt_id=<%# Item.K_Id %>"
                                    class="btn btn-sm btn-primary"
                                    title="Rediger"><i class="glyphicon glyphicon-pencil"></i></a>
                            </td>

                            <td><%# Item.K_Id %></td>
                            <td><%# Item.Navn %></td>


                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>           
                    </FooterTemplate>

                </asp:Repeater>
            </asp:Panel>
            <asp:Panel ID="Panel_Form" runat="server" Visible="false">
                <h1 class="text-center">
                    <asp:Literal ID="Literal_Legend" runat="server"></asp:Literal></h1>
                <div class="col-md-10 col-md-offset-1">

                    <h5>Navn</h5>
                    <asp:TextBox ID="TextBox_Navn" runat="server" placeholder="Navn" CssClass="form-control"></asp:TextBox>
                    <br />
                    <h5>Adresse</h5>
                    <asp:TextBox ID="TextBox_Adresse" runat="server" placeholder="Adresse" CssClass="form-control"></asp:TextBox>
                    <br />
                    <h5>Postnr og by</h5>
                    <asp:TextBox ID="TextBox_PostnrOgBy" runat="server" placeholder="Postnr og by" CssClass="form-control"></asp:TextBox>
                    <br />
                    <h5>Telefon nr</h5>
                    <asp:TextBox ID="TextBox_Telefon" runat="server" placeholder="Telefon nr" CssClass="form-control"></asp:TextBox>
                    <br />
                    <h5>Mail</h5>
                    <asp:TextBox ID="TextBox_Mail" runat="server" placeholder="Mail" CssClass="form-control"></asp:TextBox>
                    <br />




                    <asp:Button ID="Button_GemRedigeret" runat="server" CssClass="btn btn-success" Text="Gem" OnClick="Button_GemRedigeret_Click" />

                    <a href="MaerkeAdmin.aspx" class="btn btn-default" onclick="return confirm('Er du sikker på du vil annullere?')">Annuller</a>
                    <br />
                    <asp:Label ID="Label_Error" runat="server" Text="" Style="color: red;"></asp:Label>

                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

