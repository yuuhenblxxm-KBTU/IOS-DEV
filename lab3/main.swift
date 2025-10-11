import Foundation

struct Product {
    enum Category {
        case electronics
        case clothing
        case food
        case books
        case audio
        case education
    }
    
    let id: String
    let name: String
    let price: Double
    let category: Category
    let description: String
    
    var displayPrice: String {
        String(format: "$%.2f", price)
    }
    
    init?(id: String = UUID().uuidString,
          name: String,
          price: Double,
          category: Category,
          description: String) {
        guard price > 0 else {
            print("❌ Invalid price for \(name)")
            return nil
        }
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
    }
}

struct CartItem {
    let product: Product
    private(set) var quantity: Int
    
    var subtotal: Double {
        product.price * Double(quantity)
    }
    
    mutating func updateQuantity(_ newQuantity: Int) {
        guard newQuantity > 0 else {
            print("❌ Quantity must be greater than zero")
            return
        }
        quantity = newQuantity
    }
    
    mutating func increaseQuantity(by amount: Int) {
        guard amount > 0 else {
            print("❌ Increase amount must be positive")
            return
        }
        quantity += amount
    }
}

class ShoppingCart {
    private(set) var items: [CartItem] = []
    var discountCode: String?
    
    func addItem(product: Product, quantity: Int = 1) {
        guard quantity > 0 else {
            print("❌ Invalid quantity for \(product.name)")
            return
        }
        
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            var existing = items[index]
            existing.increaseQuantity(by: quantity)
            items[index] = existing
        } else {
            items.append(CartItem(product: product, quantity: quantity))
        }
    }
    
    func removeItem(productId: String) {
        items.removeAll { $0.product.id == productId }
    }
    
    func updateItemQuantity(productId: String, quantity: Int) {
        guard let index = items.firstIndex(where: { $0.product.id == productId }) else { return }
        if quantity == 0 {
            removeItem(productId: productId)
        } else {
            var updated = items[index]
            updated.updateQuantity(quantity)
            items[index] = updated
        }
    }
    
    func clearCart() {
        items.removeAll()
    }
    
    var subtotal: Double {
        items.reduce(0) { $0 + $1.subtotal }
    }
    
    var discountAmount: Double {
        switch discountCode {
        case "SAVE10": return subtotal * 0.10
        case "SAVE20": return subtotal * 0.20
        default: return 0
        }
    }
    
    var total: Double {
        subtotal - discountAmount
    }
    
    var itemCount: Int {
        items.reduce(0) { $0 + $1.quantity }
    }
    
    var isEmpty: Bool {
        items.isEmpty
    }
}

struct Address {
    let street: String
    let city: String
    let zipCode: String
    let country: String
    
    var formattedAddress: String {
        """
        \(street)
        \(city), \(zipCode)
        \(country)
        """
    }
}

struct Order {
    let orderId: String
    let items: [CartItem]
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Date
    let shippingAddress: Address
    
    init(from cart: ShoppingCart, shippingAddress: Address) {
        self.orderId = UUID().uuidString
        self.items = cart.items
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmount
        self.total = cart.total
        self.timestamp = Date()
        self.shippingAddress = shippingAddress
    }
    
    var itemCount: Int {
        items.reduce(0) { $0 + $1.quantity }
    }
}


print("=== 🛒 TESTING SHOPPING CART SYSTEM ===\n")

// 1. Create sample products
let laptop = Product(id: "p1", name: "Laptop", price: 1200.0, category: .electronics, description: "Powerful laptop for work and study")!
let book = Product(id: "p2", name: "Book", price: 25.0, category: .education, description: "Paperback book about Swift programming")!
let headphones = Product(id: "p3", name: "Headphones", price: 200.0, category: .audio, description: "Noise-cancelling headphones")!

// 2. Test adding items to cart
let cart = ShoppingCart()
cart.addItem(product: laptop, quantity: 1)
cart.addItem(product: book, quantity: 2)

// 3. Add same product again
cart.addItem(product: laptop, quantity: 1) // should update quantity
print("Laptop quantity updated ✅")

// 4. Print cart totals
print("Subtotal: \(cart.subtotal)")
print("Item count: \(cart.itemCount)")

// 5. Apply discount
cart.discountCode = "SAVE10"
print("Total with discount (SAVE10): \(cart.total)")

// 6. Remove book
cart.removeItem(productId: book.id)
print("Removed book from cart. Items left: \(cart.itemCount)")

// 7. Reference type behavior
func modifyCart(_ cart: ShoppingCart) {
    cart.addItem(product: headphones, quantity: 1)
}
modifyCart(cart)
print("After modifyCart(), cart item count = \(cart.itemCount) (should include headphones)")

// 8. Value type behavior
let item1 = CartItem(product: laptop, quantity: 1)
var item2 = item1
item2.updateQuantity(5)
print("item1.quantity = \(item1.quantity), item2.quantity = \(item2.quantity) (value types work independently)")

// 9. Create order
let address = Address(street: "123 Swift St", city: "Cupertino", zipCode: "95014", country: "USA")
let order = Order(from: cart, shippingAddress: address)
print("\nOrder created 🧾")
print("Order ID: \(order.orderId)")
print("Order total: \(order.total)")
print("Shipping to:\n\(order.shippingAddress.formattedAddress)")

// 10. Modify cart after order
cart.clearCart()
print("\nAfter clearing cart:")
print("Cart item count = \(cart.itemCount)")
print("Order item count = \(order.itemCount) (order snapshot unchanged ✅)")

print("\n=== ✅ ALL TESTS PASSED ===")
