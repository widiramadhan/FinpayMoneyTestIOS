//
//  UpgradeAccountPersonalDataView.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 17/01/23.
//

import Foundation
import SwiftUI

struct UpgradeAccountPersonalDataView: View {
    @State private var motherName : String = ""
    @State private var kkNumber : String = ""
    @State private var nationality : String = ""
    @State private var email : String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                VStack(alignment: .leading){
                    Text("Permintaan Terkirim")
                        .font(.system(size: 20, weight: .bold, design: .rounded)).padding(.bottom, 16)
                    Text("Pastikan data diri sama dengan yang tertera pada kartu keluarga.")
                        .font(.system(size: 14, design: .rounded)).padding(.bottom, 16)
                    
                    Text("Masukan Nama Ibu Kandung")
                                        .font(.system(size: 14, design: .rounded))
                    TextField("Masukan Nama Ibu Kandung", text: $motherName)
                        .font(Font.system(size: 15))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        ).padding(.bottom, 16)
                    
                    Text("Nomor Kartu Keluagra (Oposional)")
                                        .font(.system(size: 14, design: .rounded))
                    TextField("Nomor Kartu Keluagra (Oposional)", text: $kkNumber)
                        .font(Font.system(size: 15))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        ).padding(.bottom, 16)
                    
                    Text("Kewarganegaraan")
                                        .font(.system(size: 14, design: .rounded))
                    TextField("Kewarganegaraan", text: $nationality)
                        .font(Font.system(size: 15))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        ).padding(.bottom, 16)
                    
                    Text("Kewarganegaraan")
                                        .font(.system(size: 14, design: .rounded))
                    TextField("Kewarganegaraan", text: $nationality)
                        .font(Font.system(size: 15))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        ).padding(.bottom, 16)
                }
                
                Spacer()
                Button(action: {
                    // button action here
                }) {
                    Text("LANJUTKAN").frame(minWidth: 0,maxWidth: .infinity)
                        .padding(16).foregroundColor(.white)
                        .background(Color.teal)
                        .cornerRadius(4)
                    
                }
                
            }.padding(EdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 16)).frame( minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity,alignment: .topLeading)
            
        }
    }
}

struct UpgradeAccountPersonalDataView_Previews: PreviewProvider {
    static var previews: some View {
        UpgradeAccountPersonalDataView()
    }
}
