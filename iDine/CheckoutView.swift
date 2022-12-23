//
//  CheckoutView.swift
//  iDine
//
//  Created by Jeevan Chandra Joshi on 23/12/22.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order

    let paymentModes = ["Cash", "Credit Card", "Debit Card", "Net Banking", "iDine Points"]
    @State private var paymentMode = "iDine Points"

    var body: some View {
        VStack {
            Section {
                Picker("How do you want to pay?", selection: $paymentMode) {
                    ForEach(paymentModes, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
