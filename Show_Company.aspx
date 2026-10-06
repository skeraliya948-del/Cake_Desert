<%@ Page Title="Bakery Categories & Brands" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Show_Company.aspx.cs" Inherits="SweetDelights.Show_Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-12 bg-rose-50/40 min-h-screen">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-8">
            
            <div class="bg-white rounded-3xl p-6 sm:p-8 border border-rose-100 shadow-xl flex flex-col sm:flex-row items-center justify-between gap-4">
                <div>
                    <span class="text-xs font-bold uppercase tracking-widest text-rose-600 bg-rose-100 px-3 py-1 rounded-full">
                        <i class="fa-solid fa-layer-group"></i> Category & Brand Catalog
                    </span>
                    <h1 class="font-serif-heading text-3xl font-bold text-slate-900 mt-2">
                        <asp:Label ID="Label1" runat="server" Text="Welcome"></asp:Label>
                    </h1>
                </div>
            </div>

            <div class="bg-white rounded-3xl p-6 sm:p-8 border border-rose-100 shadow-xl space-y-6">
                <div class="border-b border-rose-100 pb-3">
                    <h2 class="font-serif-heading text-2xl font-bold text-slate-900">Select Bakery Brand / Category</h2>
                    <p class="text-xs text-slate-500">Click on any category to view products.</p>
                </div>

                <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" RepeatDirection="Horizontal" RepeatColumns="3" RepeatLayout="Table" CssClass="w-full">
                    <ItemTemplate>
                        <div class="p-3">
                            <div class="cake-card bg-slate-50 rounded-3xl p-6 border border-slate-200/80 hover:border-rose-300 transition text-center space-y-4 shadow-sm flex flex-col justify-between h-full">
                                
                                <div class="space-y-3">
                                    <div class="w-20 h-20 rounded-2xl overflow-hidden mx-auto border-2 border-rose-200 shadow-md">
                                        <img src='<%# Eval("Comp_Image") %>' alt='<%# Eval("Comp_Name") %>' class="w-full h-full object-cover" />
                                    </div>

                                    <h3 class="font-serif-heading font-bold text-lg text-slate-900">
                                        <%# Eval("Comp_Name") %>
                                    </h3>

                                    <p class="text-xs text-slate-500 line-clamp-2">
                                        <%# Eval("Comp_Desc") %>
                                    </p>
                                </div>

                                <div class="pt-3 border-t border-slate-200/60">
                                    <asp:LinkButton ID="btnViewCategory" runat="server" CommandName="cmd_cid" CommandArgument='<%# Eval("Comp_Id") %>' CssClass="w-full bg-rose-600 hover:bg-rose-700 text-white font-bold py-2.5 rounded-xl text-xs shadow transition flex items-center justify-center gap-1.5 cursor-pointer">
                                        <i class="fa-solid fa-arrow-right"></i> View Category Products
                                    </asp:LinkButton>
                                </div>

                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>

        </div>
    </div>
</asp:Content>
