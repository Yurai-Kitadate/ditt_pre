//
//  ContentView.swift
//  Shared
//
//  Created by yurai on 2022/05/04.
//

import SwiftUI

struct MainView: View {
    @State private var selection : Int = 0
    init() {
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().unselectedItemTintColor = .gray
    }
    var body: some View {
        
        ProductsListView()
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
