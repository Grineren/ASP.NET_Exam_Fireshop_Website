<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="ForsideAdmin.aspx.cs" Inherits="Admin_ForsideAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <asp:Panel ID="Panel_VisAlleForside" runat="server" Visible="false">
                <h1 class="text-center">Forside admin</h1>

                <asp:Repeater ID="Repeater_AlleForside" runat="server" ItemType="Forside">

                    <HeaderTemplate>


                        <table class="table table-hover">
                            <tr>
                                <th style="width: 50px;">Ret</th>

                                <th style="width: 60px;">Id</th>
                                <th>Forside</th>


                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <a href="ForsideAdmin.aspx?handling=rediger&amp;forside_id=<%# Item.F_Id %>"
                                    class="btn btn-sm btn-primary"
                                    title="Rediger"><i class="glyphicon glyphicon-pencil"></i></a>
                            </td>

                            <td><%# Item.F_Id %></td>
                            <td><%# Item.Overskrift %></td>


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

                    <h5>Overskrift</h5>
                    <asp:TextBox ID="TextBox_Overskrift" runat="server" placeholder="Overskrift" CssClass="form-control"></asp:TextBox>
                    <br />
                    <h5>Tekst</h5>
                    <asp:TextBox ID="TextBox_Tekst" runat="server" placeholder="Tekst" CssClass="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>
                    <br />
                    <asp:FileUpload ID="FileUpload_Billede" runat="server" />
                    <asp:Repeater ID="Repeater_Billede" runat="server" ItemType="Forside">
                        <ItemTemplate>
                            <img src="../Billeder/<%# Item.Billede %>" alt="" />
                        </ItemTemplate>
                    </asp:Repeater>

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

