<%@ Page Title="User & Employee Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="insert.aspx.cs" Inherits="SweetDelights.insert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-12 bg-rose-50/40 min-h-screen">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-8">
            
            <div class="text-center max-w-2xl mx-auto space-y-2">
                <span class="text-xs font-bold uppercase tracking-widest text-rose-600 bg-rose-100 px-3.5 py-1 rounded-full border border-rose-200">
                    <i class="fa-solid fa-user-plus"></i> User Registration
                </span>
                <h1 class="font-serif-heading text-3xl sm:text-4xl font-bold text-slate-900">User Registration</h1>
                <p class="text-xs sm:text-sm text-slate-600">Register your account to order delicious cakes & desserts.</p>
            </div>

            <asp:Panel ID="pnlLoginLink" runat="server" Visible="false"></asp:Panel>

            <asp:Panel ID="pnlAdminGrid" runat="server" Visible="true" CssClass="space-y-8">
                
                <div class="bg-gradient-to-r from-rose-600 via-pink-600 to-amber-600 text-white rounded-3xl p-6 shadow-xl flex flex-col sm:flex-row items-center justify-between gap-4">
                    <div class="flex items-center gap-3">
                        <div class="w-12 h-12 rounded-2xl bg-white/20 flex items-center justify-center text-xl font-bold">
                            👋
                        </div>
                        <div>
                            <span class="text-xs uppercase tracking-wider text-rose-100 font-semibold">User Session</span>
                            <h2 class="font-serif-heading text-2xl font-bold">
                                <asp:Label ID="lblWelcome" runat="server" Text="Welcome User"></asp:Label>
                            </h2>
                        </div>
                    </div>
                </div>

                <div class="bg-white rounded-3xl p-6 sm:p-8 border border-rose-100 shadow-xl space-y-6">
                    <div class="border-b border-rose-100 pb-4">
                        <h3 class="font-serif-heading text-xl font-bold text-slate-900">User Registration / Data Entry Form</h3>
                        <p class="text-xs text-slate-500">Fill in the fields below to register a new user or update details.</p>
                    </div>

                    <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6 text-slate-800">
                        <div>
                            <label class="block text-xs font-bold text-slate-700 mb-1">Full Name</label>
                            <asp:TextBox ID="txtusername" runat="server" placeholder="Enter Full Name" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-700 mb-1">Gender</label>
                            <asp:RadioButtonList ID="rdogen" runat="server" RepeatDirection="Horizontal" CssClass="flex gap-4 text-xs font-semibold pt-2 text-slate-700">
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-700 mb-1">Email Address</label>
                            <asp:TextBox ID="txtemail" runat="server" TextMode="Email" placeholder="user@gmail.com" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-700 mb-1">Password</label>
                            <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" placeholder="Enter password" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-700 mb-1">Select City</label>
                            <asp:DropDownList ID="drpcity" runat="server" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium">
                                <asp:ListItem Value="">-- Select City --</asp:ListItem>
                                <asp:ListItem Value="Ahmedabad">Ahmedabad</asp:ListItem>
                                <asp:ListItem Value="Surat">Surat</asp:ListItem>
                                <asp:ListItem Value="Vadodara">Vadodara</asp:ListItem>
                                <asp:ListItem Value="Rajkot">Rajkot</asp:ListItem>
                                <asp:ListItem Value="Mumbai">Mumbai</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-700 mb-1">Mobile Number</label>
                            <asp:TextBox ID="txtmbl" runat="server" placeholder="9876543210" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                        </div>

                        <div class="md:col-span-2">
                            <label class="block text-xs font-bold text-slate-700 mb-1">Address</label>
                            <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" Rows="2" placeholder="Enter full address" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-700 mb-1">Upload Photo</label>
                            <asp:FileUpload ID="imgupload" runat="server" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-3 py-2 text-xs text-slate-700 font-medium" />
                        </div>

                    </div>

                    <div class="pt-4 flex items-center gap-4">
                        <asp:Button ID="Save_btn" runat="server" Text="Save" OnClick="Save_btn_Click" CssClass="bg-rose-600 hover:bg-rose-700 text-white font-bold px-8 py-3 rounded-xl text-xs shadow-md transition cursor-pointer" />
                        <button type="button" onclick="window.location.reload();" class="bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold px-6 py-3 rounded-xl text-xs transition">Reset Form</button>
                    </div>

                </div>

                <div class="bg-white rounded-3xl p-6 sm:p-8 border border-rose-100 shadow-xl space-y-4">
                    <div class="flex items-center justify-between border-b border-rose-100 pb-3">
                        <h3 class="font-serif-heading text-xl font-bold text-slate-900">Database User Records</h3>
                        <span class="text-xs font-semibold text-rose-600 bg-rose-50 px-3 py-1 rounded-full">Live SQL Data</span>
                    </div>

                    <div class="overflow-x-auto">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" CssClass="w-full text-left text-xs text-slate-700 border-collapse">
                            <HeaderStyle CssClass="bg-slate-900 text-white font-bold uppercase tracking-wider py-3 px-4" />
                            <RowStyle CssClass="border-b border-slate-100 hover:bg-rose-50/50 transition py-3 px-4" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID" />
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="City" HeaderText="City" />
                                <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <img src='<%# Eval("Image") %>' alt="User Image" class="w-10 h-10 rounded-full object-cover border border-rose-200" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <div class="flex items-center gap-2">
                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="cmd_edt" CommandArgument='<%# Eval("Id") %>' CssClass="bg-amber-100 text-amber-800 font-bold px-3 py-1.5 rounded-lg text-[11px] hover:bg-amber-200 transition">
                                                <i class="fa-solid fa-pen"></i> Edit
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="cmd_del" CommandArgument='<%# Eval("Id") %>' OnClientClick="return confirm('Are you sure you want to delete this record?');" CssClass="bg-rose-100 text-rose-700 font-bold px-3 py-1.5 rounded-lg text-[11px] hover:bg-rose-200 transition">
                                                <i class="fa-solid fa-trash"></i> Delete
                                            </asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

            </asp:Panel>

        </div>
    </div>
</asp:Content>
