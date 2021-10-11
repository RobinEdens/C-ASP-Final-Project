<%@ Page Title="" Language="C#" MasterPageFile="~/Site Patient.master" AutoEventWireup="true" CodeFile="Inbox.aspx.cs" Inherits="Doctor_Messaging_Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
        <table style="width:100%;">
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Patient/Messaging/NewMessage.aspx">Send New Message</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Inbox"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EmailID" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                            <asp:BoundField DataField="UserNameFrom" HeaderText="Sender" ReadOnly="True" SortExpression="UserNameFrom" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [tblEmail] WHERE [EmailID] = @EmailID" InsertCommand="INSERT INTO [tblEmail] ([UserNameFrom]) VALUES (@UserNameFrom)" SelectCommand="SELECT [EmailID], [UserNameFrom] FROM [tblEmail] WHERE ([UserNameTO] = @UserNameTO)" UpdateCommand="UPDATE [tblEmail] SET [UserNameFrom] = @UserNameFrom WHERE [EmailID] = @EmailID">
                        <DeleteParameters>
                            <asp:Parameter Name="EmailID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="UserNameFrom" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="UserNameTO" SessionField="Name" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="UserNameFrom" Type="String" />
                            <asp:Parameter Name="EmailID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="From:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Message:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Height="200px" ReadOnly="True" TextMode="MultiLine" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table>
</asp:Content>
