//
//  PhoneContactsPreview.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 31/01/23.
//

import Foundation
import SwiftUI
import Contacts
import ContactsUI

struct PhoneContactsPreview: UIViewControllerRepresentable {
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
        var parent: PhoneContactsPreview
        
        init(_ parent: PhoneContactsPreview) {
            self.parent = parent
        }
        
        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
            let phoneNumber = contact.phoneNumbers.first?.value.stringValue ?? ""
            parent.phoneNumber = phoneNumber
            DispatchQueue.global(qos: .background).async {
                picker.dismiss(animated: true)
            }
        }
    }
}
