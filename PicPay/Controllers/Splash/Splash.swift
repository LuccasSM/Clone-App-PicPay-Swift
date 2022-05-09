//
//  ViewController.swift
//  PicPay
//
//  Created by Luccas Santana Marinho on 27/04/22.
//

import UIKit

class Splash: UIViewController {
    
    // MARK: - Método para trocar cor do Status Bar Style
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .greenDefault
        
        self.view.addSubview(logo)
        
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            logo.widthAnchor.constraint(equalToConstant: 230),
            logo.heightAnchor.constraint(equalToConstant: 230),
        ])
    }
    
    // MARK: - Views da Tela
    
    private lazy var logo: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo-picpay")
        return image
    }()
    
    // MARK: - Remover Orientação de tela
    
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    // MARK: - Chamando a Pré-Login
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
                
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
            self.animated()
        })
    }
            
    private func animated() {
        UIView.animate(withDuration: 0, animations: {
        }, completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                    let viewController = PreLogin()
                    viewController.modalTransitionStyle = .crossDissolve
                    viewController.modalPresentationStyle = .fullScreen
                    self.present(viewController, animated: true)
                })
            }
        })
    }
}
