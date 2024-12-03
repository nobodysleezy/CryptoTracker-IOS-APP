import Foundation

class WalletManager: ObservableObject {
    @Published var wallet: Wallet
    
    init() {
        // Inicializace s prázdnou peněženkou
        wallet = Wallet(seedPhrase: "", privateKey: "", balance: 0.0, coins: [:])
    }
    
    // Funkce pro nákup kryptoměny
    func buyCoin(_ coin: Crypto, amount: Double) {
        // Aktualizace stavu peněženky
        if wallet.coins[coin.symbol] == nil {
            wallet.coins[coin.symbol] = amount
        } else {
            wallet.coins[coin.symbol]! += amount
        }
    }
    
    // Funkce pro získání množství kryptoměny
    func getCoinAmount(for coin: Crypto) -> Double {
        return wallet.coins[coin.symbol] ?? 0.0
    }
}

