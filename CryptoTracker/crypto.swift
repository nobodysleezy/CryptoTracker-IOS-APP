import Foundation

// Model pro kryptoměnu
struct Crypto: Identifiable, Codable {
    let id: String
    let name: String
    let symbol: String
    let current_price: Double
    let image: String
}

