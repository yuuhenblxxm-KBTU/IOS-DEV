# Design Decisions

## Product (struct)
- **Why struct:**
  A Product is a simple data model that represents an immutable piece of information (name, price, etc.).  
  Products don’t need shared references — if you copy one, it’s still the same product data.
- **Behavior:**  
  Value type — each copy is independent.

## ShoppingCart (class)
- **Why class:**

  The shopping cart represents a **shared, mutable object** that can be updated from multiple parts of a program (e.g. adding or removing items).  
  It must have **reference semantics**, so when you modify a cart inside a function, the original is updated too.

- **Behavior:**  
  Reference type — shared instance among different parts of the app.

### 📦 CartItem (struct)
- **Why struct:**

  Each CartItem simply pairs a Product with a quantity.  
  It’s a lightweight, independent value that doesn’t need to be shared or observed by reference.  
  Updating one item shouldn’t affect another, even if they’re copies.

- **Behavior:**  
  Value type — each item copy is separate.

## 🏠 Address (struct)
- **Why struct:**

  Addresses are immutable data values representing user input.  
  They are typically copied, not shared.  
  The same address data can be reused safely without side effects.

- **Behavior:**  
  Value type.

## 🧾 Order (struct)
- **Why struct:**

  An Order represents an **immutable snapshot** of the cart at checkout time.  
  Once created, it cannot change. Structs perfectly fit this use case — they guarantee immutability by design if all properties are declared with `let`.

- **Behavior:**  
  Value type — each order is an independent record.

# 🧪 Demonstrated Behaviors

1. **Adding products to the cart** — shows cart mutability.  
2. **Updating quantity of the same product** — tests logic inside ShoppingCart.  
3. **Applying a discount** — demonstrates cart recalculation.  
4. **Class (reference type)** — modifying cart inside a function affects the original.  
5. **Struct (value type)** — changing CartItem copy doesn’t affect the original.  
6. **Order snapshot** — after clearing cart, order remains unchanged.
