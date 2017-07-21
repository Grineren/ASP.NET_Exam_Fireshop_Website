<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NyhedsSide.aspx.cs" Inherits="NyhedsSide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-9 paddingBot50px">
        <div class="row paddingBot20px">
            <div class="col-md-12">
                <div class="row">
                    <h4 class="pull-right red paddignright15px">NYHEDER</h4>

                </div>
                <hr style="margin: 0px;" />

            </div>
        </div>

        <asp:ListView ID="ListView_Nyheder" runat="server" ItemType="Nyheder">
            <ItemTemplate>
                <strong><%# Item.Overskrift %></strong>
                <p><%# Item.Dato %></p>
                <p><%# Item.Tekst %></p>
                <hr style="border-color: red;" />
            </ItemTemplate>
        </asp:ListView>
        <p class="text-center">
            <asp:DataPager ID="DataPager_Nyheder" PagedControlID="ListView_Nyheder" PageSize="3" runat="server" OnPreRender="DataPager_Nyheder_PreRender">
                <Fields>

                    <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="false" ButtonCssClass="btn btn-sm red" FirstPageText="Første" PreviousPageText="<"></asp:NextPreviousPagerField>
                    <asp:NumericPagerField NumericButtonCssClass="red"></asp:NumericPagerField>
                    <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="false" ButtonCssClass="btn btn-sm red" NextPageText=">" LastPageText="Sidste"></asp:NextPreviousPagerField>

                </Fields>
            </asp:DataPager>
        </p>
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

