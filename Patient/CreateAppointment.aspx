<%@ Page Title="" Language="C#" MasterPageFile="~/Site Patient.master" AutoEventWireup="true" CodeFile="CreateAppointment.aspx.cs" Inherits="Patient_CreateAppointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p style="font-size: xx-large">
        Schedule Appointment</p>
    <p>
        <asp:Label ID="Label5" runat="server" Text="Select Date:" style="font-size: large"></asp:Label>
        <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px" OnSelectionChanged="Calendar1_SelectionChanged">
            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
            <OtherMonthDayStyle ForeColor="#CC9966" />
            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
            <SelectorStyle BackColor="#FFCC66" />
            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        </asp:Calendar>
    </p>
    <p>
        <asp:Label ID="Label6" runat="server" style="font-size: large" Text="Select Time:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" TextMode="Time"></asp:TextBox>
        <asp:Label ID="Label7" runat="server" style="font-size: large" Text="Please include AM or PM"></asp:Label>
    </p>
    <p>
        <asp:Label ID="Label8" runat="server" style="font-size: large" Text="Description:"></asp:Label>
    </p>
    <p>
        <asp:TextBox ID="TextBox3" runat="server" Height="96px" Width="403px"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Height="35px" Text="Submit" Width="247px" OnClick="Button1_Click" />
    </p>
    <p>
        <asp:Label ID="Label9" runat="server" style="font-size: large"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

