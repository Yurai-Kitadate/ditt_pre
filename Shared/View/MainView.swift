//
//  ContentView.swift
//  Shared
//
//  Created by yurai on 2022/05/04.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ProductsListView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            Text("a")
                .tabItem {
                    Image(systemName: "person.fill")
                }
            
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
