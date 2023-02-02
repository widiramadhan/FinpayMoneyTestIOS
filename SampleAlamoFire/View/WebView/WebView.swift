//
//  WebView.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 01/02/23.
//

import SwiftUI
import Foundation
import WebKit


class WebKitController: UIViewController{
    var webview: WKWebView = WKWebView()
    var delegate : WKNavigationDelegate?
    
    public func loadUrl(_ url: URL) {
        webview.load(URLRequest(url: url))
    }

    override func loadView() {
        self.webview.navigationDelegate = delegate
        view = webview
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

struct WebviewPreview : UIViewControllerRepresentable {
    @Binding var redirect : Bool
    func makeCoordinator() -> Coordinator {
        Coordinator(redirect: $redirect)
    }

    func makeUIViewController(context: Context) -> WebKitController {
        let controller = WebKitController()
        controller.delegate = context.coordinator
        controller.loadUrl(URL(string:"https://www.google.com")!)
        return controller
    }

    func updateUIViewController(_ uiViewController: WebKitController, context: UIViewControllerRepresentableContext<WebviewPreview>) {
    }
    
    
    class Coordinator: NSObject, WKNavigationDelegate {
        @Binding var redirect : Bool
        
        init(redirect: Binding<Bool>) {
            self._redirect = redirect
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            guard let url = (navigationResponse.response as! HTTPURLResponse).url else {
                decisionHandler(.cancel)
                return
            }

            if url.absoluteString.starts(with: "https://www.google.com/search?") {
                redirect = true
                decisionHandler(.cancel)
            }
            else {
                decisionHandler(.allow)
            }
        }
    }
}

struct WebView: View{
    @State var redirect : Bool = false
    var body: some View{
        NavigationStack{
            WebviewPreview(redirect: $redirect)
            NavigationLink(destination: AnotherView(), isActive: $redirect){}
        }
    }
}

struct AnotherView: View{
    var body: some View{
        Text("Hello, Success Searching Something")
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
