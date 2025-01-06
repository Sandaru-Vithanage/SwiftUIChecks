//
//  AddVoucherView.swift
//  Checks
//
//  Created by Sandaru Vithanage on 2024-12-06.
//
import SwiftUI

struct AddVoucherView: View {
    @State private var title: String = ""
    @State private var note: String = ""
    @State private var amount: Double = 1000.00
    @ObservedObject var checksVM: ChecksVM
    @Environment(\.dismiss) var dismiss
    
    private let prices: [Double] = [1000.00, 2000.00, 3000.00, 4000.00, 5000.00]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Note", text: $note)
                }
                Section {
                    Picker("Amount", selection: $amount) {
                        ForEach(prices, id: \.self) { price in
                            Text("\(price, specifier: "%.0f")")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
            }
            .navigationTitle("Add Voucher")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Dismiss") { dismiss() }
                        .tint(.red)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        checksVM.addVoucher(title: title, notes: note, amount: amount)
                    }
                    .tint(.blue)
                }
            }
            .alert("Error", isPresented: $checksVM.showError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Title and Note cannot be empty.")
            }
        }
    }
}

#Preview {
    AddVoucherView(checksVM: ChecksVM())
}
