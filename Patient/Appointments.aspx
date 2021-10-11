<%@ Page Title="" Language="C#" MasterPageFile="~/Site Patient.master" AutoEventWireup="true" CodeFile="Appointments.aspx.cs" Inherits="Patient_Appointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <span style="font-size: xx-large">Manage Appointments</span><span style="font-size: x-large"><br style="text-decoration: underline" />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Patient/CreateAppointment.aspx" style="font-size: large">Schedule Appointment</asp:HyperLink>
        </span>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Patient/ViewAppointments.aspx" style="font-size: large">View/Delete Appointments</asp:HyperLink>
    </p>
    <p>
        &nbsp;</p>
    <p>
    </p>
</asp:Content>

