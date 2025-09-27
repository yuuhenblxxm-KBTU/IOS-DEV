// Hardcoded list of students and their scores
let students: [String: Int] = [
    "Ayan": 85,
    "Bota": 72,
    "Cema": 90,
    "Dina": 66
]
let scores = Array(students.values)
let avg = Double(scores.reduce(0, +)) / Double(scores.count)
let maxScore = scores.max() ?? 0
let minScore = scores.min() ?? 0


print(String(format: "Average: %.2f", avg))
print("Highest: \(maxScore), Lowest: \(minScore)")
for (name, score) in students.sorted(by: { $0.key < $1.key }) {
    let status = score >= Int(round(avg)) ? "above or equal" : "below"
    print("\(name): \(score) — \(status) average")
}