// Basic operations as functions and demo of several calculations
func add(_ a: Double, _ b: Double) -> Double { a + b }
func sub(_ a: Double, _ b: Double) -> Double { a - b }
func mul(_ a: Double, _ b: Double) -> Double { a * b }
func divd(_ a: Double, _ b: Double) -> Double? { b == 0 ? nil : a / b }


let ops: [(Double, Double, String)] = [
    (5, 3, "+"),
    (8, 2, "-"),
    (6, 7, "*"),
    (10, 0, "/"),
    (9, 3, "/")
]


for (a, b, op) in ops {
    switch op {
    case "+": print("\(a) + \(b) = \(add(a,b))")
    case "-": print("\(a) - \(b) = \(sub(a,b))")
    case "*": print("\(a) * \(b) = \(mul(a,b))")
    case "/":
        if let r = divd(a, b) {
            print("\(a) / \(b) = \(r)")
        } else {
            print("\(a) / \(b) = Error (division by zero)")
        }
    default:
        print("Unknown operation")
    }
}