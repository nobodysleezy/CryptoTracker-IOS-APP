import SwiftUI

struct ContentView: View {
    @State private var cryptoList: [Crypto] = [] // Seznam kryptoměn

    var body: some View {
        NavigationView {
            VStack {
                if cryptoList.isEmpty {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    List(cryptoList) { crypto in
                        NavigationLink(destination: CryptoDetailView(crypto: crypto)) {
                            HStack {
                                AsyncImage(url: URL(string: crypto.image)) { image in
                                    image.resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                } placeholder: {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle())
                                }
                                Text(crypto.name)
                                    .font(.headline)
                                Spacer()
                                Text("$\(crypto.current_price, specifier: "%.2f")")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .onAppear {
                fetchCryptos() // Načítání kryptoměn
            }
            .navigationTitle("CryptoTracker")
        }
    }

    func fetchCryptos() {
        print("Fetching cryptos...") // Log pro ladění
        let cryptoService = CryptoService()
        cryptoService.fetchCryptos { cryptos in
            print("Cryptos fetched: \(cryptos)") // Log pro ladění
            self.cryptoList = cryptos
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

