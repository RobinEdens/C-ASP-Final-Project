<%@ Page Title="" Language="C#" MasterPageFile="~/Site Patient.master" AutoEventWireup="true" CodeFile="NewMessage.aspx.cs" Inherits="Patient_Messaging_NewMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Patient/Messaging/Inbox.aspx">View Inbox</asp:HyperLink>
            </td>
        </tr>
            <tr>
                <td style="width: 15px">
                    <asp:Label ID="Label3" runat="server" Text="To:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15px">
                    <asp:TextBox ID="TextBox1" runat="server" Width="400px" MaxLength="40"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 22px">
                    <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15px">
                    <asp:Label ID="Label2" runat="server" Text="Message:"></asp:Label>
                </td>
                <td style="width: 100px"></td>
                <td class="text-left">

                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 15px; height: 258px;">
                    <asp:TextBox ID="TextBox3" runat="server" Height="250px" TextMode="MultiLine" Width="400px" MaxLength="1000"></asp:TextBox>
                </td>
                <td style="width: 100px"></td>
                <td>

                    <asp:Label ID="Label8" runat="server" Text="Your Doctor"></asp:Label>

                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DoctorID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="DoctorPhone" HeaderText="Phone" SortExpression="DoctorPhone" />
                            <asp:BoundField DataField="UserName" HeaderText="Doctor" SortExpression="UserName" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblDoctor] WHERE ([DoctorID] = @DoctorID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="DoctorID" SessionField="GetDoctor" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </td>
            </tr>
        <tr>
            <td>

                <asp:Label ID="Label6" runat="server" ForeColor="Red"></asp:Label>

            </td>
        </tr>
            <tr>
                <td class="text-left" style="width: 15px">
                    <asp:Button ID="Button1" runat="server" Height="30px" OnClick="Button1_Click" Text="Send" Width="100px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
</asp:Content>

