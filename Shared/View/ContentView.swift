//
//  ContentView.swift
//  Shared
//
//  Created by yurai on 2022/05/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            NavigationLink(destination: ProductsListView()){
                Text("Hello, ditt!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
