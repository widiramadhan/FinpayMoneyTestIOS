//
//  UpgradeAccountSelfieResult.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 19/01/23.
//

import Foundation
import SwiftUI

struct UpgradeAccountSelfieResult: View {
    @State var getBackToPrevState : Bool = false
    var imageData : UIImage?
    var didTapCapture : Bool = false
    var body: some View {
        VStack(){
            if(imageData != nil){
                Image(uiImage: imageData!).resizable()
                    .scaledToFit().frame(width: 328, height: 400).padding(.bottom, 16)
            }else{
                Color.gray
                    .scaledToFit().frame(width: 328, height: 400).padding(.bottom, 16)
            }
            
            Text("Hasil Foto Selfie")
                .font(.system(size: 18, weight: .bold, design: .rounded)).padding(.bottom, 10)
            Text("Pastikan wajah terlihat jelas dan tanpa menggunakan kacamata, topi atau penghalang wajah lainnya serta hasil tidak buram.").multilineTextAlignment(.center)
                .font(.system(size: 16, design: .rounded)).padding(.bottom, 20)
            Spacer()
            HStack{
                NavigationLink(destination: UpgradeAccountSelfieCameraView(didTapCapture: didTapCapture), isActive: $getBackToPrevState){
                    Button(action: {
                        self.getBackToPrevState = true
                    }) {
                        Text("ULANGI").frame(minWidth: 0,maxWidth: .infinity)
                            .padding(16).foregroundColor(.white)
                            .background(Color.teal)
                            .cornerRadius(4)
                    }
                }
                Button(action: {
                    // button action here
                }) {
                    Text("LANJUTKAN").frame(minWidth: 0,maxWidth: .infinity)
                        .padding(16).foregroundColor(.white)
                        .background(Color.teal)
                        .cornerRadius(4)
                }
                
            }
        }.padding(EdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 16)).frame( minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity,alignment: .topLeading)
    }
}

struct UpgradeAccountSelfieResult_Previews: PreviewProvider {
    static var previews: some View {
        UpgradeAccountSelfieResult()
    }
}
