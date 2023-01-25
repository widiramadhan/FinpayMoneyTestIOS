//
//  UpgradeAccountSelfieGuideView.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 15/01/23.
//

import Foundation
import SwiftUI

struct UpgradeAccountSelfieGuideView: View {
    let image = UIImage(named: "ImgUpgradeSelfie")
    var body: some View {
        NavigationView {
            VStack(){
                Image(uiImage: image!).resizable()
                    .scaledToFit().frame(maxWidth: 256, maxHeight: 256).padding(.bottom, 16)
                Text("Foto Selfie dengan Identias")
                    .font(.system(size: 18, weight: .bold, design: .rounded)).padding(.bottom, 10)
                Text("Siapkan Kartu Tanda Penduduk (KTP) Asli Anda untuk melakukan foto selfie dan posisikan kartu identitas sesuai ilustrasi.").multilineTextAlignment(.center)
                    .font(.system(size: 16, design: .rounded)).padding(.bottom, 20)
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

struct UpgradeAccountSelfieGuideView_Previews: PreviewProvider {
    static var previews: some View {
        UpgradeAccountSelfieGuideView()
    }
}
