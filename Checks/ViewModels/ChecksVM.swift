//
//  ChecksVM.swift
//  Checks
//
//  Created by Sandaru Vithanage on 2024-12-06.
//
import Foundation
import SwiftUI

class ChecksVM: ObservableObject {
    @Published var vouchers : [Voucher] = []
    @AppStorage("vividTheme") var vividTheme : Bool = true
    @Published var isAddVoucherVisible : Bool = false
    @Published var showError : Bool = false
    @Environment(\.dismiss) var dismiss
    
    func addVoucher(title : String, notes: String, amount: Double) {
        if title == "" || notes == "" {
            showError = true
            return
        }
        
        let voucher = Voucher(title: title, notes: notes, amount: amount)
        vouchers.append(voucher)
        isAddVoucherVisible = false
    }
    
}
