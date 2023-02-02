//
//  PinView.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 03/02/23.
//

import Foundation
import SwiftUI


struct PinView : View {
    
    @AppStorage("lock_Password") var key = "555555"
    @State var password = ""
    @State var wrongPassword = false
    
    let height = UIScreen.main.bounds.width
  
    var body: some View {
        VStack{
            Text("Masukan PIN")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.top,20)
            
            HStack(spacing: 20) {
                ForEach(0..<6,id: \.self){ index in
                    PasswordField(index: index, password: $password)
                }
            }.padding(.top,height < 750 ? 50 : 60)
            
            Spacer(minLength: 0)
            
            Text(wrongPassword ? "PIN yang anda masukan salah" : "")
                .foregroundColor(.red)
                .fontWeight(.heavy)
            Spacer()
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3),spacing: height < 750 ? 10 : 15) {
                ForEach(1...9, id: \.self){value in
                    PasswordButton(value: "\(value)",password: $password, key: $key, wrongPass: $wrongPassword)
                }
                PasswordButton(value: "", password: $password, key: $key,  wrongPass: $wrongPassword)
                PasswordButton(value: "0", password: $password, key: $key,  wrongPass: $wrongPassword)
                PasswordButton(value: "delete.fill",password: $password, key: $key,  wrongPass: $wrongPassword)
            }
        }
    }
}


struct PasswordField : View {
    
    var index : Int
    @Binding var password : String
    
    var body: some View{
        ZStack{
            ZStack(alignment: .bottom){
                Rectangle()
                    .fill(.black)
                    .opacity(password.count > index ? 0: 1)
                    .frame(width: 25, height: 2)
            }.frame(height: 25)
            if password.count > index {
                Circle()
                    .fill(Color.black)
                    .frame(width: 25, height: 25)
            }
        }
    }
}


struct PasswordButton : View {
    
    var value : String
    @Binding var password : String
    @Binding var key : String
    @Binding var wrongPass : Bool
    
    
    var body: some View{
        
        Button(action: setPassword, label: {
            VStack {
                if value.count > 6 {
                    Image(systemName: "delete.left")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }else if value == "Cancel" {
                    Text(value)
                        .font(.system(size: 15))
                        .font(.title)
                        .foregroundColor(.black)
                }else {
                    Text(value)
                        .font(.system(size: 30))
                        .font(.title)
                        .foregroundColor(.black)
                }
            }
            .padding()
        })
        .frame(width: 130, height: 80)
    }
}



extension PasswordButton {
    private func setPassword() {
        withAnimation {
            if value.count > 1 {
                if password.count != 0 {
                    password.removeLast()
                }
            }else {
                isTyping()
            }
        }
    }
    
    private func isTyping() {
        if password.count != 6 {
            password.append(value)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation {
                    if password.count == 6 {
                        if password == key {
                            wrongPass = false
//                            password.removeAll()
                        } else {
                            wrongPass = true
                            password.removeAll()
                        }
                    }
                }
            }
        }
    }
}

struct PinView_Previews: PreviewProvider {
    static var previews: some View {
        PinView()
    }
}
