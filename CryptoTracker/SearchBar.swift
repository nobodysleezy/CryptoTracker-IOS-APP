import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        TextField("Search", text: $text)
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 8)
                    Spacer()
                }
            )
            .padding(.horizontal)
    }
}

