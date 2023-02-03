//
//  QrisResultView.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 25/01/23.
//

import Foundation
import SwiftUI



struct PulsaDataResultView: View {
    @State private var nominalText : String = ""
    @State private var selectedTabValue : Int = 0
    @State private var showBottomSheet: Bool = false
    
    //let IcUser = UIImage(named: "IcUser")!
    var body: some View {
        NavigationStack{
            ZStack{
                VStack(alignment: .leading){
                    Text("Topup Ke Nomor 08XXXXXXX").font(.system(size: 14, design: .rounded)).foregroundColor(.black).padding(.bottom, 16).padding(.horizontal, 16).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    Picker(selection: $selectedTabValue, label: Text("")) {
                                    Text("Pulsa").tag(0)
                                    Text("Data").tag(1)
                    }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal, 16)
                    TabView(selection: $selectedTabValue,
                                       content:  {
                                            PulsaContentView().tag(0)
                                            KuotaContentView().tag(1)
                                       })
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    Spacer()
                    Button(action: {
                        showBottomSheet = true
                    }){
                        Text("Konfirmasi").padding(.all, 16).frame(maxWidth: .infinity).foregroundColor(.white)
                    }.background(.teal).padding(.all, 16)
                }
                BottomSheet(isShowing: $showBottomSheet, content: AnyView(PulsaDataInquiryBottomSheet()))
            }
            
        }
    }
}

struct KuotaDataCard: Codable{
    var denom : String
    var title : String
    var price : String
}

