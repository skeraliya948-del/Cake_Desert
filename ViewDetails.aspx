<%@ Page Title="Product Details View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ViewDetails.aspx.cs" Inherits="SweetDelights.ViewDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-12 bg-white min-h-[75vh]">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            
            <div class="mb-6 flex items-center justify-between">
                <a href="Show_Products.aspx" class="inline-flex items-center gap-2 text-xs font-bold text-rose-600 hover:text-rose-800 bg-rose-50 px-3.5 py-2 rounded-full border border-rose-100">
                    <i class="fa-solid fa-arrow-left"></i> Back to Products Catalog
                </a>
            </div>

            <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" CssClass="w-full">
                <ItemTemplate>
                    <div class="grid lg:grid-cols-12 gap-12 items-start bg-rose-50/30 p-6 sm:p-8 rounded-3xl border border-rose-100 shadow-xl">
                        
                        <div class="lg:col-span-6 relative">
                            <div class="rounded-3xl overflow-hidden shadow-2xl border border-rose-100 bg-white">
                                <img src='<%# Eval("Prod_Image") %>' alt='<%# Eval("Prod_Name") %>' class="w-full h-[420px] object-cover" />
                            </div>
                            <span class="absolute top-6 left-6 bg-emerald-600 text-white text-xs font-bold px-3 py-1.5 rounded-full shadow-lg">
                                🌱 100% Eggless Pure Vegetarian
                            </span>
                        </div>

                        <div class="lg:col-span-6 space-y-6">
                            <div>
                                <h1 class="font-serif-heading text-3xl sm:text-4xl font-bold text-slate-900 leading-tight">
                                    <%# Eval("Prod_Name") %>
                                </h1>
                            </div>

                            <div class="bg-white p-4 rounded-2xl border border-rose-100 flex items-center justify-between shadow-sm">
                                <div>
                                    <span class="text-xs text-slate-400 block font-semibold uppercase">Special Price</span>
                                    <span class="font-serif-heading font-bold text-rose-600 text-3xl">
                                        ₹<%# Eval("Prod_Price") %>
                                    </span>
                                </div>
                                <span class="text-xs font-bold bg-emerald-100 text-emerald-800 px-3 py-1.5 rounded-full">
                                    In Stock & Fresh Daily
                                </span>
                            </div>

                            <div class="space-y-2">
                                <h3 class="font-bold text-slate-900 text-xs uppercase tracking-wider text-slate-500">Product Description</h3>
                                <p class="text-slate-600 text-sm leading-relaxed">
                                    <%# Eval("Prod_Desc") %>
                                </p>
                            </div>

                            <div class="pt-4 border-t border-slate-200/80 flex items-center gap-4">
                                <button type="button" onclick="globalCart.addItem({ id: '<%# Eval("Prod_Id") %>', title: '<%# Eval("Prod_Name") %>', price: <%# Eval("Prod_Price") %>, image: '<%# Eval("Prod_Image") %>', unit: 'Fresh Bake' });" class="w-full bg-rose-600 hover:bg-rose-700 text-white font-bold py-4 rounded-2xl shadow-lg transition text-xs flex items-center justify-center gap-2 cursor-pointer">
                                    <i class="fa-solid fa-cart-plus"></i> Add Product to Basket
                                </button>
                            </div>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:DataList>

        </div>
    </div>
</asp:Content>
