//
//  SearchBar.swift
//  MovieFinder
//
//  Created by Kiko on 22/09/2026.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    
    var body: some View {
            Rectangle()
                .frame(width: .infinity, height: 35)
                .cornerRadius(8)
                .foregroundStyle(.gray.opacity(0.2))
                .overlay {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $searchText)
                        Button {
                            searchText = ""
                        } label: {
                            Image(systemName: "multiply.circle")
                        }
                        .tint(.primary)
                    }
                    .padding(.horizontal, 8)
                }
                .padding(.horizontal)
    }
}

#Preview {
    @Previewable @State var search: String = ""
    SearchBar(searchText: $search)
}
