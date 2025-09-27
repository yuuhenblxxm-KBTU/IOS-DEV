// Conversion functions. Use Double for precision
func cToF(_ c: Double) -> Double { return c * 9.0/5.0 + 32.0 }
func cToK(_ c: Double) -> Double { return c + 273.15 }
func fToC(_ f: Double) -> Double { return (f - 32.0) * 5.0/9.0 }
func kToC(_ k: Double) -> Double { return k - 273.15 }


let inputVal: Double = 25.0
let inputUnit = "C"


switch inputUnit.uppercased() {  //fixing the possible lowercase letter error
case "C":
    print("\(inputVal) °C -> \(String(format: "%.2f", cToF(inputVal))) °F")
    print("\(inputVal) °C -> \(String(format: "%.2f", cToK(inputVal))) K")
case "F":
    let c = fToC(inputVal)
    print("\(inputVal) °F -> \(String(format: "%.2f", c)) °C")
    print("\(inputVal) °F -> \(String(format: "%.2f", cToK(c))) K")
case "K":
    let c = kToC(inputVal)
    print("\(inputVal) K -> \(String(format: "%.2f", c)) °C")
    print("\(inputVal) K -> \(String(format: "%.2f", cToF(c))) °F")
default:
    print("Unknown unit")
}