//
//  QrisView.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 25/01/23.
//


import Foundation
import SwiftUI

struct QrisView: View {
    let overlayImage = UIImage(named: "ImgIdentityOverlay")!
    let qrisImage = UIImage(named: "QrisWhite")!
    var body: some View {
        NavigationStack{
            ZStack {
                Color.black
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
                            Text("Gunakan Gambar QRIS").font(.system(size: 18,weight: .bold, design: .rounded))
                            Text("Pilih gambar QRIS dari galeri Anda").font(.system(size: 18, design: .rounded))
                        }.padding(.all, 20)
                        Spacer()
                        Button(action: {}){
                            Text("Buka Galeri").font(.system(size: 18,weight: .bold, design: .rounded)).foregroundColor(.white).padding(.all, 16)
                        }.background(.teal).padding(.all, 20)
                    }.background(.white)
                }
            }
        }
    }
}

struct QrisView_Previews: PreviewProvider {
    static var previews: some View {
        QrisView()
    }
}
