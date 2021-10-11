<%@ Page Title="" Language="C#" MasterPageFile="~/Site Doctor.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Doctor_Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p style="font-size: x-large">
        Search Patients</p>
    <p style="font-size: x-large">
        Enter Patient&#39;s User ID:<asp:TextBox ID="TextBox1" runat="server" style="font-size: large"></asp:TextBox>
    </p>
    <p style="font-size: x-large">
        Search Patients</p>
    <p style="font-size: x-large">
&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="font-size: large" Text="Search" />
    </p>
    <p style="font-size: x-large">
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </p>
</asp:Content>

