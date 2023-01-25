//
//  QrisResultView.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 25/01/23.
//

import Foundation
import SwiftUI

struct QrisResultView: View {
    @State private var nominalText : String = ""
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Text("Info Merchant").padding(.horizontal, 16).padding(.bottom, 16)
                HStack{
                    ZStack{
                        Color(hex: "#eeeeee").frame(width: 35, height: 35).cornerRadius(5)
                        Image(systemName: "globe")
                    }
                    Text("Some Merchant Name")
                }.padding(.horizontal, 16).padding(.bottom, 16)
                VStack(alignment: .leading){
                    Text("Masukan Nominal Pembayaran")
                    TextField("Nominal Pembayaran", text: $nominalText)
                        .font(Font.system(size: 15))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                }.padding(.horizontal, 16).padding(.bottom, 16)
                HStack{
                    Text("Total Bayar")
                    Spacer()
                    Text("Rp. 0")
                }.padding(.horizontal, 16).padding(.bottom, 16)
                HStack{
                    Text("Saldo Anda")
                    Spacer()
                    Text("Rp. 0")
                }.padding(.horizontal, 16).padding(.bottom, 16)
                Spacer()
                Button(action: {}){
                    Text("Bayar Sekarang").padding(.all, 16).frame(maxWidth: .infinity).foregroundColor(.white)
                }.background(.teal).padding(.all, 16)
            }
        }
    }
}

struct QrisResultView_Previews: PreviewProvider {
    static var previews: some View {
        QrisResultView()
    }
}
