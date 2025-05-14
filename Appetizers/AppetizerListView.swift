//
//  ApptizerListView.swift
//  Appetizers
//
//  Created by viraj shah on 13/05/25.
//

import SwiftUI

struct AppetizerListView: View {
    
    @State private var appetizers : [Appetizer] = []
    
    var body: some View {
        NavigationView{
            List(appetizers){ appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("Appetizer")
        }
//        how to call the fucntion in the view body
        .onAppear{
            getAppetizers()
        }
    }
    
    func getAppetizers(){
        NetworkManager.shared.getAppetizers{ result in
            DispatchQueue.main.async{
                switch result{
                    
                case .success(let appetizers):
//                    changing the state variable
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
            }
        }
    }
    
}

#Preview {
    AppetizerListView()
}
