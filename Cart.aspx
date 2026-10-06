<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="SweetDelights.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-12">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-8">
            
            <div class="flex items-center justify-between border-b border-rose-100 pb-4">
                <div>
                    <span class="text-xs font-bold uppercase tracking-widest text-rose-600">Your Basket</span>
                    <h1 class="font-serif-heading text-3xl font-bold text-slate-900">Review & Complete Order</h1>
                </div>
                <button type="button" onclick="globalCart.clear(); renderCartPage();" class="text-xs font-semibold text-rose-600 hover:text-rose-800">
                    <i class="fa-solid fa-trash-can"></i> Clear Basket
                </button>
            </div>

            <div class="grid lg:grid-cols-12 gap-8 items-start">
                
                <div class="lg:col-span-7 bg-white rounded-3xl p-6 sm:p-8 border border-rose-100 shadow-xl space-y-4" id="cartPageList">
                    <!-- Populated by JS -->
                </div>

                <div class="lg:col-span-5 bg-white rounded-3xl p-6 sm:p-8 border border-rose-100 shadow-xl space-y-6">
                    <h3 class="font-serif-heading text-xl font-bold text-slate-900 border-b border-slate-100 pb-3">Delivery Information</h3>

                    <div class="space-y-4">
                        <div>
                            <label class="block text-xs font-bold text-slate-700 mb-1">Full Name</label>
                            <asp:TextBox ID="txtCustName" runat="server" placeholder="e.g. Priyank Patel" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-3.5 py-2.5 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                        </div>

                        <div class="grid grid-cols-2 gap-3">
                            <div>
                                <label class="block text-xs font-bold text-slate-700 mb-1">Phone Number</label>
                                <asp:TextBox ID="txtCustPhone" runat="server" placeholder="9876543210" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-3.5 py-2.5 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></asp:TextBox>
                            </div>
                            <div>
                                <label class="block text-xs font-bold text-slate-700 mb-1">Delivery Time</label>
                                <select id="cartCustTime" class="w-full bg-slate-50 border border-slate-200 rounded-xl px-3.5 py-2.5 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium">
                                    <option value="Today Express (Within 2 Hours)">Today Express (2 Hours)</option>
                                    <option value="Today Evening (5 PM - 8 PM)">Today Evening (5-8 PM)</option>
                                    <option value="Tomorrow Morning">Tomorrow Morning</option>
                                </select>
                            </div>
                        </div>

                        <div>
                            <label class="block text-xs font-bold text-slate-700 mb-1">Delivery Address</label>
                            <textarea id="cartCustAddress" required rows="2" placeholder="House #, Society, Landmark, City" class="w-full bg-slate-50 border border-slate-200 rounded-xl px-3.5 py-2.5 text-xs text-slate-800 focus:outline-none focus:border-rose-500 font-medium"></textarea>
                        </div>

                        <div class="flex gap-2">
                            <input type="text" id="promoInput" placeholder="Promo Code (e.g. SWEET15)" class="flex-grow bg-slate-50 border border-slate-200 rounded-xl px-3.5 py-2 text-xs focus:outline-none uppercase">
                            <button type="button" onclick="applyPromoCode()" class="bg-slate-800 hover:bg-slate-900 text-white font-bold px-4 py-2 rounded-xl text-xs transition">Apply</button>
                        </div>
                        <p id="promoMessage" class="text-[11px] font-bold text-emerald-600 hidden">✓ Promo code SWEET15 applied! (15% discount applied)</p>

                        <div class="bg-rose-50/70 rounded-2xl p-4 space-y-2 text-xs border border-rose-100">
                            <div class="flex justify-between text-slate-600">
                                <span>Items Subtotal:</span>
                                <span id="pageSubtotal" class="font-bold text-slate-900">₹0</span>
                            </div>
                            <div class="flex justify-between text-slate-600">
                                <span>Discount:</span>
                                <span id="pageDiscount" class="font-bold text-rose-600">-₹0</span>
                            </div>
                            <div class="flex justify-between text-slate-600">
                                <span>Delivery Charge:</span>
                                <span class="font-bold text-emerald-600">FREE</span>
                            </div>
                            <div class="flex justify-between text-sm font-bold text-slate-900 pt-2 border-t border-rose-200/80">
                                <span>Grand Total:</span>
                                <span id="pageGrandTotal" class="text-rose-600 text-xl font-serif-heading">₹0</span>
                            </div>
                        </div>

                        <button type="button" onclick="handleCartPageCheckout(event)" class="w-full bg-rose-600 hover:bg-rose-700 text-white font-bold py-4 rounded-2xl shadow-xl transition flex items-center justify-center gap-2 text-xs cursor-pointer">
                            <i class="fa-solid fa-bag-shopping text-base"></i> Confirm & Place Order Now
                        </button>
                    </div>

                </div>

            </div>

        </div>
    </div>

    <script>
        let discountPercent = 0;

        function renderCartPage() {
            const container = document.getElementById('cartPageList');
            if (!container) return;

            if (globalCart.cart.length === 0) {
                container.innerHTML = `
                  <div class="text-center py-16 text-slate-400">
                    <i class="fa-solid fa-basket-shopping text-6xl mb-4 text-rose-200"></i>
                    <h3 class="font-serif-heading text-xl font-bold text-slate-800">Your basket is currently empty</h3>
                    <p class="text-xs text-slate-500 mt-1">Browse our catalog and pick something sweet!</p>
                    <a href="Show_Products.aspx" class="inline-block mt-4 bg-rose-600 text-white text-xs font-bold px-6 py-3 rounded-full shadow hover:bg-rose-700 transition">Explore Catalog</a>
                  </div>
                `;
            } else {
                container.innerHTML = globalCart.cart.map(item => `
                  <div class="flex items-center gap-4 p-4 bg-slate-50 border border-slate-200/80 rounded-2xl">
                    <img src="${item.image}" alt="${item.title}" class="w-16 h-16 rounded-xl object-cover border border-rose-100">
                    <div class="flex-grow">
                      <h4 class="font-serif-heading font-bold text-sm text-slate-900">${item.title}</h4>
                      <span class="text-xs text-slate-500">${item.unit || ''}</span>
                      ${item.details ? `<p class="text-[10px] text-rose-600 mt-0.5">${item.details}</p>` : ''}
                      <div class="text-xs font-bold text-rose-600 mt-1">₹${item.price} each</div>
                    </div>
                    
                    <div class="flex items-center gap-2 bg-white border border-slate-200 rounded-xl px-3 py-1.5 shadow-sm">
                      <button type="button" onclick="globalCart.updateQty('${item.id}', -1); renderCartPage();" class="text-slate-500 hover:text-rose-600 font-bold text-sm w-6 h-6">-</button>
                      <span class="text-xs font-bold text-slate-900 w-4 text-center">${item.qty}</span>
                      <button type="button" onclick="globalCart.updateQty('${item.id}', 1); renderCartPage();" class="text-slate-500 hover:text-rose-600 font-bold text-sm w-6 h-6">+</button>
                    </div>

                    <div class="font-serif-heading font-bold text-slate-900 text-base">
                      ₹${item.price * item.qty}
                    </div>
                  </div>
                `).join('');
            }

            updateTotals();
        }

        function applyPromoCode() {
            const code = (document.getElementById('promoInput').value || '').trim().toUpperCase();
            if (code === 'SWEET15') {
                discountPercent = 0.15;
                document.getElementById('promoMessage').classList.remove('hidden');
            } else {
                alert('Invalid promo code. Use SWEET15 for 15% off!');
            }
            updateTotals();
        }

        function updateTotals() {
            const subtotal = globalCart.getSubtotal();
            const discount = Math.round(subtotal * discountPercent);
            const grandTotal = subtotal - discount;

            document.getElementById('pageSubtotal').textContent = `₹${subtotal}`;
            document.getElementById('pageDiscount').textContent = `-₹${discount}`;
            document.getElementById('pageGrandTotal').textContent = `₹${grandTotal}`;
        }

        function handleCartPageCheckout(e) {
            e.preventDefault();
            if (globalCart.cart.length === 0) {
                alert('Your basket is empty!');
                return;
            }

            const nameElement = document.getElementById('<%= txtCustName.ClientID %>');
            const name = nameElement && nameElement.value.trim() !== '' ? nameElement.value.trim() : 'Valued Customer';
            const subtotal = globalCart.getSubtotal();
            const discount = Math.round(subtotal * discountPercent);
            const grandTotal = subtotal - discount;

            alert(`🎉 Thank you ${name}! Your order worth ₹${grandTotal} has been placed successfully!`);
            globalCart.clear();
            renderCartPage();
            window.location.href = "Default.aspx";
        }

        document.addEventListener('DOMContentLoaded', () => {
            renderCartPage();
        });
    </script>
</asp:Content>
