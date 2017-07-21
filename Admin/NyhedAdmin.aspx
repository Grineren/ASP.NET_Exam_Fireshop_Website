<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="NyhedAdmin.aspx.cs" Inherits="Admin_NyhedAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <asp:Panel ID="Panel_VisAlleNyheder" runat="server" Visible="false">
                <h1 class="text-center">Nyheder admin</h1>
               
                <asp:Repeater ID="Repeater_AlleNyheder" runat="server" ItemType="Nyheder">

                    <HeaderTemplate>
                        <p><a href="NyhedAdmin.aspx?handling=opret" class="btn btn-sm btn-success"><i class="glyphicon glyphicon-plus"></i>Tilføj nyhed</a></p>

                        <table class="table table-hover">
                            <tr>
                                <th style="width: 50px;">Ret</th>
                                <th style="width: 50px;">Slet</th>
                                <th style="width: 60px;">Id</th>
                                <th>Nyhed</th>


                            </tr>
                    </HeaderTemplate>
                       <ItemTemplate>
                        <tr>
                            <td>
                                <a href="NyhedAdmin.aspx?handling=rediger&amp;nyhed_id=<%# Item.N_Id %>"
                                    class="btn btn-sm btn-primary"
                                    title="Rediger"><i class="glyphicon glyphicon-pencil"></i></a>
                            </td>
                            <td>
                                <a href="NyhedAdmin.aspx?handling=slet&amp;nyhed_id=<%# Item.N_Id %>"
                                    class="btn btn-sm btn-warning"
                                    title="Slet"
                                    onclick="return confirm('Er du sikker på du vil slette?')"><i class="glyphicon glyphicon-trash"></i></a>
                            </td>
                            <td><%# Item.N_Id %></td>
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
                    
                    <h5>Nyhed overskrift</h5>
                    <asp:TextBox ID="TextBox_Overskrift" runat="server" placeholder="Overskrift" CssClass="form-control"></asp:TextBox>
                    <br />
                    <h5>Tekst</h5>
                    <asp:TextBox ID="TextBox_Tekst" runat="server" placeholder="Tekst" CssClass="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>
                    <br />
                    

                    <asp:Button ID="Button_GemNyhed" runat="server" Text="Gem" OnClick="Button_GemNyhed_Click" CssClass="btn btn-success" />
                    <asp:Button ID="Button_GemRedigeret" runat="server" CssClass="btn btn-success" Text="Gem" OnClick="Button_GemRedigeret_Click" Visible="false" />

                    <a href="NyhedAdmin.aspx" class="btn btn-default" onclick="return confirm('Er du sikker på du vil annullere?')">Annuller</a>
                    <br />
                    <asp:Label ID="Label_Error" runat="server" Text="" Style="color: red;"></asp:Label>

                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

