<%@ Page Title="Add New Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Add_Products.aspx.cs" Inherits="SweetDelights.Add_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-12 bg-rose-50/40 min-h-screen">
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 space-y-8">
            
            <div class="bg-gradient-to-r from-rose-600 via-pink-600 to-amber-600 text-white rounded-3xl p-6 sm:p-8 shadow-xl flex flex-col sm:flex-row items-center justify-between gap-4">
                <div class="flex items-center gap-3">
                    <div class="w-12 h-12 rounded-2xl bg-white/20 flex items-center justify-center text-xl font-bold">
                        🎂
                    </div>
                    <div>
                        <span class="text-xs uppercase tracking-wider text-rose-100 font-semibold">Admin Product Entry Portal</span>
                        <h1 class="font-serif-heading text-2xl font-bold">
                            <asp:Label ID="lblWelcome" runat="server" Text="Welcome Admin"></asp:Label>
                        </h1>
                    </div>
                </div>

                <a href="Show_Products.aspx" class="bg-white/20 hover:bg-white/30 text-white text-xs font-bold px-4 py-2 rounded-full transition">
                    View All Products &rarr;
                </a>
            </div>

            <div class="bg-white rounded-3xl p-6 sm:p-8 border border-rose-100 shadow-xl space-y-6">
                <div class="border-b border-rose-100 pb-3 flex items-center justify-between">
                    <div>
                        <h2 class="font-serif-heading text-2xl font-bold text-slate-900">Add New Cake / Dessert</h2>
                        <p class="text-xs text-slate-500">Insert new product into database.</p>
                    </div>
                </div>

                <div class="grid md:grid-cols-2 gap-6 text-slate-800">
                    <div>
                        <label class="block text-xs font-bold text-slate-700 mb-1">Select Category / Brand *</label>
                        <asp:DropDownList ID="drpcompid" runat="server" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-semibold">
                        </asp:DropDownList>
                    </div>

                    <div>
                        <label class="block text-xs font-bold text-slate-700 mb-1">Cake Model / Flavor Name *</label>
                        <asp:TextBox ID="txtmodel" runat="server" placeholder="e.g. Belgian Truffle / Red Velvet" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                    </div>

                    <div>
                        <label class="block text-xs font-bold text-slate-700 mb-1">Cake Weight / Unit *</label>
                        <asp:TextBox ID="txtweight" runat="server" placeholder="e.g. 0.5 kg / 1.0 kg / 6 Pcs Box" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                    </div>

                    <div>
                        <label class="block text-xs font-bold text-slate-700 mb-1">Cake Configuration / Spec *</label>
                        <asp:TextBox ID="txtconfig" runat="server" placeholder="e.g. 100% Eggless • Gold Flakes • Fresh Berries" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                    </div>

                    <div>
                        <label class="block text-xs font-bold text-slate-700 mb-1">Price in ₹ *</label>
                        <asp:TextBox ID="txtprice" runat="server" placeholder="e.g. 650.00" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                    </div>

                    <div>
                        <label class="block text-xs font-bold text-slate-700 mb-1">Upload Cake Image *</label>
                        <asp:FileUpload ID="imgUpload" runat="server" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-3 py-2 text-xs text-slate-700 font-medium" />
                    </div>

                    <div class="md:col-span-2">
                        <label class="block text-xs font-bold text-slate-700 mb-1">Product Description *</label>
                        <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" Rows="3" placeholder="Enter mouthwatering product description..." CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                    </div>

                </div>

                <div class="pt-4 flex items-center gap-4">
                    <asp:Button ID="btnAdd" runat="server" Text="Add Product to Database" OnClick="btnAdd_Click" CssClass="bg-rose-600 hover:bg-rose-700 text-white font-bold px-8 py-3.5 rounded-2xl text-xs shadow-lg transition cursor-pointer" />
                    <a href="Show_Products.aspx" class="bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold px-6 py-3.5 rounded-2xl text-xs transition">Cancel</a>
                </div>

            </div>

        </div>
    </div>
</asp:Content>
