<%@ Page Title="Customer Reviews" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Reviews.aspx.cs" Inherits="SweetDelights.Reviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-12">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-12">
            
            <div class="bg-white rounded-3xl p-8 border border-rose-100 shadow-xl flex flex-col md:flex-row items-center justify-between gap-8">
                <div class="text-center md:text-left space-y-2">
                    <span class="text-xs font-bold uppercase tracking-widest text-rose-600 bg-rose-100 px-3 py-1 rounded-full">Loved By 2,500+ Customers</span>
                    <h1 class="font-serif-heading text-3xl sm:text-4xl font-bold text-slate-900">What Our Cake Lovers Say</h1>
                    <p class="text-slate-600 text-sm">Real reviews from verified birthday & party orders.</p>
                </div>

                <div class="bg-rose-50/70 p-6 rounded-2xl border border-rose-200/80 text-center flex items-center gap-6">
                    <div>
                        <span class="text-5xl font-bold text-slate-900 font-serif-heading">4.9</span>
                        <div class="flex text-amber-400 text-sm gap-1 justify-center mt-1">★★★★★</div>
                        <span class="text-[11px] text-slate-500 font-semibold block mt-1">Out of 5 Stars</span>
                    </div>
                    <div class="text-left text-xs space-y-1 border-l border-rose-200 pl-6 text-slate-600">
                        <div>5 Stars: <span class="font-bold text-slate-900">92%</span></div>
                        <div>4 Stars: <span class="font-bold text-slate-900">7%</span></div>
                        <div>3 Stars & Below: <span class="font-bold text-slate-900">1%</span></div>
                    </div>
                </div>
            </div>

            <div class="grid md:grid-cols-3 gap-6">
                <div class="bg-white border border-rose-100 rounded-3xl p-6 shadow-sm space-y-4">
                    <div class="flex justify-between items-center">
                        <div class="flex text-amber-400 text-sm gap-1">★★★★★</div>
                        <span class="text-[10px] bg-emerald-100 text-emerald-800 font-bold px-2 py-0.5 rounded-full">Verified Buyer</span>
                    </div>
                    <p class="text-slate-700 text-xs sm:text-sm italic leading-relaxed">
                        "Ordered the Royal Belgian Chocolate Truffle cake for my sister's birthday! It was unbelievably moist, rich, and 100% eggless. Delivered right on time!"
                    </p>
                    <div class="flex items-center gap-3 pt-2 border-t border-slate-100">
                        <div class="w-10 h-10 rounded-full bg-rose-200 flex items-center justify-center font-bold text-rose-700 text-xs">PS</div>
                        <div>
                            <h4 class="font-bold text-xs text-slate-900">Pooja Sharma</h4>
                            <span class="text-[10px] text-slate-500">Ahmedabad • Royal Chocolate Truffle</span>
                        </div>
                    </div>
                </div>

                <div class="bg-white border border-rose-100 rounded-3xl p-6 shadow-sm space-y-4">
                    <div class="flex justify-between items-center">
                        <div class="flex text-amber-400 text-sm gap-1">★★★★★</div>
                        <span class="text-[10px] bg-emerald-100 text-emerald-800 font-bold px-2 py-0.5 rounded-full">Verified Buyer</span>
                    </div>
                    <p class="text-slate-700 text-xs sm:text-sm italic leading-relaxed">
                        "The custom cake builder studio on their website made designing our 2-tier wedding anniversary cake super smooth! Visual preview matched the actual cake 100%."
                    </p>
                    <div class="flex items-center gap-3 pt-2 border-t border-slate-100">
                        <div class="w-10 h-10 rounded-full bg-amber-200 flex items-center justify-center font-bold text-amber-800 text-xs">RP</div>
                        <div>
                            <h4 class="font-bold text-xs text-slate-900">Rahul Patel</h4>
                            <span class="text-[10px] text-slate-500">Vadodara • Custom 2kg Tiered Cake</span>
                        </div>
                    </div>
                </div>

                <div class="bg-white border border-rose-100 rounded-3xl p-6 shadow-sm space-y-4">
                    <div class="flex justify-between items-center">
                        <div class="flex text-amber-400 text-sm gap-1">★★★★★</div>
                        <span class="text-[10px] bg-emerald-100 text-emerald-800 font-bold px-2 py-0.5 rounded-full">Verified Buyer</span>
                    </div>
                    <p class="text-slate-700 text-xs sm:text-sm italic leading-relaxed">
                        "French macarons here are hands down the best! Perfectly crisp shell with smooth pistachio and chocolate fillings. Fantastic gift packaging."
                    </p>
                    <div class="flex items-center gap-3 pt-2 border-t border-slate-100">
                        <div class="w-10 h-10 rounded-full bg-pink-200 flex items-center justify-center font-bold text-pink-700 text-xs">MD</div>
                        <div>
                            <h4 class="font-bold text-xs text-slate-900">Meera Desai</h4>
                            <span class="text-[10px] text-slate-500">Surat • Parisian Macaron Box</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-gradient-to-br from-rose-500 to-pink-600 text-white rounded-3xl p-8 shadow-xl max-w-2xl mx-auto space-y-4">
                <h3 class="font-serif-heading text-2xl font-bold text-center">Share Your Sweet Experience</h3>
                <p class="text-xs text-rose-100 text-center">Did you enjoy your cake? Leave a quick review to help other dessert lovers!</p>
                
                <div class="space-y-4 text-slate-800">
                    <div class="grid grid-cols-2 gap-3">
                        <input type="text" required placeholder="Your Name" class="bg-white rounded-xl px-4 py-2.5 text-xs focus:outline-none">
                        <input type="text" required placeholder="City / Location" class="bg-white rounded-xl px-4 py-2.5 text-xs focus:outline-none">
                    </div>
                    <textarea required rows="3" placeholder="Write your cake review..." class="w-full bg-white rounded-xl px-4 py-2.5 text-xs focus:outline-none"></textarea>
                    <button type="button" onclick="alert('Thank you for your feedback! Your review has been submitted. ✨');" class="w-full bg-slate-900 hover:bg-slate-950 text-white font-bold py-3 rounded-xl text-xs transition">Submit Review</button>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
