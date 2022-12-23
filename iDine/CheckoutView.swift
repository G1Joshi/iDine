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
    @State private var isPaymentAlert = false

    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "INR"))
    }

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
            Section("Total: \(totalPrice)") {
                Button("Confirm Order") {
                    isPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order Confirmed", isPresented: $isPaymentAlert) {} message: {
            Text("Your total was \(totalPrice)\nThank you!")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
