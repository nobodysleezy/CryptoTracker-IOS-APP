import SwiftUI

let cryptoList: [Crypto] = [
    Crypto(id: "1", name: "Bitcoin", symbol: "BTC", current_price: 50000, image: "https://path/to/bitcoin/image"),
    Crypto(id: "2", name: "Ethereum", symbol: "ETH", current_price: 3500, image: "https://path/to/ethereum/image"),
    Crypto(id: "3", name: "Dogecoin", symbol: "DOGE", current_price: 0.5, image: "https://path/to/dogecoin/image")
]

struct WalletView: View {
    @ObservedObject var walletManager = WalletManager()
    @State private var selectedCoin: Crypto? = nil
    @State private var amountToBuy: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(walletManager.wallet.coins.keys.sorted(), id: \.self) { coinSymbol in
                        if let coin = getCoin(by: coinSymbol) {
                            HStack {
                                Text(coin.name)
                                Spacer()
                                Text("Owned: \(walletManager.getCoinAmount(for: coin), specifier: "%.2f")")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                
                Divider()
                
                Text("Buy Coin")
                    .font(.headline)
                List {
                    ForEach(cryptoList, id: \.id) { coin in
                        HStack {
                            Text(coin.name)
                            Spacer()
                            Text("Price: $\(coin.current_price, specifier: "%.2f")")
                                .foregroundColor(.gray)
                        }
                        .onTapGesture {
                            selectedCoin = coin
                        }
                    }
                }
                
                if let selectedCoin = selectedCoin {
                    HStack {
                        Text("Amount to buy:")
                        TextField("Amount", text: $amountToBuy)
                            .keyboardType(.decimalPad)
                            .padding(5)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                        
                        Button("Buy") {
                            if let amount = Double(amountToBuy), amount > 0 {
                                walletManager.buyCoin(selectedCoin, amount: amount)
                                amountToBuy = ""
                            }
                        }
                        .padding()
                    }
                    .padding()
                }
                
            }
            .navigationTitle("Wallet")
        }
    }

    func getCoin(by symbol: String) -> Crypto? {
        return cryptoList.first { $0.symbol == symbol }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}

