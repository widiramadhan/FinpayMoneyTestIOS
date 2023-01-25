//
//  UpgradeAccountIdentityResultView.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 21/01/23.
//

import Foundation
import SwiftUI

struct UpgradeAccountIdentityResult: View {
    var imageData : UIImage?
    @State var image : UIImage?
    @State var getBackToPrevState : Bool = false
    @State var useFrontCamera : Bool = false
    @State var didTapCapture : Bool = false
    
    var body: some View {
        VStack(){
            if(imageData != nil){
                Image(uiImage: imageData!).resizable()
                    .scaledToFit().frame(width: 328, height: 200).padding(.bottom, 16)
            }else{
                Color.gray
                    .scaledToFit().frame(width: 328, height: 200).padding(.bottom, 16)
            }
            
            Text("Hasil Foto Identitas")
                .font(.system(size: 18, weight: .bold, design: .rounded)).padding(.bottom, 10)
            Text("Pastikan hasil foto terbaca dengan jelas dan fokus. Apabila foto dirasa kurang jelas atau buram, Anda dapat mengulang prose pengambilan foto identitas.").multilineTextAlignment(.center)
                .font(.system(size: 16, design: .rounded)).padding(.bottom, 20)
            Spacer()
            HStack{
                NavigationLink(destination: UpgradeAccountIdentityCameraView(), isActive: $getBackToPrevState){
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

struct UpgradeAccountIdentityResult_Previews: PreviewProvider {
    static var previews: some View {
        UpgradeAccountIdentityResult()
    }
}
