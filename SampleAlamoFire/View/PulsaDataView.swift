//
//  PulsaDataView.swift
//  SampleAlamoFire
//
//  Created by Widi Ramadhan on 13/10/22.
//

import Foundation
import SwiftUI
import Contacts
import ContactsUI

struct PulsaDataView: View {
    
    @StateObject var controller = PulsaDataViewModel()
    @State private var phoneNumber = ""
    @State private var showPicker = false
    @State private var contactsAccessGranted = false
    @State private var showBottomSheet = false
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment: .leading) {
                    Text("Nomor Ponsel")
                    HStack{
                        TextField("", text: $phoneNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .border(Color.gray.opacity(0.5), width: 1)
                        if contactsAccessGranted {
                            if #available(iOS 16.0, *) {
                                NavigationStack {
                                    NavigationLink(destination: ContactPickerView(phoneNumber: $phoneNumber), isActive: $showPicker) {
                                        Image(systemName: "person.crop.square.fill")
                                    }
                                }
                            } else {
                                // Fallback on earlier versions
                                NavigationView {
                                    NavigationLink(destination: ContactPickerView(phoneNumber: $phoneNumber), isActive: $showPicker) {
                                        Image(systemName: "person.crop.square.fill")
                                    }
                                }
                            }
                        } else {
                            Image(systemName: "person.crop.square.fill").onTapGesture {
                                self.requestContactsAccess()
                            }
                        }
                    }.padding(20)
                    VStack {
                        Rectangle()
                            .frame(height: 10)
                            .background(Color.gray)
                    }
                    VStack {
                        Button(action: {
                            self.showBottomSheet.toggle()
                        }){
                            Text("Continue")
                                .foregroundColor(.black)
                                .padding(10)
                                .background(Color.green)
                                .cornerRadius(10)
                        }
                    }
                    .sheet(isPresented: $showBottomSheet) {
                        Text("This is a bottom sheet")
                    }
                    Spacer().frame(height:50)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Pulsa & Paket Data")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(.red, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                }
            }
        }
    }
    
    func requestContactsAccess() {
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, error) in
            if granted {
                self.contactsAccessGranted = true
                self.showPicker = true
            } else {
                // Handle denied access
                self.contactsAccessGranted = false
            }
        }
    }
    
    func phoneNumberFormat(_ phoneNumber: String)->String {
        var phone: String
        phone = "0"+phoneNumber
        return phone.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
    }
}


struct ContactPickerView: UIViewControllerRepresentable {
    @Binding var phoneNumber: String
    
    func makeUIViewController(context: Context) -> CNContactPickerViewController {
        let picker = CNContactPickerViewController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: CNContactPickerViewController, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, CNContactPickerDelegate {
        var parent: ContactPickerView
        
        init(_ parent: ContactPickerView) {
            self.parent = parent
        }
        
        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
            let phoneNumber = contact.phoneNumbers.first?.value.stringValue ?? ""
            parent.phoneNumber = phoneNumber
            picker.dismiss(animated: true)
        }
    }
}
