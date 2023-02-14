//
//  Home.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 03/02/23.
//

import Foundation
import SwiftUI

struct MenuData{
    var menuTag : Int
    var menuImage : UIImage
    var menuTitle : String
    var menuDestination : AnyView
}

struct HomeView: View {
    let menuItems : [MenuData] = [
        MenuData(menuTag: 0,
                 menuImage: UIImage(named: "PulsaData")!,menuTitle: "Pulsa Data", menuDestination: AnyView(PulsaDataView())),
        MenuData(menuTag: 1,
                 menuImage: UIImage(named: "PascaBayar")!,menuTitle: "Pascabayar", menuDestination: AnyView(PascaBayarView())),
        MenuData(menuTag: 2,
                 menuImage: UIImage(named: "BPJS")!,menuTitle: "PBJS", menuDestination: AnyView(BpjsView())),
        MenuData(menuTag: 3,
                 menuImage: UIImage(named: "PLN")!,menuTitle: "PLN", menuDestination: AnyView(PlnView())),
        MenuData(menuTag: 4,
                 menuImage: UIImage(named: "Telkom")!,menuTitle: "Telkom", menuDestination: AnyView(PulsaDataView())),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical,showsIndicators: false) {
                HStack{
                    VStack{
                        Image(uiImage: UIImage(named: "TopUp")!).resizable().scaledToFit().foregroundColor(.red).frame(width: 30, height: 30)
                        VStack(alignment: .leading){
                            Text("Isi Saldo").font(.system(size: 12, design: .rounded)).foregroundColor(.black).multilineTextAlignment(.center)
                        }
                    }
                    Spacer()
                    VStack{
                        Image(uiImage: UIImage(named: "Transfer")!).resizable().scaledToFit().foregroundColor(.red).frame(width: 30, height: 30)
                        VStack(alignment: .leading){
                            Text("Kirim Uang").font(.system(size: 12, design: .rounded)).foregroundColor(.black).multilineTextAlignment(.center)
                        }
                    }
                    Spacer()
                    VStack{
                        Image(uiImage: UIImage(named: "History")!).resizable().scaledToFit().foregroundColor(.red).frame(width: 30, height: 30)
                        VStack(alignment: .leading){
                            Text("Riwayat").font(.system(size: 12, design: .rounded)).foregroundColor(.black).multilineTextAlignment(.center)
                        }
                    }
                    Spacer()
                    VStack{
                        Image(uiImage: UIImage(named: "Dompet")!).resizable().scaledToFit().foregroundColor(.red).frame(width: 30, height: 30)
                        VStack(alignment: .leading){
                            Text("Wallet").font(.system(size: 12, design: .rounded)).foregroundColor(.black).multilineTextAlignment(.center)
                        }
                    }
                    Spacer()
                    VStack{
                        Image(uiImage: UIImage(named: "TopUpQr")!).resizable().scaledToFit().foregroundColor(.red).frame(width: 30, height: 30)
                        VStack(alignment: .leading){
                            Text("QRIS").font(.system(size: 12, design: .rounded)).foregroundColor(.black).multilineTextAlignment(.center)
                        }
                    }
                }.padding(.all, 16).background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                HStack{
                    Spacer()
                    Image(systemName: "exclamationmark.triangle.fill").resizable().scaledToFit().foregroundColor(.red).frame(width: 30, height: 30).padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 8))
                    VStack(alignment: .leading){
                        Text("Akun Anda Belum Premium").font(.system(size: 12, design: .rounded)).foregroundColor(.black).multilineTextAlignment(.center)
                        Text("Dapatkan banyak keuntungan dengan menjadi akun Premium. Lihat Info Selengkapnya").font(.system(size: 12, design: .rounded)).foregroundColor(.black).multilineTextAlignment(.leading)
                    }.padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 16))
                    Spacer()
                }.background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]) {
                    ForEach(menuItems, id: \.menuTag) { item in
                        NavigationLink(destination: item.menuDestination){
                            VStack(alignment: .center){
                                Image(uiImage: item.menuImage).resizable().scaledToFit().frame(width: 25,height: 25)
                                Text(item.menuTitle).font(.system(size: 12, design: .rounded)).foregroundColor(.black).multilineTextAlignment(.center)
                            }.padding(.all, 16).frame(width: 100,alignment: .center)
                        }
                    }
                }
            }.padding(.all, 16)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
