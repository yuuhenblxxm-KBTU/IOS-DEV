// Prime number check
func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false } // 0 and 1 are not prime
    if n == 2 { return true }
    if n % 2 == 0 { return false }
    var i = 3
    // check divisors up to sqrt(n)
    while i * i <= n {
        if n % i == 0 { return false }
        i += 2
    }
    return true
}


// Print prime numbers in the range
for n in 1...100 {
    if isPrime(n) {
        print(n, terminator: " ")
    }
}
print("")