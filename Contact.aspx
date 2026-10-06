<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="SweetDelights.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-12">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-12">
            
            <div class="text-center max-w-2xl mx-auto space-y-3">
                <span class="text-xs font-bold uppercase tracking-widest text-rose-600 bg-rose-100 px-3 py-1 rounded-full">Visit & Get in Touch</span>
                <h1 class="font-serif-heading text-3xl sm:text-4xl font-bold text-slate-900">We'd Love to Hear From You</h1>
                <p class="text-slate-600 text-sm">Visit our flagship bakery store or get in touch for custom event orders.</p>
            </div>

            <div class="grid lg:grid-cols-12 gap-8 items-start">
                
                <div class="lg:col-span-5 bg-slate-900 text-white rounded-3xl p-8 shadow-xl space-y-6">
                    <h3 class="font-serif-heading text-2xl font-bold">Store Details</h3>
                    
                    <div class="space-y-4 text-xs sm:text-sm">
                        <div class="flex items-start gap-3">
                            <i class="fa-solid fa-location-dot text-rose-400 text-base mt-1"></i>
                            <div>
                                <strong class="block text-white">Bakery Location:</strong>
                                <span class="text-slate-400">Shop #14, Sweet Plaza, CG Road, Navrangpura, Ahmedabad, Gujarat 380009</span>
                            </div>
                        </div>

                        <div class="flex items-start gap-3">
                            <i class="fa-solid fa-clock text-rose-400 text-base mt-1"></i>
                            <div>
                                <strong class="block text-white">Operating Hours:</strong>
                                <span class="text-slate-400">Monday - Sunday: 8:00 AM – 10:30 PM (7 Days Open)</span>
                            </div>
                        </div>

                        <div class="flex items-start gap-3">
                            <i class="fa-solid fa-phone text-rose-400 text-base mt-1"></i>
                            <div>
                                <strong class="block text-white">Direct Phone & WhatsApp:</strong>
                                <span class="text-slate-400">+91 98765 43210 / +91 79 2640 1234</span>
                            </div>
                        </div>
                    </div>

                    <div class="pt-4 border-t border-slate-800 flex flex-col gap-3">
                        <a href="https://wa.me/919876543210" target="_blank" class="w-full bg-emerald-500 hover:bg-emerald-600 text-white font-bold py-3.5 rounded-2xl text-xs transition flex items-center justify-center gap-2">
                            <i class="fa-brands fa-whatsapp text-lg"></i> Direct Order on WhatsApp
                        </a>
                    </div>
                </div>

                <div class="lg:col-span-7 bg-white rounded-3xl p-8 border border-rose-100 shadow-xl space-y-6">
                    <h3 class="font-serif-heading text-2xl font-bold text-slate-900">Send Us an Inquiry</h3>
                    
                    <div class="space-y-4">
                        <div class="grid sm:grid-cols-2 gap-4">
                            <div>
                                <label class="block text-xs font-bold text-slate-700 mb-1">Your Name</label>
                                <input type="text" required placeholder="e.g. Priyank Patel" class="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-xs text-slate-800 focus:outline-none focus:border-rose-500">
                            </div>
                            <div>
                                <label class="block text-xs font-bold text-slate-700 mb-1">Phone Number</label>
                                <input type="tel" required placeholder="9876543210" class="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-xs text-slate-800 focus:outline-none focus:border-rose-500">
                            </div>
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-700 mb-1">Event Type / Subject</label>
                            <select class="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium">
                                <option value="Custom Birthday Cake Inquiry">Custom Birthday Cake Order</option>
                                <option value="Wedding / Anniversary Bulk Order">Wedding / Anniversary Bulk Cake</option>
                                <option value="Corporate Event / Gift Boxes">Corporate Event Dessert Boxes</option>
                                <option value="General Feedback">General Feedback & Inquiry</option>
                            </select>
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-700 mb-1">Message / Event Requirements</label>
                            <textarea required rows="4" placeholder="Mention preferred flavors, date, number of guests..." class="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-xs text-slate-800 focus:outline-none focus:border-rose-500"></textarea>
                        </div>

                        <button type="button" onclick="alert('Thank you! Your message has been sent to our bakery team. We will call you shortly!');" class="w-full bg-rose-600 hover:bg-rose-700 text-white font-bold py-3.5 rounded-xl text-xs shadow-md transition">Send Message</button>
                    </div>
                </div>

            </div>

        </div>
    </div>
</asp:Content>
