//
//  UpgradeAccount.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 14/01/23.
//

import Foundation
import SwiftUI

struct UpgradeAccountView: View {
    let image = UIImage(named: "ImgUpgradeAccount")
    var body: some View {
        NavigationView {
            VStack(){
                Image(uiImage: image!).resizable()
                    .scaledToFit().frame(maxWidth: 256, maxHeight: 256).padding(.bottom, 16)
                Text("Verifikasi Identitas Anda")
                    .font(.system(size: 18, weight: .bold, design: .rounded)).padding(.bottom, 10)
                Text("Lakukan verifikasi identitas sebelum menggunakan fitur ini. Berikut 3 langkah mudah verifikasi dan upgrade akun Anda.").multilineTextAlignment(.center)
                    .font(.system(size: 16, design: .rounded)).padding(.bottom, 20)
                UpgradeAccountGuide(order: 1, text: "Unggah foto identitas")
                UpgradeAccountGuide(order: 2, text: "Unggah foto selfie dengan identitas Anda")
                UpgradeAccountGuide(order: 3, text: "Lengkapi detai data diri Anda")
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

struct UpgradeAccountView_Previews: PreviewProvider {
    static var previews: some View {
        UpgradeAccountView()
    }
}

struct UpgradeAccountGuide: View{
    var order :Int
    var text: String
    var body : some View{
        HStack{
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                Text("\(order)")
                    .foregroundColor(.white)
            }
            Text("\(text)").font(.system(size: 16)).padding(.horizontal, 16).frame(maxWidth: .infinity, alignment: .leading)
        }.frame(maxWidth: .infinity)
    }
}

