<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="KontaktSide.aspx.cs" Inherits="KontaktSide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-9 paddingBot50px borderRight">
        <div class="row paddingBot20px">
            <div class="col-md-12">
                <div class="row">
                    <h4 class="pull-right red paddignright15px">KONTAKT</h4>

                </div>
            <hr style="margin: 0px;" />
                
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <asp:Repeater ID="Repeater_KontaktOplysninger" runat="server" ItemType="Kontakt">
                    <ItemTemplate>
                        <p><%# Item.Navn %></p>
                        <p><%# Item.Adresse %></p>
                        <p><%# Item.PostnrOgBy %></p>
                        <p>+45 <%# Item.Tlf %></p>
                        <p class="paddingBot20px"><%# Item.Mail %></p>
                    </ItemTemplate>
                </asp:Repeater>
                <p>Evt. firmanavn</p>
                <asp:TextBox ID="TextBox_Firmanavn" runat="server" CssClass="width100p"></asp:TextBox>
                <p>Kontaktperson</p>
                <asp:TextBox ID="TextBox_Kontaktperson" runat="server" CssClass="width100p"></asp:TextBox>
                <p>Telefon</p>
                <asp:TextBox ID="TextBox_Telefon" runat="server" CssClass="width100p"></asp:TextBox>
                <p>E-mail</p>
                <asp:TextBox ID="TextBox_Email" runat="server" CssClass="width100p" type="email"></asp:TextBox>
                <p>Spørgsmål</p>
                <asp:TextBox ID="TextBox_Sporgsmal" runat="server" TextMode="MultiLine" Rows="5" CssClass="width100p"></asp:TextBox>
                <br />
                <asp:Button ID="Button_Send" runat="server" Text="Ok" OnClick="Button_Send_Click" />
                <asp:Label ID="Label_Error" runat="server" Text="" Style="color: red;"></asp:Label>
            </div>
            <div class="col-md-8">
                <img src="Billeder/danmarkskort.gif" class="pull-right paddingtop50px" />
            </div>
        </div>


    </div>
    <div class="col-md-3">
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

