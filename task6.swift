// Return the first n Fibonacci numbers (starting from 0, 1)
func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 { return [] }
    if n == 1 { return [0] }
    var seq = [0, 1]
    while seq.count < n {
        let next = seq[seq.count - 1] + seq[seq.count - 2]
        seq.append(next)
    }
    return seq
}


print(fibonacci(10)) // example: first 10