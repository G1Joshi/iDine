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
    let tipAmounts = [0, 5, 10, 15, 20, 25]
    @State private var paymentMode = "iDine Points"
    @State private var tipAmount = 5
    @State private var isLoyalty = false
    @State private var loyaltyDetails = ""


    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentMode) {
                    ForEach(paymentModes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $isLoyalty.animation())
                if isLoyalty {
                    TextField("Enter your iDine ID", text: $loyaltyDetails)
                }
            }
            Section("Add a tip?") {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("Total: $100") {
                Button("Confirm Order") {}
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
