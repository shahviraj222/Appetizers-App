//
//  ApptizerListView.swift
//  Appetizers
//
//  Created by viraj shah on 13/05/25.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView{
            List(MockData.appetizeer,id: \.id){ appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("Appetizer")
        }
        
    }
}

#Preview {
    AppetizerListView()
}
