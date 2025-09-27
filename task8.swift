// Ignore spaces/punctuation and case
func isPalindrome(_ text: String) -> Bool {
    let filtered = text.lowercased().filter { $0.isLetter || $0.isNumber }
    return filtered == String(filtered.reversed())
}

let p1 = "A man, a plan, a canal: Panama"
print("\"\(p1)\" -> \(isPalindrome(p1))")