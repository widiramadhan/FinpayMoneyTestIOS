//
//  UpgradeAccountSuccess.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 15/01/23.
//

import Foundation
import SwiftUI

struct UpgradeAccountSuccessView: View {
    let image = UIImage(named: "ImgUpgradeAccountSuccess")
    var body: some View {
        NavigationView {
            VStack(){
                Image(uiImage: image!).resizable()
                    .scaledToFit().frame(maxWidth: 256, maxHeight: 256).padding(.bottom, 16)
                Text("Permintaan Terkirim")
                    .font(.system(size: 18, weight: .bold, design: .rounded)).padding(.bottom, 10)
                Text("Terima kasih telah melakukan permintaan upgrade akun. Kami akan melakukan verifikasi secepatnya.").multilineTextAlignment(.center)
                    .font(.system(size: 16, design: .rounded)).padding(.bottom, 20)
                UpgradeAccountGuide(order: 1, text: "Permintaan menjadi pengguna premium akan diproses maksimal 3 x 24 jam (hari kerja")
                UpgradeAccountGuide(order: 2, text: "Untuk informasi lebih lanjut, hubungi 021 1500 770 atau kirim email ke care@finpay.id")
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

struct UpgradeAccountSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        UpgradeAccountSuccessView()
    }
}
