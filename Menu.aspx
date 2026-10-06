<%@ Page Title="Dessert Menu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="SweetDelights.Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-10">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            
            <div class="text-center max-w-2xl mx-auto mb-10 space-y-3">
                <span class="text-xs font-bold uppercase tracking-widest text-rose-600 bg-rose-100 px-3 py-1 rounded-full">Oven Fresh Treats</span>
                <h1 class="font-serif-heading text-3xl sm:text-4xl font-bold text-slate-900">Explore Our Dessert Menu</h1>
                <p class="text-slate-600 text-sm">Choose from our handcrafted selection of cakes, cheesecakes, pastries, and French macarons.</p>
            </div>

            <div class="bg-white p-4 sm:p-6 rounded-3xl border border-rose-100 shadow-sm mb-8 space-y-4">
                <div class="flex flex-col md:flex-row items-center justify-between gap-4">
                    
                    <div class="flex items-center gap-2 overflow-x-auto w-full md:w-auto pb-2 md:pb-0 no-scrollbar">
                        <button type="button" onclick="setMenuCategory('all', this)" class="menu-cat-btn bg-rose-600 text-white shadow-md px-4 py-2 rounded-full text-xs font-bold transition whitespace-nowrap">All Menu</button>
                        <button type="button" onclick="setMenuCategory('cakes', this)" class="menu-cat-btn bg-slate-100 text-slate-700 hover:bg-rose-100 px-4 py-2 rounded-full text-xs font-bold transition whitespace-nowrap">🎂 Celebration Cakes</button>
                        <button type="button" onclick="setMenuCategory('pastries', this)" class="menu-cat-btn bg-slate-100 text-slate-700 hover:bg-rose-100 px-4 py-2 rounded-full text-xs font-bold transition whitespace-nowrap">🍰 Pastries & Slices</button>
                        <button type="button" onclick="setMenuCategory('macarons', this)" class="menu-cat-btn bg-slate-100 text-slate-700 hover:bg-rose-100 px-4 py-2 rounded-full text-xs font-bold transition whitespace-nowrap">🧁 Macarons & Desserts</button>
                        <button type="button" onclick="setMenuCategory('cookies', this)" class="menu-cat-btn bg-slate-100 text-slate-700 hover:bg-rose-100 px-4 py-2 rounded-full text-xs font-bold transition whitespace-nowrap">🍪 Soft Baked Cookies</button>
                    </div>

                    <div class="relative w-full md:w-64">
                        <i class="fa-solid fa-magnifying-glass absolute left-3.5 top-3 text-slate-400 text-xs"></i>
                        <input type="text" id="menuSearchInput" oninput="renderMenuGrid()" placeholder="Search cakes or flavors..." class="w-full pl-9 pr-4 py-2 bg-slate-50 border border-slate-200 rounded-full text-xs text-slate-800 focus:outline-none focus:border-rose-500">
                    </div>

                </div>

                <div class="flex flex-wrap items-center justify-between gap-4 pt-3 border-t border-slate-100 text-xs">
                    <label class="flex items-center gap-2 cursor-pointer">
                        <input type="checkbox" id="egglessFilterToggle" onchange="renderMenuGrid()" class="w-4 h-4 accent-emerald-600 rounded">
                        <span class="font-bold text-emerald-800">🌱 Show 100% Eggless Items Only</span>
                    </label>

                    <div class="flex items-center gap-2">
                        <span class="text-slate-500 font-semibold">Sort By:</span>
                        <select onchange="handleSortChange(event)" class="bg-slate-50 border border-slate-200 rounded-xl px-3 py-1.5 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium">
                            <option value="featured">Featured Bestsellers</option>
                            <option value="price-low">Price: Low to High</option>
                            <option value="price-high">Price: High to Low</option>
                            <option value="rating">Highest Customer Rating</option>
                        </select>
                    </div>
                </div>
            </div>

            <div id="menuProductGrid" class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
                <!-- Rendered dynamically by menu.js -->
            </div>

        </div>
    </div>
    <script src="js/menu.js"></script>
</asp:Content>
