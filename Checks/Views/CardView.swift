//
//  CardView.swift
//  Checks
//
//  Created by Sandaru Vithanage on 2024-12-06.
//

import SwiftUI

struct CardView: View {
    @State var voucher: Voucher
    @Binding var vividTheme : Bool
    
    func getForegoudColor(amount: Double) -> Color {
        switch amount {
        case 1000:
            return Color.cyan
        case 2000:
            return Color.indigo
        case 2500:
            return Color.mint
        case 5000:
            return Color.teal
        case 10000:
            return Color.pink
        default:
            return Color.gray
        }
    }
    
    var body: some View {
        VStack{
        VStack(alignment: .leading) {
            HStack {
                Text(voucher.title)
                Spacer()
                Text("$\(voucher.amount, specifier: ".%.2f")")
            }
            .font(.headline)
            .foregroundStyle(vividTheme ? .white : .black)
            
            Text(voucher.notes)
                .foregroundStyle(vividTheme ? .white : .black)
                .font(.system(size: 14))
                .padding(.top,10)
        }
        .padding(15)
    }
        .background(getForegoudColor(amount: voucher.amount).opacity(vividTheme ? 1 : 0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
      
}

#Preview {
    CardView(voucher: Voucher(title: "ghagsasgow", notes: "gsdhsdh sfdsdhs sdvshgdfs dshd sadfahsdf ahsdf asd asfdha", amount: 1000), vividTheme: .constant(false))
}
