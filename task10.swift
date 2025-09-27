// Case-sensitive: 'A' != 'a'
func hasUniqueCharacters(_ s: String) -> Bool {
    var seen = Set<Character>()
    for ch in s {
        if seen.contains(ch) { return false }
        seen.insert(ch)
    }
    return true
}


print("'Hello' -> \(hasUniqueCharacters("Hello"))")
print("'World' -> \(hasUniqueCharacters("World"))")