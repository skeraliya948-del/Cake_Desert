<%@ Page Title="Custom Cake Studio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="CustomCake.aspx.cs" Inherits="SweetDelights.CustomCake" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-12">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            
            <div class="text-center max-w-2xl mx-auto mb-12 space-y-3">
                <span class="text-xs font-bold uppercase tracking-widest text-amber-700 bg-amber-100 px-3.5 py-1 rounded-full border border-amber-200">✨ Customization Studio</span>
                <h1 class="font-serif-heading text-3xl sm:text-4xl font-bold text-slate-900">Design Your Own Custom Cake</h1>
                <p class="text-slate-600 text-sm sm:text-base">Personalize your cake size, flavor, frosting, toppings, and greeting message with live pricing.</p>
            </div>

            <div class="grid lg:grid-cols-12 gap-8 items-start">
                
                <div class="lg:col-span-7 bg-white rounded-3xl p-6 sm:p-8 shadow-xl border border-rose-100 space-y-7">
                    
                    <div>
                        <label class="block text-xs font-bold uppercase text-slate-500 tracking-wider mb-3">Step 1: Choose Cake Size & Weight</label>
                        <div class="grid grid-cols-3 gap-3">
                            <button type="button" onclick="selectBuilderSize('0.5kg', 600, 'Serves 4 - 6 people')" id="btn-size-0.5kg" class="builder-size-card p-4 rounded-2xl border-2 border-rose-600 bg-rose-50/60 ring-2 ring-rose-400 text-slate-800 text-left transition">
                                <span class="block font-bold text-sm">0.5 kg</span>
                                <span class="text-[11px] text-slate-500 block">Serves 4-6</span>
                                <span class="block text-xs font-bold text-rose-600 mt-1">₹600</span>
                            </button>
                            <button type="button" onclick="selectBuilderSize('1.0kg', 1100, 'Serves 8 - 12 people')" id="btn-size-1.0kg" class="builder-size-card p-4 rounded-2xl border border-slate-200 text-slate-800 text-left transition hover:border-rose-400">
                                <span class="block font-bold text-sm">1.0 kg</span>
                                <span class="text-[11px] text-slate-500 block">Serves 8-12</span>
                                <span class="block text-xs font-bold text-rose-600 mt-1">₹1,100</span>
                            </button>
                            <button type="button" onclick="selectBuilderSize('2.0kg Tiered', 2100, 'Serves 18 - 24 people')" id="btn-size-2.0kg Tiered" class="builder-size-card p-4 rounded-2xl border border-slate-200 text-slate-800 text-left transition hover:border-rose-400">
                                <span class="block font-bold text-sm">2.0 kg Tiered</span>
                                <span class="text-[11px] text-slate-500 block">Serves 18-24</span>
                                <span class="block text-xs font-bold text-rose-600 mt-1">₹2,100</span>
                            </button>
                        </div>
                    </div>

                    <div>
                        <label class="block text-xs font-bold uppercase text-slate-500 tracking-wider mb-2">Step 2: Choose Cake Flavor Base</label>
                        <select id="builderFlavorSelect" onchange="updateBuilderFlavor()" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-4 py-3 text-sm font-semibold text-slate-800 focus:outline-none focus:border-rose-500">
                            <option value="Madagascar Vanilla Bean & Fresh Strawberry" data-extra="0">Madagascar Vanilla Bean & Strawberry (Standard)</option>
                            <option value="Belgian Dark Chocolate Ganache" data-extra="60">Belgian Dark Chocolate Ganache (+₹60)</option>
                            <option value="Red Velvet Cream Cheese" data-extra="80">Red Velvet Cream Cheese (+₹80)</option>
                            <option value="Lotus Biscoff Caramel Crunch" data-extra="100">Lotus Biscoff Caramel Crunch (+₹100)</option>
                            <option value="Alphonso Mango Passion Fruit Mousse" data-extra="70">Alphonso Mango Passion Fruit Mousse (+₹70)</option>
                        </select>
                    </div>

                    <div>
                        <label class="block text-xs font-bold uppercase text-slate-500 tracking-wider mb-3">Step 3: Choose Frosting Finish</label>
                        <div class="grid grid-cols-1 sm:grid-cols-3 gap-3">
                            <label class="flex items-center gap-2 p-3 border border-slate-200 rounded-2xl cursor-pointer hover:bg-rose-50/50">
                                <input type="radio" name="builderFrosting" value="Soft Swiss Buttercream" checked onchange="updateBuilderFrosting()" class="accent-rose-600">
                                <span class="text-xs font-semibold text-slate-700">Swiss Buttercream</span>
                            </label>
                            <label class="flex items-center gap-2 p-3 border border-slate-200 rounded-2xl cursor-pointer hover:bg-rose-50/50">
                                <input type="radio" name="builderFrosting" value="Shiny Chocolate Ganache Drip" onchange="updateBuilderFrosting()" class="accent-rose-600">
                                <span class="text-xs font-semibold text-slate-700">Choco Ganache Drip</span>
                            </label>
                            <label class="flex items-center gap-2 p-3 border border-slate-200 rounded-2xl cursor-pointer hover:bg-rose-50/50">
                                <input type="radio" name="builderFrosting" value="Naked Style with Fresh Fruits" onchange="updateBuilderFrosting()" class="accent-rose-600">
                                <span class="text-xs font-semibold text-slate-700">Naked & Fruits</span>
                            </label>
                        </div>
                    </div>

                    <div>
                        <label class="block text-xs font-bold uppercase text-slate-500 tracking-wider mb-3">Step 4: Select Extra Decor & Toppings</label>
                        <div class="grid grid-cols-1 sm:grid-cols-3 gap-3 text-xs">
                            <label class="flex items-center gap-2 p-3 border border-slate-200 rounded-2xl cursor-pointer hover:bg-amber-50">
                                <input type="checkbox" value="Edible 24k Gold Flakes" data-price="120" onchange="updateBuilderToppings()" class="builder-topping-chk accent-amber-600">
                                <span>✨ 24k Gold Flakes (+₹120)</span>
                            </label>
                            <label class="flex items-center gap-2 p-3 border border-slate-200 rounded-2xl cursor-pointer hover:bg-amber-50">
                                <input type="checkbox" value="Fresh Berry Medley" data-price="90" onchange="updateBuilderToppings()" class="builder-topping-chk accent-amber-600">
                                <span>🍓 Fresh Berries (+₹90)</span>
                            </label>
                            <label class="flex items-center gap-2 p-3 border border-slate-200 rounded-2xl cursor-pointer hover:bg-amber-50">
                                <input type="checkbox" value="Ferrero Rocher Chocolates" data-price="100" onchange="updateBuilderToppings()" class="builder-topping-chk accent-amber-600">
                                <span>🍫 Ferrero Rocher (+₹100)</span>
                            </label>
                        </div>
                    </div>

                    <div>
                        <label class="block text-xs font-bold uppercase text-slate-500 tracking-wider mb-2">Step 5: Custom Message on Cake Plaque</label>
                        <input type="text" id="builderCustomMessageInput" oninput="updateBuilderMessage()" placeholder="e.g. Happy 25th Birthday Ananya! 🎉" class="w-full bg-slate-50 border border-slate-200 rounded-2xl px-4 py-3 text-xs text-slate-800 focus:outline-none focus:border-rose-500">
                    </div>

                    <div class="flex items-center gap-2 pt-2 border-t border-slate-100">
                        <input type="checkbox" id="builderEgglessChk" checked class="w-4 h-4 accent-emerald-600 rounded">
                        <label for="builderEgglessChk" class="text-xs font-bold text-emerald-800">🌱 Make it 100% Pure Eggless (No extra charge)</label>
                    </div>

                </div>

                <div class="lg:col-span-5 sticky top-24">
                    <div class="bg-slate-900 text-white rounded-3xl p-6 sm:p-8 shadow-2xl space-y-6">
                        <div class="flex items-center justify-between border-b border-slate-800 pb-4">
                            <div>
                                <span class="text-xs font-semibold text-rose-400 uppercase tracking-widest">Live Cake Preview</span>
                                <h3 class="font-serif-heading text-xl font-bold text-white">Custom Specification</h3>
                            </div>
                            <span class="text-3xl">🎂</span>
                        </div>

                        <div class="space-y-3 text-xs text-slate-300">
                            <div class="flex justify-between py-1 border-b border-slate-800/60">
                                <span>Cake Weight & Size:</span>
                                <span id="previewSize" class="font-bold text-white">0.5kg (Serves 4-6)</span>
                            </div>
                            <div class="flex justify-between py-1 border-b border-slate-800/60">
                                <span>Flavor Base:</span>
                                <span id="previewFlavor" class="font-bold text-white">Vanilla Bean & Strawberry</span>
                            </div>
                            <div class="flex justify-between py-1 border-b border-slate-800/60">
                                <span>Frosting Type:</span>
                                <span id="previewFrosting" class="font-bold text-white">Soft Swiss Buttercream</span>
                            </div>
                            <div class="flex justify-between py-1 border-b border-slate-800/60">
                                <span>Extra Toppings:</span>
                                <span id="previewToppings" class="font-bold text-amber-400">Standard Decoration</span>
                            </div>
                            <div class="flex justify-between py-1 border-b border-slate-800/60">
                                <span>Plaque Text:</span>
                                <span id="previewMessage" class="font-bold italic text-rose-300">"Happy Birthday!"</span>
                            </div>
                        </div>

                        <div class="bg-slate-800/80 rounded-2xl p-4 flex items-center justify-between border border-slate-700">
                            <div>
                                <span class="text-xs text-slate-400 block">Total Calculated Price</span>
                                <span id="previewTotalPrice" class="text-3xl font-bold text-rose-400 font-serif-heading">₹600</span>
                            </div>
                            <span class="text-[10px] bg-emerald-500/20 text-emerald-400 border border-emerald-500/30 px-2.5 py-1 rounded-full font-semibold">Taxes Included</span>
                        </div>

                        <button type="button" onclick="addCustomCakeToCart()" class="w-full bg-gradient-to-r from-rose-500 to-amber-500 hover:from-rose-600 hover:to-amber-600 text-white font-bold py-4 rounded-2xl shadow-xl transition flex items-center justify-center gap-2 text-sm">
                            <i class="fa-solid fa-cart-plus"></i> Add Custom Cake to Basket
                        </button>
                    </div>
                </div>

            </div>

        </div>
    </div>
    <script src="js/builder.js"></script>
</asp:Content>
