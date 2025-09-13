import Foundation

let firstName: String = "Adlet"
let lastName: String = "Trum"
let birthYear: Int = 2004
let currentYear: Int = 2025
let isStudent: Bool = true
let height: Double = 1.85
let eyeSight: Double = -8.75
let age: Int = currentYear - birthYear


let favoriteHobby: String = "🎮"
let numberOfHobbies: Int = 4
let favoriteNumber: Int = 16
let isHobbyCreative: Bool = true
let favoriteMovie: String = "Dark Knight"
let favoriteMusicGenre: String = "Hip-hop"

let futureGoals: String = " I am exhausted by playing somewhat professionally for last 8 years because it takes a lot of time and nerves, so in future I want to find a new way to earn money and I want it to be in IT sphere"

let summaryOfMyLife: String = "My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). Some interesting info about me is that I am \(height) meters tall and have very bad eyesight which is \(eyeSight). I am currently a student. I enjoy \(favoriteHobby), which is a creative hobby, because I play half-professionaly in competitive games where you always have to create new strategies and ideas to win a match. I have \(numberOfHobbies) hobbies in total, some of them are watching films, and listetning/writing music. Here some of my favorites: favorite number is \(favoriteNumber), favorite movie is \(favoriteMovie) and favorite genre is \(favoriteMusicGenre)."

print(summaryOfMyLife + futureGoals)
