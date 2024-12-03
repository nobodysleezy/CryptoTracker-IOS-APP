import Foundation

class CryptoService {
    func fetchCryptos(completion: @escaping ([Crypto]) -> Void) {
        // URL pro CoinGecko API
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")!
        
        // Stahování dat z API
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    // Dekódování JSON do pole Crypto
                    let cryptos = try decoder.decode([Crypto].self, from: data)
                    print("Data successfully decoded: \(cryptos)") // Log pro ladění
                    DispatchQueue.main.async {
                        completion(cryptos) // Vrácení dat na hlavní vlákno
                    }
                } catch {
                    print("Chyba při dekódování JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)") // Log pro chyby
            }
        }.resume()
    }
}

