<%@ Page Title="User Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="SweetDelights.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-16 bg-gradient-to-b from-rose-50/60 to-white min-h-[75vh] flex items-center justify-center">
        <div class="max-w-md w-full mx-auto px-4">
            
            <div class="bg-white rounded-3xl p-8 border border-rose-100 shadow-2xl space-y-6">
                
                <div class="text-center space-y-2">
                    <div class="w-14 h-14 bg-rose-100 text-rose-600 rounded-2xl flex items-center justify-center text-2xl mx-auto shadow-sm">
                        <i class="fa-solid fa-user-plus"></i>
                    </div>
                    <h1 class="font-serif-heading text-3xl font-bold text-slate-900">Create Account</h1>
                    <p class="text-xs text-slate-500">Join Sweet Delights for fast ordering & special offers</p>
                </div>

                <asp:Label ID="lblRegisterMessage" runat="server"></asp:Label>

                <div class="space-y-4">
                    <div>
                        <label class="block text-xs font-bold text-slate-700 mb-1">Full Name *</label>
                        <asp:TextBox ID="txtFullName" runat="server" placeholder="e.g. Ramesh Patel" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                    </div>

                    <div>
                        <label class="block text-xs font-bold text-slate-700 mb-1">Email Address *</label>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="e.g. ramesh@gmail.com" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                    </div>

                    <div>
                        <label class="block text-xs font-bold text-slate-700 mb-1">Phone Number</label>
                        <asp:TextBox ID="txtPhone" runat="server" placeholder="9876543210" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                    </div>

                    <div>
                        <label class="block text-xs font-bold text-slate-700 mb-1">Password *</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="••••••••" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                    </div>

                    <div>
                        <label class="block text-xs font-bold text-slate-700 mb-1">Confirm Password *</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="••••••••" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                    </div>

                    <asp:Button ID="btnRegister" runat="server" Text="Register Account" OnClick="btnRegister_Click" CssClass="w-full bg-rose-600 hover:bg-rose-700 text-white font-bold py-3.5 rounded-xl text-xs shadow-md transition cursor-pointer" />
                </div>

                <div class="text-center border-t border-slate-100 pt-4 text-xs text-slate-500">
                    Already have an account? 
                    <a href="Login.aspx" class="text-rose-600 font-bold hover:underline">Sign In here</a>
                </div>

            </div>

        </div>
    </div>
</asp:Content>
