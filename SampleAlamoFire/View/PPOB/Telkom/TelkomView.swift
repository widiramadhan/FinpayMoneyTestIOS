//
//  PulsaDataView.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 01/02/23.
//

import Foundation
import SwiftUI

struct TelkomView: View {
    
    @State private var phoneNumber : String = ""
    @State private var showPhoneContacts = false
    @State private var showGridData = true
    
    var body :some View{
        NavigationStack{
            VStack(alignment: .leading){
                Text("Nomor Pelanggan").font(.system(size: 14, design: .rounded)).foregroundColor(.black).padding(.horizontal, 16)
                    HStack(alignment: .center){
                        TextField("", text: $phoneNumber)
                            .font(Font.system(size: 15))
                            .padding()
                        Button(action: {
                            showPhoneContacts = true
                        }){
                            Image(systemName: "person.crop.square.fill").foregroundColor(.white)
                        }.background(.teal).padding()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    ).padding(.horizontal, 16).padding(.bottom, 16)
                Rectangle().fill(Color(hex: "#eeeeee")).frame(width: .infinity, height: 14, alignment: .center)
                EmptyServiceView()
                Spacer()
                Button(action: {
                    // button action here
                }) {
                    Text("LANJUTKAN").frame(minWidth: 0,maxWidth: .infinity)
                        .padding(16).foregroundColor(.white)
                        .background(Color.teal)
                        .cornerRadius(4)
                    
                }.padding(.all, 16)
            }.sheet(isPresented: $showPhoneContacts, onDismiss: loadPhoneNumber) {
                PhoneContactsPreview(phoneNumber: self.$phoneNumber)
            }
        }
    }
    
    func loadPhoneNumber() {
        let selectedPhoneNumber = phoneNumber
        phoneNumber = selectedPhoneNumber
        showGridData = true
    }
}

struct TelkomView_Previews: PreviewProvider {
    static var previews: some View {
        TelkomView()
    }
}


