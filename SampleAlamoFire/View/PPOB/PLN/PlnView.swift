//
//  QrisResultView.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 25/01/23.
//

import Foundation
import SwiftUI



struct PlnView: View {
    @State private var nominalText : String = ""
    @State private var selectedTabValue : Int = 0
    @State private var showBottomSheet: Bool = false
    
    let IcUser = UIImage(named: "IcUser")!
    var body: some View {
        NavigationStack{
            ZStack{
                VStack(alignment: .leading){
                    Picker(selection: $selectedTabValue, label: Text("")) {
                                    Text("Token").tag(0)
                                    Text("Tagihan").tag(1)
                    }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal, 16).padding(.bottom, 16)
                    TabView(selection: $selectedTabValue,
                                       content:  {
                                            PlnTokenView().tag(0)
                                            PlnTagihanaView().tag(1)
                                       })
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    Spacer()
                    Button(action: {
                        showBottomSheet = true
                    }){
                        Text("Konfirmasi").padding(.all, 16).frame(maxWidth: .infinity).foregroundColor(.white)
                    }.background(.teal).padding(.all, 16)
                }
                BottomSheet(isShowing: $showBottomSheet, content: AnyView(PulsaDataInquiryBottomSheet()))
            }
            
        }
    }
}

struct PlnView_Previews: PreviewProvider {
    static var previews: some View {
        PlnView()
    }
}
