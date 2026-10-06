using System;

namespace SweetDelights
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        public Product CurrentProduct { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string productId = Request.QueryString["id"];

            if (string.IsNullOrEmpty(productId))
            {
                productId = "cake-1"; // Default fallback item
            }

            CurrentProduct = GetProductById(productId);

            if (!IsPostBack && CurrentProduct != null)
            {
                Page.Title = CurrentProduct.Title;
                lblTitle.Text = CurrentProduct.Title;
                lblPrice.Text = "₹" + CurrentProduct.Price.ToString();
                lblUnit.Text = CurrentProduct.Unit;
                lblRating.Text = "★ " + CurrentProduct.Rating.ToString();
                lblReviewsCount.Text = "(" + CurrentProduct.ReviewsCount + " reviews)";
                lblDescription.Text = CurrentProduct.Description;
                lblFullDetails.Text = CurrentProduct.FullDetails;
                lblIngredients.Text = CurrentProduct.Ingredients;
                imgProduct.ImageUrl = CurrentProduct.ImageUrl;
                pnlEgglessBadge.Visible = CurrentProduct.IsEggless;
            }
        }

        private Product GetProductById(string id)
        {
            switch (id)
            {
                case "cake-2":
                    return new Product
                    {
                        Id = "cake-2",
                        Title = "Velvety Red Velvet Cream Cheese Cake",
                        Category = "cakes",
                        IsEggless = true,
                        Price = 700,
                        Unit = "0.5 kg",
                        Rating = 4.8,
                        ReviewsCount = 98,
                        ImageUrl = "https://images.unsplash.com/photo-1586985289688-ca3cf47d3e6e?auto=format&fit=crop&w=800&q=80",
                        Description = "Crimson cocoa sponge infused with real vanilla bean and iced with silky cream cheese frosting.",
                        FullDetails = "Handmade layered celebration cake baked with Dutch cocoa, organic beetroot extract for natural crimson color, and imported Philadelphia cream cheese frosting.",
                        Ingredients = "Pure Butter, Wheat Flour, Cream Cheese, Cocoa Powder, Vanilla Extract, Sugar, Milk."
                    };
                case "cake-3":
                    return new Product
                    {
                        Id = "cake-3",
                        Title = "Fresh Vanilla Berry Celebration Cake",
                        Category = "cakes",
                        IsEggless = true,
                        Price = 850,
                        Unit = "1.0 kg",
                        Rating = 5.0,
                        ReviewsCount = 215,
                        ImageUrl = "https://images.unsplash.com/photo-1535141192574-5d4897c13136?auto=format&fit=crop&w=800&q=80",
                        Description = "Fluffy Madagascar vanilla sponge layered with fresh strawberries, blueberries and whipped cream.",
                        FullDetails = "Light chiffon sponge infused with bourbon vanilla bean caviar, topped with fresh farm-plucked strawberries and edible pansy flowers.",
                        Ingredients = "Fresh Farm Berries, Vanilla Beans, Whipped Cream, Butter, Wheat Flour, Sugar."
                    };
                case "pastry-1":
                    return new Product
                    {
                        Id = "pastry-1",
                        Title = "New York Strawberry Cheesecake Slice",
                        Category = "pastries",
                        IsEggless = true,
                        Price = 240,
                        Unit = "Single Slice",
                        Rating = 4.9,
                        ReviewsCount = 84,
                        ImageUrl = "https://images.unsplash.com/photo-1533134242443-d4fd215305ad?auto=format&fit=crop&w=800&q=80",
                        Description = "Classic dense & creamy New York cheesecake baked over a buttery graham cracker crust with berry glaze.",
                        FullDetails = "Slow-baked at low temperatures for optimum creaminess. Layered over cinnamon graham cracker crumble and topped with fresh strawberry coulis.",
                        Ingredients = "Cream Cheese, Graham Cracker Crumb, Strawberry Purée, Butter, Sugar, Lemon Zest."
                    };
                case "macaron-1":
                    return new Product
                    {
                        Id = "macaron-1",
                        Title = "Parisian Artisanal Macaron Box (6 Pcs)",
                        Category = "macarons",
                        IsEggless = false,
                        Price = 480,
                        Unit = "Box of 6",
                        Rating = 4.9,
                        ReviewsCount = 110,
                        ImageUrl = "https://images.unsplash.com/photo-1569864358642-9d1684040f43?auto=format&fit=crop&w=800&q=80",
                        Description = "Assorted delicate french macarons: Pistachio blush, Strawberry cream, Lemon curd, and Dark Chocolate.",
                        FullDetails = "Crafted following traditional Parisian recipes with California almond flour, natural fruit ganaches, and crispy outer shells.",
                        Ingredients = "Almond Meal, Sugar, Egg Whites, White Chocolate Ganache, Pistachio Paste, Fruit Extracts."
                    };
                default:
                    return new Product
                    {
                        Id = "cake-1",
                        Title = "Royal Belgian Chocolate Truffle Cake",
                        Category = "cakes",
                        IsEggless = true,
                        Price = 650,
                        Unit = "0.5 kg",
                        Rating = 4.9,
                        ReviewsCount = 142,
                        ImageUrl = "https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=800&q=80",
                        Description = "Rich Belgian dark chocolate sponge layered with smooth ganache, cocoa dust & gold leaf flakes.",
                        FullDetails = "Made using 54% dark Belgian chocolate couverture and fresh dairy cream. Finished with shiny ganache drip and 24-karat edible gold dust.",
                        Ingredients = "54% Belgian Chocolate, Dairy Cream, Cocoa Powder, Wheat Flour, Pure Butter, Sugar."
                    };
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            int qty = Convert.ToInt32(txtQuantity.Text);
            if (qty < 1) qty = 1;

            ClientScript.RegisterStartupScript(this.GetType(), "AddToCartScript", 
                $"globalCart.addItem({{ id: '{CurrentProduct.Id}', title: '{CurrentProduct.Title}', price: {CurrentProduct.Price}, image: '{CurrentProduct.ImageUrl}', unit: '{CurrentProduct.Unit}', qty: {qty} }});", true);
        }
    }
}
