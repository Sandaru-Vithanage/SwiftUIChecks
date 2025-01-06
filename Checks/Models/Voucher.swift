//
//  Voucher.swift
//  Checks
//
//  Created by Sandaru Vithanage on 2024-12-06.
//

import Foundation

struct Voucher : Hashable {
    let title: String
    let notes: String
    let amount: Double
    
    init(title: String, notes: String, amount: Double) {
        self.title = title
        self.notes = notes
        self.amount = amount
    }
}
