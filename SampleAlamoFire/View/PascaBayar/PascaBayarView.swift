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
    @State private var showGridData = false
    
    var body :some View{
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    Text("Nomor Pelanggan").padding(.horizontal, 16)
                        HStack(alignment: .center){
                            TextField("Example: 08XXXXXXXXXXX", text: $phoneNumber)
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
                }
                if(!showGridData){
                    EmptyPascabayarView()
                }else{
                    Rectangle().fill(Color.green)
                }
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
    var body: some View{
        Text("Hello World")
    }
}

struct PascaBayarView_Previews: PreviewProvider {
    static var previews: some View {
        PascaBayarView()
    }
}


