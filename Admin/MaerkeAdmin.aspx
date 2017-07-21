<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="MaerkeAdmin.aspx.cs" Inherits="Admin_MaerkeAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <asp:Panel ID="Panel_VisAlleMaerker" runat="server" Visible="false">
                <h1 class="text-center">Mærker admin</h1>

                <asp:Repeater ID="Repeater_AlleMaerker" runat="server" ItemType="Maerke">

                    <HeaderTemplate>
                        <p><a href="MaerkeAdmin.aspx?handling=opret" class="btn btn-sm btn-success"><i class="glyphicon glyphicon-plus"></i>Tilføj mærke</a></p>

                        <table class="table table-hover">
                            <tr>
                                <th style="width: 50px;">Ret</th>
                                <th style="width: 50px;">Slet</th>
                                <th style="width: 60px;">Id</th>
                                <th>Mærke</th>


                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <a href="MaerkeAdmin.aspx?handling=rediger&amp;maerke_id=<%# Item.M_Id %>"
                                    class="btn btn-sm btn-primary"
                                    title="Rediger"><i class="glyphicon glyphicon-pencil"></i></a>
                            </td>
                            <td>
                                <a href="MaerkeAdmin.aspx?handling=slet&amp;maerke_id=<%# Item.M_Id %>"
                                    class="btn btn-sm btn-warning"
                                    title="Slet"
                                    onclick="return confirm('Er du sikker på du vil slette? -Alle vare der er koblet op på den mærket bliver også slettet')"><i class="glyphicon glyphicon-trash"></i></a>
                            </td>
                            <td><%# Item.M_Id %></td>
                            <td><%# Item.Brand %></td>


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
                    <h5>Kategori</h5>
                    <asp:DropDownList ID="DropDownList_Kategori" runat="server"></asp:DropDownList>
                    <br />
                    <h5>Vare navn</h5>
                    <asp:TextBox ID="TextBox_Navn" runat="server" placeholder="Navn" CssClass="form-control"></asp:TextBox>
                    <br />
                    <h5>Beskrivelse</h5>
                    <asp:TextBox ID="TextBox_Beskrivelse" runat="server" placeholder="Navn" CssClass="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>
                    <br />
                    <h5>Vare billede</h5>
                    <asp:FileUpload ID="FileUpload_Billede" runat="server" />
                    <br />
                    <asp:Repeater ID="Repeater_Billede" runat="server" ItemType="Maerke">
                        <ItemTemplate>
                            <img src="../Billeder/Maerker/<%# Item.Billede %>" alt="" />
                        </ItemTemplate>
                    </asp:Repeater>
                    <br />

                    <asp:Button ID="Button_GemMaerke" runat="server" Text="Gem" OnClick="Button_GemMaerke_Click" CssClass="btn btn-success" />
                    <asp:Button ID="Button_GemRedigeret" runat="server" CssClass="btn btn-success" Text="Gem" OnClick="Button_GemRedigeret_Click" Visible="false" />

                    <a href="MaerkeAdmin.aspx" class="btn btn-default" onclick="return confirm('Er du sikker på du vil annullere?')">Annuller</a>
                    <br />
                    <asp:Label ID="Label_Error" runat="server" Text="" Style="color: red;"></asp:Label>

                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

