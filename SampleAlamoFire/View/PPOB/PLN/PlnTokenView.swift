//
//  PulsaDataView.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 01/02/23.
//

import Foundation
import SwiftUI

struct PlnTokenView: View {
    
    @State private var phoneNumber : String = ""
    @State private var selectedToken : TokenData?
    @State private var showPhoneContacts = false
    @State private var showGridData = true
    @State private var showBottomSheet = false
    
    var body :some View{
        ZStack(alignment: .top){
            VStack(alignment: .leading){
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
                    Text("Pilih Token").font(.system(size: 14, design: .rounded)).foregroundColor(.black).padding(.horizontal, 16)
                    Button(action: {
                        showBottomSheet = true
                    }){
                        Text(selectedToken != nil ? selectedToken!.title : "Pilih Nominal").foregroundColor(.black).font(Font.system(size: 15))
                            .padding()
                        Spacer()
                        Image(systemName: "chevron.down").foregroundColor(.teal).padding()
                    }.background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    ).padding(.all, 16)
                }
                Rectangle().fill(Color(hex: "#eeeeee")).frame(width: .infinity, height: 14, alignment: .center)
                EmptyServiceView()
            }.sheet(isPresented: $showPhoneContacts, onDismiss: loadPhoneNumber) {
                PhoneContactsPreview(phoneNumber: self.$phoneNumber)
            }
            BottomSheet(isShowing: $showBottomSheet, content: AnyView(TokenValueBottomSheet(isShowing: $showBottomSheet, selectedToken: $selectedToken)))
        }
    }
    
    func loadPhoneNumber() {
        let selectedPhoneNumber = phoneNumber
        phoneNumber = selectedPhoneNumber
        showGridData = true
    }
}

struct TokenData : Codable{
    var title : String
    var value : String
}

struct TokenValueBottomSheet: View{
    @Binding var isShowing : Bool
    @Binding var selectedToken : TokenData?
    
    let buttonHeight: CGFloat = 55
    let periodeData : [TokenData] = [
        TokenData(title: "10.000", value: "10.000"),
        TokenData(title: "50.000", value: "50.000"),
        TokenData(title: "100.000", value: "100.000"),
        TokenData(title: "200.000", value: "200.000"),
        TokenData(title: "500.000", value: "500.000"),
        TokenData(title: "1000.000", value: "1000.000"),
        TokenData(title: "5000.000", value: "5000.000"),
    ]
    var body: some View{
        VStack(alignment: .leading) {
            HStack(alignment: .center){
                Spacer()
                Rectangle().fill(Color(hex: "#eeeeee")).frame(width: 100, height: 10, alignment: .center).cornerRadius(4)
                Spacer()
            }.padding(.vertical, 16)
            VStack(alignment: .leading){
                Text("Periode Bayar").font(.system(size: 18, weight: .medium, design: .rounded))
                Text("Pilih Periode Bayar").font(.system(size: 16, design: .rounded))
            }.padding(.horizontal, 16)
            ScrollView{
                ForEach(periodeData, id: \.self.title) { data in
                    Button(action: {
                        selectedToken = data
                        isShowing.toggle()
                    }){
                        Text(data.title).foregroundColor(.black).padding(.all, 16).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                }
            }.frame(maxHeight: 300)
        }
    }
}

struct PlnTokenView_Previews: PreviewProvider {
    static var previews: some View {
        PlnTokenView()
    }
}


