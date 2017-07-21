<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="TilbudAdmin.aspx.cs" Inherits="Admin_TilbudAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <asp:Panel ID="Panel_VisAlleTilbud" runat="server" Visible="false">
                <h1 class="text-center">Tilbud admin</h1>

                <asp:Repeater ID="Repeater_AlleTilbud" runat="server" ItemType="Tilbud">

                    <HeaderTemplate>
                        <p><a href="TilbudAdmin.aspx?handling=opret" class="btn btn-sm btn-success"><i class="glyphicon glyphicon-plus"></i>Tilføj tilbud</a></p>

                        <table class="table table-hover">
                            <tr>
                                <th style="width: 50px;">Ret</th>
                                <th style="width: 50px;">Slet</th>
                                <th style="width: 60px;">Id</th>
                                <th>Tilbud</th>


                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <a href="TilbudAdmin.aspx?handling=rediger&amp;tilbud_id=<%# Item.T_Id %>"
                                    class="btn btn-sm btn-primary"
                                    title="Rediger"><i class="glyphicon glyphicon-pencil"></i></a>
                            </td>
                            <td>
                                <a href="TilbudAdmin.aspx?handling=slet&amp;tilbud_id=<%# Item.T_Id %>"
                                    class="btn btn-sm btn-warning"
                                    title="Slet"
                                    onclick="return confirm('Er du sikker på du vil slette?')"><i class="glyphicon glyphicon-trash"></i></a>
                            </td>
                            <td><%# Item.T_Id %></td>
                            <td><%# Item.Vare.Navn %></td>


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
                    <h5>Vælg vare</h5>
                    <asp:DropDownList ID="DropDownList_Vare" runat="server"></asp:DropDownList>
                    <br />
                    <h5>Tilbud procent på prisen</h5>
                    <asp:TextBox ID="TextBox_TilbudPct" runat="server" placeholder="Tilbud i procent" CssClass="form-control"></asp:TextBox>
                    <br />
                    <asp:Panel ID="Panel_VisStartOgSlutRepeater" runat="server" Visible="false">
                        <asp:Repeater ID="Repeater_CurrentStartOgSlut" runat="server" ItemType="Tilbud">
                            <ItemTemplate>
                                <p><strong>Start dato:</strong> <%# Item.StartDato %> </p>
                                <p> <strong>Slut dato:</strong> <%# Item.SlutDato %></p>
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <h5>Dato tilbudes skal starte</h5>
                    <asp:Calendar ID="Calendar_Start" runat="server"></asp:Calendar>
                    <br />
                    <h5>Dato tilbudes skal slutte</h5>

                    <asp:Calendar ID="Calendar_Date" runat="server"></asp:Calendar>





                    <asp:Button ID="Button_GemTilbud" runat="server" Text="Gem" OnClick="Button_GemTilbud_Click" CssClass="btn btn-success" />
                    <asp:Button ID="Button_GemRedigeret" runat="server" Text="Gem" OnClick="Button_GemRedigeret_Click" CssClass="btn btn-success" Visible="false" />


                    <a href="TilbudAdmin.aspx" class="btn btn-default" onclick="return confirm('Er du sikker på du vil annullere?')">Annuller</a>
                    <br />
                    <asp:Label ID="Label_Error" runat="server" Text="" Style="color: red;"></asp:Label>

                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

