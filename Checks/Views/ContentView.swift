//
//  ContentView.swift
//  Checks
//
//  Created by Sandaru Vithanage on 2024-12-05.
//

import SwiftUI

struct ContentView: View {
    @StateObject var checksVM = ChecksVM()

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .trailing) {
                HStack {
                    Text("Vouchers")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    
                    Toggle("", isOn: $checksVM.vividTheme)
                }
                .padding(.horizontal)
                
                if checksVM.vouchers.isEmpty {
                    ContentUnavailableView {
                        Label("No vouchers found", systemImage: "square.and.arrow.down")
                    } description: {
                        Text("Add your first voucher to get started.")
                    }
                } else {
                    List(checksVM.vouchers, id: \.self) { voucher in
                        CardView(voucher: voucher, vividTheme: $checksVM.vividTheme)
                    }
                    .listStyle(.plain)
                }
                Spacer()
            }

            Button {
                checksVM.isAddVoucherVisible.toggle()
            } label: {
                Image(systemName: "plus")
                    .padding()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .accessibilityLabel("Add a voucher")
            }
            .padding(.trailing, 30)
            .padding(.bottom, 20)
        }
        .sheet(isPresented: $checksVM.isAddVoucherVisible) {
            AddVoucherView(checksVM: checksVM)
        }
    }
}

#Preview {
    ContentView()
}
