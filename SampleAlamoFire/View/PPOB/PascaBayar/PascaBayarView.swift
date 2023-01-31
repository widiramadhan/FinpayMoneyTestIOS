//
//  PascaBayarView.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 31/01/23.
//

import Foundation
import SwiftUI

struct PascaBayarView: View {
    
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
                EmptyPascabayarView()
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

struct EmptyPascabayarView: View{
    let emptyService = UIImage(named: "EmptyService")!
    var body: some View{
        HStack(){
            Image(uiImage: emptyService).resizable().frame(width: 40, height: 40)
            VStack(alignment: .leading){
                Text("Yuk Mulai Bertransaksi").font(.system(size: 18,weight: .bold, design: .rounded)).foregroundColor(.black)
                Text("Nikmati kemudahan transaksi bersama kami").font(.system(size: 14, design: .rounded)).foregroundColor(.black)
            }
            Spacer()
        }.padding(.all, 16)
    }
}

struct PascaBayarView_Previews: PreviewProvider {
    static var previews: some View {
        PascaBayarView()
    }
}


