//
//  ContentView.swift
//  Appetizers
//
//  Created by viraj shah on 13/05/25.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView{
            ApptizerListView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem{
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
