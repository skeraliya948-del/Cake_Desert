<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="SweetDelights.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-12 bg-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            
            <div class="mb-6">
                <a href="Menu.aspx" class="inline-flex items-center gap-2 text-xs font-bold text-rose-600 hover:text-rose-800 bg-rose-50 px-3.5 py-2 rounded-full border border-rose-100">
                    <i class="fa-solid fa-arrow-left"></i> Back to Dessert Menu
                </a>
            </div>

            <div class="grid lg:grid-cols-12 gap-12 items-start">
                
                <div class="lg:col-span-6 relative">
                    <div class="rounded-3xl overflow-hidden shadow-2xl border border-rose-100 bg-slate-50">
                        <asp:Image ID="imgProduct" runat="server" CssClass="w-full h-[450px] object-cover" />
                    </div>

                    <asp:Panel ID="pnlEgglessBadge" runat="server" CssClass="absolute top-6 left-6 bg-emerald-600 text-white text-xs font-bold px-3 py-1.5 rounded-full shadow-lg flex items-center gap-1.5">
                        <span>🌱 100% Eggless Pure Vegetarian</span>
                    </asp:Panel>
                </div>

                <div class="lg:col-span-6 space-y-6">
                    <div>
                        <div class="flex items-center gap-2 mb-2">
                            <span class="text-xs font-bold uppercase tracking-wider text-rose-500 bg-rose-100 px-3 py-1 rounded-full">
                                <asp:Label ID="lblUnit" runat="server"></asp:Label>
                            </span>
                            <span class="text-xs font-bold text-slate-700 flex items-center gap-1 bg-amber-50 text-amber-800 px-2.5 py-1 rounded-full border border-amber-200">
                                <asp:Label ID="lblRating" runat="server"></asp:Label> <asp:Label ID="lblReviewsCount" runat="server" CssClass="text-slate-500 font-normal"></asp:Label>
                            </span>
                        </div>

                        <h1 class="font-serif-heading text-3xl sm:text-4xl font-bold text-slate-900 leading-tight">
                            <asp:Label ID="lblTitle" runat="server"></asp:Label>
                        </h1>
                    </div>

                    <div class="bg-rose-50/60 p-4 rounded-2xl border border-rose-100 flex items-center justify-between">
                        <div>
                            <span class="text-xs text-slate-400 block font-semibold uppercase">Special Offer Price</span>
                            <span class="font-serif-heading font-bold text-rose-600 text-3xl">
                                <asp:Label ID="lblPrice" runat="server"></asp:Label>
                            </span>
                        </div>
                        <span class="text-xs font-bold bg-emerald-100 text-emerald-800 px-3 py-1 rounded-full">In Stock & Fresh Daily</span>
                    </div>

                    <div class="space-y-2">
                        <h3 class="font-bold text-slate-900 text-sm uppercase tracking-wider text-slate-500">Overview</h3>
                        <p class="text-slate-600 text-sm leading-relaxed">
                            <asp:Label ID="lblDescription" runat="server"></asp:Label>
                        </p>
                    </div>

                    <div class="space-y-2 border-t border-slate-100 pt-4">
                        <h3 class="font-bold text-slate-900 text-sm uppercase tracking-wider text-slate-500">Full Recipe & Craftsmanship</h3>
                        <p class="text-slate-600 text-xs leading-relaxed">
                            <asp:Label ID="lblFullDetails" runat="server"></asp:Label>
                        </p>
                    </div>

                    <div class="space-y-2 border-t border-slate-100 pt-4">
                        <h3 class="font-bold text-slate-900 text-sm uppercase tracking-wider text-slate-500">Key Ingredients</h3>
                        <p class="text-slate-500 text-xs italic">
                            <asp:Label ID="lblIngredients" runat="server"></asp:Label>
                        </p>
                    </div>

                    <div class="pt-4 border-t border-slate-100 flex items-center gap-4">
                        <div class="w-28">
                            <label class="block text-[10px] font-bold uppercase text-slate-400 mb-1">Quantity</label>
                            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" Text="1" min="1" max="10" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-3 py-2 text-sm text-center font-bold text-slate-800 focus:outline-none focus:border-rose-500"></asp:TextBox>
                        </div>

                        <div class="flex-grow pt-4">
                            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Shopping Cart 🍰" OnClick="btnAddToCart_Click" CssClass="w-full bg-rose-600 hover:bg-rose-700 text-white font-bold py-3.5 rounded-2xl shadow-lg transition cursor-pointer text-xs" />
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </div>
</asp:Content>
