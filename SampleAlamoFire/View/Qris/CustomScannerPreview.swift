//
//  CustomScannerPreview.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 26/01/23.
//

import AVKit
import Foundation
import SwiftUI
import VisionKit

struct CustomScanPreview: UIViewControllerRepresentable {
    
    @Binding var recognizedItems: [RecognizedItem]
    @Binding var doneScaning : Bool
    let recognizedDataType: DataScannerViewController.RecognizedDataType
    
    func makeUIViewController(context: Context) -> DataScannerViewController {
        let vc = DataScannerViewController(
            recognizedDataTypes: [recognizedDataType],
            qualityLevel: .balanced,
            recognizesMultipleItems: false,
            isGuidanceEnabled: true,
            isHighlightingEnabled: true
        )
        return vc
    }
    
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        uiViewController.delegate = context.coordinator
        try? uiViewController.startScanning()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(recognizedItems: $recognizedItems, doneScaning: $doneScaning)
    }
    
    static func dismantleUIViewController(_ uiViewController: DataScannerViewController, coordinator: Coordinator) {
        uiViewController.stopScanning()
    }
    
    
    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        
        @Binding var recognizedItems: [RecognizedItem]
        @Binding var doneScaning : Bool
        
        init(recognizedItems: Binding<[RecognizedItem]>, doneScaning : Binding<Bool>) {
            self._recognizedItems = recognizedItems
            self._doneScaning = doneScaning
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            print("didTapOn \(item)")
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            UINotificationFeedbackGenerator().notificationOccurred(.success)
            recognizedItems.append(contentsOf: addedItems)
            isQrisQR()
            print("didAddItems \(addedItems)")
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didRemove removedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            self.recognizedItems = recognizedItems.filter { item in
                !removedItems.contains(where: {$0.id == item.id })
            }
            
            print("didRemovedItems \(removedItems)")
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, becameUnavailableWithError error: DataScannerViewController.ScanningUnavailable) {
            print("became unavailable with error \(error.localizedDescription)")
        }
        
        func isQrisQR(){
            recognizedItems.forEach{item in
                switch(item){
                case .barcode(let data):
                    if(data.payloadStringValue != nil){
                        if(data.payloadStringValue!.contains("QRIS")){
                            doneScaning = true
                            break
                        }else{
                            doneScaning = false
                            break
                        }
                    }
                default:
                    doneScaning = false
                    break
                }
            }
        }
        
    }
    
}
