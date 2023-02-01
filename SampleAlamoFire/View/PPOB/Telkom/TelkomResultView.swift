//
//  QrisResultView.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 25/01/23.
//

import Foundation
import SwiftUI

struct TelkomResultView: View {
    @State private var nominalText : String = ""
    let IcUser = UIImage(named: "IcUser")!
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Text("Info Pelanggan").padding(.horizontal, 16).padding(.bottom, 16)
                HStack{
                    Image(uiImage: IcUser).resizable().frame(width: 48, height: 48)
                    VStack(alignment: .leading){
                        Text("User Name").font(.system(size: 16,weight: .bold, design: .rounded)).foregroundColor(.black)
                        Text("Phone Number").font(.system(size: 16, design: .rounded)).foregroundColor(.black)
                    }
                }.padding(.horizontal, 16).padding(.bottom, 16)
                HStack{
                    Text("ID Pelanggan")
                    Spacer()
                    Text("ID Pelanggan").font(.system(size: 16,weight: .bold, design: .rounded)).foregroundColor(.black)
                }.padding(.horizontal, 16).padding(.bottom, 16)
                HStack{
                    Text("Tagihan")
                    Spacer()
                    Text("Rp. 0").font(.system(size: 16,weight: .bold, design: .rounded)).foregroundColor(.black)
                }.padding(.horizontal, 16).padding(.bottom, 16)
                Spacer()
                Button(action: {}){
                    Text("Konfirmasi").padding(.all, 16).frame(maxWidth: .infinity).foregroundColor(.white)
                }.background(.teal).padding(.all, 16)
            }
        }
    }
}

struct TelkomResultView_Previews: PreviewProvider {
    static var previews: some View {
        TelkomResultView()
    }
}
