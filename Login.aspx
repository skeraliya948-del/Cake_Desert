<%@ Page Title="User Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="SweetDelights.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-16 bg-gradient-to-b from-rose-50/60 to-white min-h-[75vh] flex items-center justify-center">
        <div class="max-w-md w-full mx-auto px-4">
            
            <div class="bg-white rounded-3xl p-8 border border-rose-100 shadow-2xl space-y-6">
                
                <div class="text-center space-y-2">
                    <div class="w-14 h-14 bg-rose-100 text-rose-600 rounded-2xl flex items-center justify-center text-2xl mx-auto shadow-sm">
                        <i class="fa-solid fa-lock"></i>
                    </div>
                    <h1 class="font-serif-heading text-3xl font-bold text-slate-900">Welcome Back</h1>
                    <p class="text-xs text-slate-500">Sign in to your Sweet Delights account</p>
                </div>

                <div class="space-y-4 text-slate-800">
                    <div>
                        <label class="block text-xs font-bold text-slate-700 mb-1">Email Address</label>
                        <asp:TextBox ID="txtemail" runat="server" TextMode="Email" placeholder="admin@gmail.com" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                    </div>

                    <div>
                        <label class="block text-xs font-bold text-slate-700 mb-1">Password</label>
                        <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" placeholder="Enter password" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                    </div>

                    <div class="flex items-center justify-between text-xs pt-1">
                        <label class="flex items-center gap-2 cursor-pointer text-slate-600 font-medium">
                            <input type="checkbox" class="accent-rose-600 rounded"> Remember me
                        </label>
                        <a href="#" class="text-rose-600 font-bold hover:underline">Forgot password?</a>
                    </div>

                    <asp:Button ID="login_btn" runat="server" Text="Sign In to Account" OnClick="login_btn_Click" CssClass="w-full bg-rose-600 hover:bg-rose-700 text-white font-bold py-3.5 rounded-xl text-xs shadow-md transition cursor-pointer" />
                </div>

                <div class="text-center border-t border-slate-100 pt-4 text-xs text-slate-500">
                    Don't have an account yet? 
                    <a href="Register.aspx" class="text-rose-600 font-bold hover:underline">Register here</a>
                </div>

            </div>

        </div>
    </div>
</asp:Content>
