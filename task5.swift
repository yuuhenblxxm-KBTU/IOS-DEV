let sentence = "Hello, hello! This is a test. Test, one-two; three."
// split by non-alphanumeric characters and filter out empty parts
let words = sentence.lowercased()
    .components(separatedBy: CharacterSet.alphanumerics.inverted)
    .filter { !$0.isEmpty }


var freq: [String: Int] = [:]
for w in words {
    freq[w, default: 0] += 1
}87
// Print in alphabetical order of keys
for (w, c) in freq.sorted(by: { $0.key < $1.key }) {
print("\(w): \(c)")
}