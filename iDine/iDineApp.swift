//
//  iDineApp.swift
//  iDine
//
//  Created by Jeevan Chandra Joshi on 23/12/22.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
