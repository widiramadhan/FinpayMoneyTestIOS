import SwiftUI
import AVFoundation

struct CameraView: View {
    @State private var showCamera = false
    @State private var selectedImage: UIImage?
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""

    var body: some View {
        VStack {
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .scaledToFit()
            } else {
                Button(action: {
                    checkPermission()
                }) {
                    Text("Open Camera")
                }
            }
        }
        .sheet(isPresented: $showCamera) {
            CameraCaptureView(showCamera: self.$showCamera, selectedImage: self.$selectedImage)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    func checkPermission() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        if status == .authorized {
            self.showCamera = true
        } else if status == .notDetermined {
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    self.showCamera = true
                } else {
                    self.alertTitle = "Camera Permission Denied"
                    self.alertMessage = "Please enable camera permission in settings to use this feature."
                    self.showAlert = true
                }
            }
        } else {
            self.alertTitle = "Camera Permission Denied"
            self.alertMessage = "Please enable camera permission in settings to use this feature."
            self.showAlert = true
        }
    }
}

struct CameraCaptureView: UIViewControllerRepresentable {
    @Binding var showCamera: Bool
    @Binding var selectedImage: UIImage?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraCaptureView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CameraCaptureView>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: CameraCaptureView
        
        init(_ parent: CameraCaptureView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
            }

            parent.selectedImage = info[.originalImage] as? UIImage
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
