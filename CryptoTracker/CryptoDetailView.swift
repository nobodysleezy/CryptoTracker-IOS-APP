import SwiftUI

struct CryptoDetailView: View {
    var crypto: Crypto // Detail pro danou kryptoměnu

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: crypto.image)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            } placeholder: {
                ProgressView()
            }
            
            Text(crypto.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(crypto.symbol.uppercased())
                .font(.title2)
                .foregroundColor(.gray)
            
            Text("Price: $\(crypto.current_price, specifier: "%.2f")")
                .font(.title)
                .foregroundColor(.green)
            
            Spacer()
        }
        .padding()
        .navigationTitle(crypto.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CryptoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoDetailView(crypto: Crypto(id: "1", name: "Bitcoin", symbol: "BTC", current_price: 45000.0, image: "https://example.com/bitcoin.png"))
    }
}

