<%@ Page Title="" Language="C#" MasterPageFile="~/Site Doctor.master" AutoEventWireup="true" CodeFile="NewMessage.aspx.cs" Inherits="Doctor_Messaging_NewMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Doctor/Messaging/Inbox.aspx">View Inbox</asp:HyperLink>
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
                <td>
                    <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15px">
                    <asp:Label ID="Label2" runat="server" Text="Message:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 15px; height: 258px;">
                    <asp:TextBox ID="TextBox3" runat="server" Height="250px" TextMode="MultiLine" Width="400px" MaxLength="1000"></asp:TextBox>
                </td>
                <td style="width: 100px">

                </td>
                <td>

                    <asp:Label ID="Label7" runat="server" Text="Your Patients"></asp:Label>
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PatientID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="UserName" HeaderText="Email" SortExpression="UserName" />
                            <asp:BoundField DataField="UserPhone" HeaderText="Phone" SortExpression="UserPhone" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [tblPatient] WHERE [PatientID] = @PatientID" InsertCommand="INSERT INTO [tblPatient] ([Name], [UserName], [UserPhone]) VALUES (@Name, @UserName, @UserPhone)" SelectCommand="SELECT [PatientID], [Name], [UserName], [UserPhone] FROM [tblPatient] WHERE ([DoctorID] = @DoctorID)" UpdateCommand="UPDATE [tblPatient] SET [Name] = @Name, [UserName] = @UserName, [UserPhone] = @UserPhone WHERE [PatientID] = @PatientID">
                        <DeleteParameters>
                            <asp:Parameter Name="PatientID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="UserPhone" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="DoctorID" SessionField="GetID" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="UserPhone" Type="String" />
                            <asp:Parameter Name="PatientID" Type="Int32" />
                        </UpdateParameters>
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
