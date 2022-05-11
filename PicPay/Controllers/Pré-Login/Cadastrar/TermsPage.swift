//
//  TermsPage.swift
//  PicPay
//
//  Created by Luccas Santana Marinho on 10/05/22.
//

import UIKit
import WebKit

class TermsPage: UIViewController {
    
    var webView: WKWebView!

    override func viewDidLoad() {

    //MARK: - Método para Observar quando entrar e sair de Background o App

        NotificationCenter.default.addObserver(self, selector: #selector(enterBG), name: UIApplication.willResignActiveNotification, object: .none)

        super.viewDidLoad()
        title = "termos de serviço".uppercased()

    // MARK: - Inserindo WebView termo
        
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true

        webView = WKWebView(frame: view.bounds, configuration: config)

        self.view = webView

        let request = URLRequest(url: URL(string: "https://www.picpay.com/app_webviews/terms/")!)
        webView.load(request)
        
        let barButton = UIBarButtonItem(customView: fechar)
        self.navigationItem.leftBarButtonItem = barButton
        fechar.addTarget(self, action: #selector(returnButton), for: .touchUpInside)

    // MARK: - Chamando Background

        let background = Background(frame: view.frame)
        self.view.addSubview(background)
        background.isHidden = true
    }

    private lazy var fechar: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Fechar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.greenButtonPL, for: .normal)
        button.addTarget(self, action: #selector(returnButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Navegacoes da tela
    
    @objc func returnButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Func para quando entrar e sair de Background
    
    @objc func enterBG() {
        self.dismiss(animated: true, completion: nil)
    }
}
