<%@ Page Title="Show Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Show_Products.aspx.cs" Inherits="SweetDelights.Show_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-12 bg-rose-50/40 min-h-screen">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-8">
            
            <div class="bg-white rounded-3xl p-6 sm:p-8 border border-rose-100 shadow-xl flex flex-col sm:flex-row items-center justify-between gap-4">
                <div>
                    <span class="text-xs font-bold uppercase tracking-widest text-rose-600 bg-rose-100 px-3 py-1 rounded-full">
                        <i class="fa-solid fa-cake-candles"></i> Product Catalog
                    </span>
                    <h1 class="font-serif-heading text-3xl font-bold text-slate-900 mt-2">
                        <asp:Label ID="Label3" runat="server" Text="Welcome"></asp:Label>
                    </h1>
                </div>
                <a href="Show_Company.aspx" class="inline-flex items-center gap-2 text-xs font-bold text-rose-600 hover:text-rose-800 bg-rose-50 px-4 py-2 rounded-full border border-rose-100">
                    <i class="fa-solid fa-arrow-left"></i> View All Categories
                </a>
            </div>

            <asp:Label ID="lblEmpty" runat="server" Visible="false" CssClass="block text-center text-sm font-bold text-rose-600 bg-white p-6 rounded-3xl border border-rose-100 shadow-sm"></asp:Label>

            <div class="bg-white rounded-3xl p-6 sm:p-8 border border-rose-100 shadow-xl space-y-6">
                <div class="border-b border-rose-100 pb-3 flex items-center justify-between">
                    <h2 class="font-serif-heading text-2xl font-bold text-slate-900">Dessert Products</h2>
                </div>

                <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" RepeatDirection="Horizontal" RepeatColumns="3" RepeatLayout="Table" CssClass="w-full">
                    <ItemTemplate>
                        <div class="p-3">
                            <div class="cake-card bg-white rounded-3xl overflow-hidden border border-rose-100/90 shadow-sm hover:shadow-xl transition flex flex-col justify-between h-full">
                                
                                <div class="relative overflow-hidden h-48">
                                    <img src='<%# Eval("Prod_Image") %>' alt='<%# Eval("Prod_Name") %>' class="w-full h-full object-cover" />
                                    <span class="absolute top-3 left-3 bg-emerald-600 text-white text-[10px] font-bold px-2.5 py-1 rounded-full shadow-md">
                                        🌱 100% Eggless
                                    </span>
                                </div>

                                <div class="p-5 space-y-3">
                                    <h3 class="font-serif-heading font-bold text-slate-900 text-base leading-snug">
                                        <%# Eval("Prod_Name") %>
                                    </h3>
                                    <p class="text-slate-500 text-xs line-clamp-2 leading-relaxed">
                                        <%# Eval("Prod_Desc") %>
                                    </p>
                                    
                                    <div class="pt-3 border-t border-rose-50 flex items-center justify-between">
                                        <span class="font-serif-heading font-bold text-rose-600 text-xl">
                                            ₹<%# Eval("Prod_Price") %>
                                        </span>

                                        <div class="flex items-center gap-2">
                                            <asp:LinkButton ID="btnView" runat="server" CommandName="cmd_view" CommandArgument='<%# Eval("Prod_Id") %>' CssClass="bg-slate-100 hover:bg-slate-200 text-slate-700 px-3 py-1.5 rounded-xl text-xs font-bold transition flex items-center gap-1">
                                                <i class="fa-solid fa-eye text-xs text-rose-500"></i> View
                                            </asp:LinkButton>

                                            <asp:LinkButton ID="btnCart" runat="server" CommandName="cmd_cart" CommandArgument='<%# Eval("Prod_Id") %>' CssClass="bg-rose-600 hover:bg-rose-700 text-white px-3.5 py-1.5 rounded-xl text-xs font-bold transition flex items-center gap-1 shadow">
                                                <i class="fa-solid fa-cart-plus text-xs"></i> Add
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>

        </div>
    </div>
</asp:Content>
