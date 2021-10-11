<%@ Page Title="" Language="C#" MasterPageFile="~/Site Patient.master" AutoEventWireup="true" CodeFile="ViewAppointments.aspx.cs" Inherits="Patient_ViewAppointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p style="font-size: xx-large">
        Your Appointments</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AppointmentID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="AppointmentID" HeaderText="AppointmentID" ReadOnly="True" SortExpression="AppointmentID" />
                <asp:BoundField DataField="PatientUserName" HeaderText="PatientUserName" SortExpression="PatientUserName" />
                <asp:BoundField DataField="DoctorUserName" HeaderText="DoctorUserName" SortExpression="DoctorUserName" />
                <asp:BoundField DataField="AppointmentDate" HeaderText="AppointmentDate" SortExpression="AppointmentDate" />
                <asp:BoundField DataField="AppointmentTime" HeaderText="AppointmentTime" SortExpression="AppointmentTime" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [tblAppointment] WHERE [AppointmentID] = @AppointmentID" InsertCommand="INSERT INTO [tblAppointment] ([PatientUserName], [DoctorUserName], [AppointmentDate], [AppointmentTime], [Description]) VALUES (@PatientUserName, @DoctorUserName, @AppointmentDate, @AppointmentTime, @Description)" SelectCommand="SELECT [AppointmentID], [PatientUserName], [DoctorUserName], [AppointmentDate], [AppointmentTime], [Description] FROM [tblAppointment] WHERE ([PatientUserName] = @PatientUserName)" UpdateCommand="UPDATE [tblAppointment] SET [PatientUserName] = @PatientUserName, [DoctorUserName] = @DoctorUserName, [AppointmentDate] = @AppointmentDate, [AppointmentTime] = @AppointmentTime, [Description] = @Description WHERE [AppointmentID] = @AppointmentID">
            <DeleteParameters>
                <asp:Parameter Name="AppointmentID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PatientUserName" Type="String" />
                <asp:Parameter Name="DoctorUserName" Type="String" />
                <asp:Parameter Name="AppointmentDate" Type="String" />
                <asp:Parameter Name="AppointmentTime" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="PatientUserName" SessionField="Name" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="PatientUserName" Type="String" />
                <asp:Parameter Name="DoctorUserName" Type="String" />
                <asp:Parameter Name="AppointmentDate" Type="String" />
                <asp:Parameter Name="AppointmentTime" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="AppointmentID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

