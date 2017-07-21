<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Tilbehor.aspx.cs" Inherits="Tilbehor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel_MaerkeVaelg" runat="server">
        <div class="col-md-9">
            <div class="row paddingBot20px">
                <div class="col-md-12">
                    <div class="row">
                        <h4 class="pull-right red paddignright15px">TILBEHØR</h4>

                    </div>
                    <hr style="margin: 0px;" />

                </div>
            </div>
            <div class="row">

                <div class="col-md-8 col-md-offset-2">

                    <asp:Repeater ID="Repeater_Maerke" runat="server" ItemType="Maerke">
                        <ItemTemplate>
                            <div class="col-md-4">
                                <img src="Billeder/Maerker/<%# Item.Billede %>" class="paddingTop20px" width="100px" height="100px" />
                                <br />
                                <a href="Tilbehor.aspx?maerke_id=<%# Item.M_Id %>" class="red"><%# Item.Brand %></a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>


                </div>

            </div>


        </div>
    </asp:Panel>
    <asp:Panel ID="PanelEnkeltMaerke" runat="server" Visible="false">

        <div class="col-md-9">
            <div class="row">
                <asp:Repeater ID="Repeater_MaerkeBeskrivelse" runat="server" ItemType="Maerke">
                    <ItemTemplate>
                        <div class="col-md-12">
                            <h4 class="pull-right red  paddignright15px"><%# Item.Brand %></h4>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
            <hr style="margin: 0px;" />

            <div class="row">

                <asp:ListView ID="ListView_EnkeltMaerke" runat="server" ItemType="Vare">
                    <ItemTemplate>
                        <div class="col-md-12">
                            <div class="col-md-3">
                                <%# HentBilledeStiOgNavn(Container.DataItemIndex) %>
                            </div>
                            <div class="col-md-9">
                                <a href="Tilbehor.aspx?vare_id=<%# Item.V_Id %>">
                                    <h2><%# Item.Navn %></h2>
                                </a>
                                <p><%# Item.Beskrivelse.ToString().Length >=50?Item.Beskrivelse.ToString().Substring(0, 50) + " ...": Item.Beskrivelse %></p>
                                <small>Pris: <%# Item.Pris %></small>
                            </div>
                        </div>


                    </ItemTemplate>
                </asp:ListView>

            </div>


        </div>
    </asp:Panel>
    <asp:Panel ID="Panel_EnkeltVare" runat="server" Visible="false">
        <div class="col-md-9">


            <div class="row">
                <asp:Repeater ID="Repeater_EnkeltVareMaerkeHeader" runat="server" ItemType="Vare">
                    <ItemTemplate>
                        <div class="col-md-12">
                            <h4 class="pull-right red  paddignright15px"><%# Item.Maerke.Brand %></h4>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <hr style="margin: 0px;" />
            <div class="row">
                <asp:ListView ID="ListView_EnkeltVare" runat="server" ItemType="Vare">
                    <ItemTemplate>
                        <div class="col-md-12">
                            <div class="col-md-3">


                                <a id="single_image" href="Billeder/Orginal/<%# Item.Billeder.Sti %>">
                                    <img src="Billeder/Resized/<%# Item.Billeder.Sti %>" class="center-block paddingtop50px" />
                                </a>
                            </div>
                            <div class="col-md-9">
                                <h2><%# Item.Navn %></h2>
                                <p><%# Item.Beskrivelse %></p>
                                <small>Pris: <%# Item.Pris %></small>
                            </div>
                        </div>


                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </asp:Panel>
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

