//
//  WebView.swift
//  SampleFinpayUIKit
//
//  Created by Muhammad Rasyiddin on 01/02/23.
//

import SwiftUI
import Foundation
import WebKit

class Coordinator: NSObject {
    var webview: Webview

    init(_ webview: Webview) {
        self.webview = webview
    }

    @objc func startCamera(sender: WKWebView) {
        webview.startCamera()
    }
}

class EmbeddedWebviewController: UIViewController, WKNavigationDelegate {

    var webview: WKWebView
    //var router: WebviewRouter? = nil

    public var delegate: Coordinator? = nil

    init(coordinator: Coordinator) {
        self.delegate = coordinator
        self.webview = WKWebView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.webview = WKWebView()
        super.init(coder: coder)
    }

    public func loadUrl(_ url: URL) {
        webview.load(URLRequest(url: url))
    }

    override func loadView() {
        self.webview.navigationDelegate = self
        view = webview
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = (navigationResponse.response as! HTTPURLResponse).url else {
            decisionHandler(.cancel)
            return
        }

        if url.absoluteString.starts(with: "https://www.google.com/search?") {
            decisionHandler(.cancel)
            self.delegate?.startCamera(sender: self.webview)
        }
        else {
            decisionHandler(.allow)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class WebviewModel: ObservableObject {
    @Published var loggedOut: Bool = false
    @Published var shouldRedirectToCameraView: Bool = false
    @Published var navbarHidden: Bool = false
    func startCamera() {
        print("Started Camera")
        DispatchQueue.main.async {
            self.shouldRedirectToCameraView.toggle()
        }
    }
}

struct Webview : UIViewControllerRepresentable {
    @ObservedObject var model: WebviewModel

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> EmbeddedWebviewController {
        let webViewController = EmbeddedWebviewController(coordinator: context.coordinator)
        webViewController.loadUrl(URL(string:"https://www.google.com")!)

        return webViewController
    }

    func updateUIViewController(_ uiViewController: EmbeddedWebviewController, context: UIViewControllerRepresentableContext<Webview>) {

    }

    func startCamera() {
        model.startCamera()
    }
}

struct LoginView: View {
    var body: some View {
        Text("Login")
    }
}

struct XView: View {
    @ObservedObject var model: WebviewModel
    var body: some View {
        Text("CameraView")
    }
}

struct WebviewContainer: View {
    @ObservedObject var model: WebviewModel = WebviewModel()
    var body: some View {
        return NavigationView {
            VStack {
                NavigationLink(destination: LoginView(), isActive: $model.loggedOut) {
                    EmptyView()
                }.isDetailLink(false)
                .navigationBarTitle(Text("Hallo"))
                .navigationBarHidden(self.model.navbarHidden)

                NavigationLink(destination: XView(model: self.model), isActive: $model.shouldRedirectToCameraView) {
                    EmptyView()
                }
                .navigationBarTitle(Text(""))
                .navigationBarHidden(self.model.navbarHidden)
                Webview(model: self.model)
            }
        }
    }
}


struct XWebView: View {
    var body: some View {
        WebviewContainer()
    }
}

struct XWebView_Previews: PreviewProvider {
    static var previews: some View {
        XWebView()
    }
}
