<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="VareAdmin.aspx.cs" Inherits="Admin_VareAdmin" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="../Scripts/ckeditor/config.js"></script>
    <script src="../Scripts/ckeditor/ckeditor.js"></script>
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <asp:Panel ID="Panel_VisAlleVare" runat="server" Visible="false">
                <h1 class="text-center">Vare admin</h1>
                <asp:Repeater ID="Repeater_AlleVare" runat="server" ItemType="Vare">

                    <HeaderTemplate>
                        <p><a href="VareAdmin.aspx?handling=opret" class="btn btn-sm btn-success"><i class="glyphicon glyphicon-plus"></i>Tilføj Vare</a></p>

                        <table class="table table-hover">
                            <tr>
                                <th style="width: 50px;">Ret</th>
                                <th style="width: 50px;">Slet</th>
                                <th style="width: 60px;">Id</th>
                                <th>Vare</th>


                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <a href="VareAdmin.aspx?handling=rediger&amp;vare_id=<%# Item.V_Id %>"
                                    class="btn btn-sm btn-primary"
                                    title="Rediger"><i class="glyphicon glyphicon-pencil"></i></a>
                            </td>
                            <td>
                                <a href="VareAdmin.aspx?handling=slet&amp;vare_id=<%# Item.V_Id %>"
                                    class="btn btn-sm btn-warning"
                                    title="Slet"
                                    onclick="return confirm('Er du sikker på du vil slette? -Alle tilbud der er koblet op på varen bliver også slettet')"><i class="glyphicon glyphicon-trash"></i></a>
                            </td>
                            <td><%# Item.V_Id %></td>
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
                    <h5>Kategori</h5>
                    <asp:DropDownList ID="DropDownList_Kategori" runat="server"></asp:DropDownList>
                    <br />
                    <h5>Mærke</h5>
                    <asp:DropDownList ID="DropDownList_Maerke" runat="server"></asp:DropDownList>
                    <br />
                    <h5>Vare navn</h5>
                    <asp:TextBox ID="TextBox_Navn" runat="server" placeholder="Navn" CssClass="form-control"></asp:TextBox>
                    <br />
                    <h5>Vare beskrivelse</h5>
                    <asp:TextBox ID="TextBox_Beskrivelse" runat="server" placeholder="Beskrivelse" CssClass="form-control" TextMode="MultiLine" Rows="10" ClientIDMode="Static"></asp:TextBox>
                    <script>
                        CKEDITOR.replace('TextBox_Beskrivelse');
                    </script>
                    <br />
                    <h5>Vare pris</h5>
                    <asp:TextBox ID="TextBox_Pris" runat="server" placeholder="Pris" CssClass="form-control"></asp:TextBox>
                    <br />
                    <h5>Vare billede</h5>
                    <asp:FileUpload ID="FileUpload_Billede" runat="server" />
                    <br />
                    <asp:Panel ID="Panel_RedigerBilledeVisGammelt" runat="server" Visible="true">
                        <asp:Repeater ID="Repeater_Billede" runat="server" ItemType="Vare">
                            <ItemTemplate>
                                <img src="../Billeder/Resized/<%# Item.Billeder.Sti %>" alt="" />
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <br />

                    <asp:Button ID="Button_GemVare" runat="server" Text="Gem" OnClick="Button_GemVare_Click" CssClass="btn btn-success" />
                    <asp:Button ID="Button_GemRedigeret" runat="server" CssClass="btn btn-success" Text="Gem" OnClick="Button_GemRedigeret_Click" Visible="false" />

                    <a href="VareAdmin.aspx" class="btn btn-default" onclick="return confirm('Er du sikker på du vil annullere?')">Annuller</a>
                    <br />
                    <asp:Label ID="Label_Error" runat="server" Text="" Style="color: red;"></asp:Label>

                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