struct KuotaContentView: View{
    let kotaData: [KuotaDataCard] = [
        KuotaDataCard(denom: "100 MB", title: "Data Telkomsel 100 MB", price: "Rp. 15.000"),
        KuotaDataCard(denom: "500 MB", title: "Data Telkomsel 500 MB", price: "Rp. 25.000"),
        KuotaDataCard(denom: "1 GB", title: "Data Telkomsel 1 GB", price: "Rp. 30.000"),
        KuotaDataCard(denom: "5 GB", title: "Data Telkomsel 5 GB", price: "Rp. 40.000"),
        KuotaDataCard(denom: "10 GB", title: "Data Telkomsel 10 GB", price: "Rp. 50.000"),
        KuotaDataCard(denom: "20 GB", title: "Data Telkomsel 20 GB", price: "Rp. 75.000"),
        KuotaDataCard(denom: "50 GB", title: "Data Telkomsel 50 GB", price: "Rp. 100.000"),
        KuotaDataCard(denom: "100 GB", title: "Data Telkomsel 100 GB", price: "Rp. 150.000"),
        KuotaDataCard(denom: "Unlimited 1 Day", title: "Data Telkomsel Unlimited 1 Day", price: "Rp. 300.000"),
        KuotaDataCard(denom: "Unlimited 30 Day", title: "Data Telkomsel Unlimited 30 Day", price: "Rp. 500.000"),
    ]
    var body: some View{
        ScrollView(.vertical,showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing: 16) {
                ForEach(kotaData, id: \.self.denom) { data in
                    Button(action: {}){
                        VStack(alignment: .leading){
                            Text(data.denom).font(.system(size: 24,weight: .bold, design: .rounded)).foregroundColor(.black).padding(.bottom, 16).multilineTextAlignment(.leading)
                            Text(data.title).font(.system(size: 14, design: .rounded)).foregroundColor(.black).padding(.bottom, 16).multilineTextAlignment(.leading)
                            Text(data.price).font(.system(size: 18,weight: .bold, design: .rounded)).foregroundColor(.black)
                        }.padding(.all, 16).frame(width: 190, alignment: .leading).background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    }
                }
            }
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Pulsa & Paket Data")
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.teal, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct PulsaDataCard: Codable{
    var denom : String
    var title : String
    var price : String
}

struct PulsaContentView: View{
    let pulsaData: [PulsaDataCard] = [
        PulsaDataCard(denom: "15 K", title: "Pulsa Telkomsel Rp. 15.000", price: "Rp. 15.000"),
        PulsaDataCard(denom: "25 K", title: "Pulsa Telkomsel Rp. 25.000", price: "Rp. 25.000"),
        PulsaDataCard(denom: "30 K", title: "Pulsa Telkomsel Rp. 30.000", price: "Rp. 30.000"),
        PulsaDataCard(denom: "40 K", title: "Pulsa Telkomsel Rp. 40.000", price: "Rp. 40.000"),
        PulsaDataCard(denom: "50 K", title: "Pulsa Telkomsel Rp. 50.000", price: "Rp. 50.000"),
        PulsaDataCard(denom: "75 K", title: "Pulsa Telkomsel Rp. 75.000", price: "Rp. 75.000"),
        PulsaDataCard(denom: "100 K", title: "Pulsa Telkomsel Rp. 100.000", price: "Rp. 100.000"),
        PulsaDataCard(denom: "150 K", title: "Pulsa Telkomsel Rp. 150.000", price: "Rp. 150.000"),
        PulsaDataCard(denom: "300 K", title: "Pulsa Telkomsel Rp. 300.000", price: "Rp. 300.000"),
        PulsaDataCard(denom: "500 K", title: "Pulsa Telkomsel Rp. 500.000", price: "Rp. 500.000"),
        PulsaDataCard(denom: "1 M", title: "Pulsa Telkomsel Rp. 1.000.000", price: "Rp. 1000.000"),
    ]
    var body: some View{
        ScrollView(.vertical,showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing: 16) {
                ForEach(pulsaData, id: \.self.denom) { data in
                    Button(action: {}){
                        VStack(alignment: .leading){
                            Text(data.denom).font(.system(size: 24,weight: .bold, design: .rounded)).foregroundColor(.black).padding(.bottom, 16)
                            Text(data.title).font(.system(size: 14, design: .rounded)).foregroundColor(.black).padding(.bottom, 16).multilineTextAlignment(.leading)
                            Text(data.price).font(.system(size: 18,weight: .bold, design: .rounded)).foregroundColor(.black)
                        }.padding(.all, 16).frame(width: 190, alignment: .leading).background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Pulsa & Paket Data")
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.teal, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .padding()
    }
}



struct PulsaDataInquiryBottomSheet: View{
//    let finpayLogo = UIImage(named: "FinpayLogo")!
    let buttonHeight: CGFloat = 55
    @State private var showPaymentView: Bool = false
    
    var body: some View{
        VStack(alignment: .leading) {
            HStack(alignment: .center){
                Spacer()
                Rectangle().fill(Color(hex: "#eeeeee")).frame(width: 100, height: 10, alignment: .center).cornerRadius(4)
                Spacer()
            }.padding(.vertical, 16).padding(.bottom, 16)
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Pembelian")
                    Text("Pembelian Pulsa/Data")
                }.padding(.bottom, 16).padding(.horizontal, 16)
                Rectangle().fill(Color(hex: "#eeeeee")).frame(width: .infinity, height: 10, alignment: .center)
            }.padding(.bottom, 16)
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Rincian Pembayaran")
                    HStack{
                        Text("Harga")
                        Spacer()
                        Text("Rp. 15.000")
                    }
                    HStack{
                        Text("Biaya Layanan")
                        Spacer()
                        Text("Rp. 0")
                    }
                    Rectangle().fill(Color(hex: "#eeeeee")).frame(width: .infinity, height: 2, alignment: .center)
                    HStack{
                        Text("Total")
                        Spacer()
                        Text("Rp. 15.000")
                    }
                }.padding(.bottom, 16).padding(.horizontal, 16)
                Rectangle().fill(Color(hex: "#eeeeee")).frame(width: .infinity, height: 10, alignment: .center)
                HStack{
//                    Image(uiImage: finpayLogo).resizable().frame(width: 40,height: 20)
                    Text("Finpay Money")
                    VStack{
                        Text("Rp. 100.0000").padding(.all, 5)
                    }.background(Color(hex: "#eeeeee")).cornerRadius(5)
                }.padding(.all, 16)
                Button(action: {
                    showPaymentView = true
                }){
                    Text("Bayar Sekarang").padding(.all, 16).frame(maxWidth: .infinity).foregroundColor(.white)
                }.background(.teal).padding(.horizontal, 16)
                NavigationLink("", destination:  WebView(), isActive: $showPaymentView)
            }.padding(.bottom, 16)
        }
    }
}
struct PulsaDataResultView_Previews: PreviewProvider {
    static var previews: some View {
        PulsaDataResultView()
    }
}
