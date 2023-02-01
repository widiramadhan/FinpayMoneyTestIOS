//
//  PulsaDataView.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 01/02/23.
//

import Foundation
import SwiftUI

struct BpjsView: View {
    
    @State private var phoneNumber : String = ""
    @State private var selectedPeriod : PeriodeData?
    @State private var showPhoneContacts = false
    @State private var showGridData = true
    @State private var showBottomSheet = false
    
    var body :some View{
        NavigationStack{
            ZStack{
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
                        Text("Pilih Periode").font(.system(size: 14, design: .rounded)).foregroundColor(.black).padding(.horizontal, 16)
                        Button(action: {
                            showBottomSheet = true
                        }){
                            Text(selectedPeriod != nil ? selectedPeriod!.title : "Pilih Periode").foregroundColor(.black).font(Font.system(size: 15))
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
                BottomSheet(isShowing: $showBottomSheet, content: AnyView(PeriodeBottomSheet(isShowing:$showBottomSheet ,selectedPeriod: $selectedPeriod)))
            }
        }
    }
    
    func loadPhoneNumber() {
        let selectedPhoneNumber = phoneNumber
        phoneNumber = selectedPhoneNumber
        showGridData = true
    }
}

struct PeriodeData : Codable{
    var title : String
    var value : String
}

struct PeriodeBottomSheet: View{
    @Binding var isShowing : Bool
    @Binding var selectedPeriod : PeriodeData?
    
    let buttonHeight: CGFloat = 55
    let periodeData : [PeriodeData] = [
        PeriodeData(title: "Febuari 2023", value: "Feb23"),
        PeriodeData(title: "Maret 2023", value: "Mar23"),
        PeriodeData(title: "April 2023", value: "Apr23"),
        PeriodeData(title: "Mei 2023", value: "Mei23"),
        PeriodeData(title: "Juni 2023", value: "Jun23"),
        PeriodeData(title: "Juli 2023", value: "Jul23"),
        PeriodeData(title: "Agustus 2023", value: "Ags23"),
        PeriodeData(title: "September 2023", value: "Sep23"),
        PeriodeData(title: "Oktober 2023", value: "Okt23"),
        PeriodeData(title: "November 2023", value: "Nov23"),
        PeriodeData(title: "Desember 2023", value: "Des23"),
        
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
                        selectedPeriod = data
                        isShowing.toggle()
                    }){
                        Text(data.title).foregroundColor(.black).padding(.all, 16).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                }
            }.frame(maxHeight: 300)
        }
    }
}

struct BpjsView_Previews: PreviewProvider {
    static var previews: some View {
        BpjsView()
    }
}


