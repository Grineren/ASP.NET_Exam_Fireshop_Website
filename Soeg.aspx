<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Soeg.aspx.cs" Inherits="Soeg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-9 paddingBot50px">
        <div class="row paddingBot50px">
            <div class="col-md-12">
                <div class="row">
                    <h4 class="pull-right red paddignright15px">AVANCERET SØG</h4>

                </div>
                <hr style="margin: 0px;" />

            </div>
        </div>
        <asp:Panel ID="Panel_SoegForm" runat="server">
            <p>Kategori:
                <asp:DropDownList ID="DropDownList_Kategori" runat="server"></asp:DropDownList></p>
            <p>Mærke:
                <asp:DropDownList ID="DropDownList_Maerke" runat="server"></asp:DropDownList></p>
            <p>Max pris:
                <asp:TextBox ID="TextBox_MaxPris" runat="server"></asp:TextBox></p>
            <p>Søgeord:
                <asp:TextBox ID="TextBox_Soegeord" runat="server"></asp:TextBox></p>
            <asp:Button ID="Button_Soeg" runat="server" Text="Søg" OnClick="Button_Soeg_Click" />
            <asp:Panel ID="Panel_Fejl" runat="server" Visible="false">
                <p class="red">Der er desvære ikke nogen emner, der matcher dine søgekriterier.</p>
            </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="Panel_SoegResult" runat="server" Visible="false">

            <asp:ListView ID="ListView_Result" runat="server" ItemType="Vare">
                <ItemTemplate>
                    <div class="col-md-12">
                        <div class="col-md-3">

                            <img src="../Billeder/Resized/<%# Item.Billeder.Sti %>" alt="Billede" style="max-height: 200px; max-width: 130px;" class="paddingTop20px" />
                        </div>
                        <div class="col-md-9">
                            <a href="Braendeovne.aspx?vare_id=<%# Item.V_Id %>">
                                <h2><%# Item.Navn %></h2>
                            </a>
                            <p><%# Item.Beskrivelse.ToString().Length >=187?Item.Beskrivelse.ToString().Substring(0, 183) + " ...": Item.Beskrivelse %></p>
                            <small>Pris: <%# Item.Pris %></small>
                        </div>
                    </div>


                </ItemTemplate>
            </asp:ListView>
        </asp:Panel>


    </div>
    <div class="col-md-3 borderLeft">
        <aside>
            <h4>Tilbud</h4>
            <asp:Repeater ID="Repeater_AsideTilbud" runat="server" ItemType="Tilbud">
                <ItemTemplate>
                    <div class="col-md-4 padding0px">
                        <img src="Billeder/Resized/<%# Item.Vare.Billeder.Sti %>" width="60px" class="paddingTop20px" />

                    </div>
                    <div class="col-md-8 paddingBot20px">
                        <h3><%# Item.Vare.Navn %></h3>
                        <p>
                            <del>Kr <%# Item.Vare.Pris %></del>

                        </p>
                        <p class="red">Kr <%# Item.Vare.Pris - (Item.Vare.Pris*Item.TildbudPct/100) %></p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </aside>
    </div>
</asp:Content>

