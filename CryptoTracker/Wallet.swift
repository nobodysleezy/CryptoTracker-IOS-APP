import Foundation

struct Wallet {
    var seedPhrase: String
    var privateKey: String
    var balance: Double
    var coins: [String: Double] // Mapování symbolu kryptoměny na množství
}

