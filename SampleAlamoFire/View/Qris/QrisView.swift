//
//  QrisView.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 25/01/23.
//


import AVKit
import Foundation
import SwiftUI
import VisionKit

enum DataScannerAccessStatusType {
    case notDetermined
    case cameraAccessNotGranted
    case cameraNotAvailable
    case scannerAvailable
    case scannerNotAvailable
}

struct QrisView: View {
    let overlayImage = UIImage(named: "ImgIdentityOverlay")!
    let qrisImage = UIImage(named: "QrisWhite")!
    
    @State private var dataScannerAccessStatus: DataScannerAccessStatusType = .notDetermined
    @State private var recognizedItems: [RecognizedItem] = []
    @State private var textContentType: DataScannerViewController.TextContentType?
    @State private var isCanSubmit: Bool = false
    @State private var image: UIImage?
    @State private var showingImagePicker = false
    
    var recognizedDataType: DataScannerViewController.RecognizedDataType = .barcode()
    
    var body: some View {
        NavigationStack{
            ZStack {
                CustomScanPreview(
                    recognizedItems: $recognizedItems,
                    doneScaning: $isCanSubmit,
                    recognizedDataType: recognizedDataType
                )
                .background(.gray)
                .ignoresSafeArea()
                NavigationLink(destination: QrisResultView(),isActive: $isCanSubmit){}
                Image(uiImage: overlayImage).resizable().frame(width: 200, height: 200)
                VStack(alignment: .center){
                    Text("Scan kode QR")
                        .font(.system(size: 18,weight: .bold, design: .rounded)).foregroundColor(.white).multilineTextAlignment(.center).padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                    Text("Scan kode QR untuk melakukan pembayaran")
                        .font(.system(size: 16, design: .rounded)).foregroundColor(.white).multilineTextAlignment(.center)
                    Image(uiImage: qrisImage).resizable().scaledToFit().frame(height: 25).padding(.all)
                    Spacer()
                    HStack{
                        VStack(alignment: .leading){
                            Text("Gunakan Gambar QRIS").font(.system(size: 18,weight: .bold, design: .rounded)).foregroundColor(.black)
                            Text("Pilih gambar QRIS dari galeri Anda").font(.system(size: 18, design: .rounded)).foregroundColor(.black)
                        }.padding(.all, 20)
                        Spacer()
                        Button(action: {
                            showingImagePicker = true
                        }){
                            Text("Buka Galeri").font(.system(size: 18,weight: .bold, design: .rounded)).foregroundColor(.white).padding(.all, 16)
                        }.background(.teal).padding(.all, 20)
                    }.background(.white)
                }
            }.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$image)
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = image else { return }
        image = inputImage
    }
}

struct QrisView_Previews: PreviewProvider {
    static var previews: some View {
        QrisView()
    }
}
