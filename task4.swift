// Store list in an array and implement simple operations
var list: [String] = []


func addItem(_ item: String) {
    list.append(item) // add to end
}


func removeItem(_ item: String) {
    if let idx = list.firstIndex(of: item) {
        list.remove(at: idx) // remove by value
    } else {
        print("Item '\(item)' not found")
    }
}


func showList() {
    if list.isEmpty {
        print("Shopping list is empty")
    } else {
        for (i, it) in list.enumerated() {
           print("\(i+1). \(it)")
        }
    }
}


// Demo: add and remove items
addItem("Milk")
addItem("Eggs")
addItem("Bread")
print("After adding:")
showList()
removeItem("Eggs")
print("After removing Eggs:")
showList()