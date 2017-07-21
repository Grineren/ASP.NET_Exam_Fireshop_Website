<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="col-md-9 paddingBot50px">
        <asp:Repeater ID="Repeater_Forside" runat="server" ItemType="Forside">
            <ItemTemplate>
                
                <h1><%# Item.Overskrift %></h1>
                <hr />
                <div class="row">
                    <div class="col-md-12">

                        <img class="floatRight" src="Billeder/<%# Item.Billede %>" style="padding: 5px;" />

                        <p><%# Item.Tekst.Replace(".",". <br /> <br />") %></p>

                    </div>

                </div>

            </ItemTemplate>
        </asp:Repeater>

    </div>

    <div class="col-md-3 borderLeft">

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

    </div>

</asp:Content>

