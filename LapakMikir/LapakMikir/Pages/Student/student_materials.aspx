<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Student/student.Master" AutoEventWireup="true" CodeBehind="student_materials.aspx.cs" Inherits="LapakMikir.Pages.Student.student_materials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="TextAlignCenter">
        <h3 class="FontXLarge" style="margin-bottom:10px;">Materials</h3>
    </div>

    <div class="MarginLeft10px MarginBottom10px">
        <asp:Label ID="Label1" runat="server" Text="Course Name: " ></asp:Label>
        <asp:Label ID="lblCourseName" runat="server" Text="[courseName]" ></asp:Label>
    </div>

    <asp:GridView ID="gvMaterial" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="98%" AllowPaging="True" OnPageIndexChanging="gvMaterial_PageIndexChanging" CssClass="MarginLeft10px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="File">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDownload" runat="server" OnClick="lbtnDownload_Click">Download</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
</asp:Content>
