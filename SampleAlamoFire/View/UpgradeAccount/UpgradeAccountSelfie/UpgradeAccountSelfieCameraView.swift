//
//  UpgradeAccountIdentityGuide.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 15/01/23.
//

import Foundation
import SwiftUI
import AVFoundation

struct UpgradeAccountSelfieCameraView: View {
    @State var image: UIImage?
    @State var didTapCapture: Bool = false
    @State var useFrontCamera: Bool = true
    let overlayImage = UIImage(named: "ImgSelfieOverlay")!
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottom) {
                CameraPreview(image: self.$image, didTapCapture: $didTapCapture, useFrontCamera: $useFrontCamera)
                Image(uiImage: overlayImage).resizable()
                    .scaledToFill().ignoresSafeArea(.all, edges: .all)
                VStack{
                    Text("Posisikan wajah Anda berada dalam lingkaran dan Identitas berada dalam kotak dibawah ini, pastikan hasil foto terlihat jelas")
                        .font(.system(size: 16, design: .rounded)).foregroundColor(.white).multilineTextAlignment(.center).padding(.all, 16)
                    Spacer()
                    HStack{
                        NavigationLink(destination: UpgradeAccountSelfieResult(imageData: image), isActive: $didTapCapture){
                            Button(action: {
                                self.didTapCapture = true
                            }){
                                ZStack{
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 70)
                                    Circle()
                                        .stroke(Color.gray, lineWidth: 2)
                                        .frame(width: 75)
                                }.frame(width: 75, height: 75).padding(.all, 16)
                            }
                        }
                    }.frame(width: 75, height: 75)
                }.padding(.bottom, 85).padding(.top, 50)
            }
        }
    }
}

struct UpgradeAccountSelfieCameraView_Previews: PreviewProvider {
    static var previews: some View {
        UpgradeAccountSelfieCameraView()
    }
}
