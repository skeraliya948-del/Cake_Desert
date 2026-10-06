<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="SweetDelights.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-16">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-16">
            
            <div class="grid lg:grid-cols-2 gap-12 items-center">
                <div class="space-y-6">
                    <span class="text-xs font-bold uppercase tracking-widest text-rose-600 bg-rose-100 px-3 py-1 rounded-full">Our Story & Passion</span>
                    <h1 class="font-serif-heading text-4xl sm:text-5xl font-bold text-slate-900 leading-tight">Crafting Memories, One Slice at a Time</h1>
                    <p class="text-slate-600 text-sm sm:text-base leading-relaxed">
                        Founded in 2018 with a simple dream: to bring authentic French patisserie craftsmanship and 100% pure eggless celebration cakes to dessert lovers across the city.
                    </p>
                    <p class="text-slate-600 text-sm sm:text-base leading-relaxed">
                        Every morning at 5:00 AM, our master pastry chefs begin whisking fresh cream, tempering Belgian chocolate, and baking soft vanilla sponges so that your celebrations are paired with the freshest flavors imaginable.
                    </p>
                    
                    <div class="pt-4 flex items-center gap-6 border-t border-rose-100">
                        <div>
                            <span class="block text-3xl font-bold text-rose-600 font-serif-heading">50,000+</span>
                            <span class="text-xs text-slate-500 font-medium">Happy Birthday Celebrations</span>
                        </div>
                        <div class="border-l border-rose-200 pl-6">
                            <span class="block text-3xl font-bold text-amber-600 font-serif-heading">100%</span>
                            <span class="text-xs text-slate-500 font-medium">Pure Belgian Cocoa & Butter</span>
                        </div>
                    </div>
                </div>

                <div class="relative">
                    <div class="rounded-3xl overflow-hidden shadow-2xl border border-rose-100">
                        <img src="https://images.unsplash.com/photo-1555507036-ab1f4038808a?auto=format&fit=crop&w=800&q=80" alt="Bakery Kitchen Crafting Cakes" class="w-full h-[400px] object-cover">
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-3xl p-8 sm:p-12 border border-rose-100 shadow-xl space-y-8">
                <div class="text-center max-w-xl mx-auto space-y-2">
                    <span class="text-xs font-bold uppercase tracking-widest text-rose-600">Our Uncompromising Standards</span>
                    <h2 class="font-serif-heading text-3xl font-bold text-slate-900">What Sets Sweet Delights Apart</h2>
                </div>

                <div class="grid sm:grid-cols-3 gap-8">
                    <div class="space-y-3 text-center">
                        <div class="w-14 h-14 bg-rose-100 text-rose-600 rounded-2xl flex items-center justify-center text-2xl mx-auto">🌱</div>
                        <h3 class="font-bold text-slate-900 text-base">Dedicated Eggless Facility</h3>
                        <p class="text-slate-500 text-xs leading-relaxed">We strictly separate eggless preparation zones with separate utensils and ovens for total peace of mind.</p>
                    </div>

                    <div class="space-y-3 text-center">
                        <div class="w-14 h-14 bg-amber-100 text-amber-600 rounded-2xl flex items-center justify-center text-2xl mx-auto">🧈</div>
                        <h3 class="font-bold text-slate-900 text-base">No Artificial Preservatives</h3>
                        <p class="text-slate-500 text-xs leading-relaxed">We never use artificial premixes or chemical emulsifiers. Only genuine butter, fresh dairy cream, and pure chocolate.</p>
                    </div>

                    <div class="space-y-3 text-center">
                        <div class="w-14 h-14 bg-emerald-100 text-emerald-600 rounded-2xl flex items-center justify-center text-2xl mx-auto">📦</div>
                        <h3 class="font-bold text-slate-900 text-base">Chilled Delivery Protection</h3>
                        <p class="text-slate-500 text-xs leading-relaxed">Every cake is packed in insulated thermal boxes to guarantee zero melting or tilt during transit.</p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
