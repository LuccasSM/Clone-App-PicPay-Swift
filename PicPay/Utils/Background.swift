//
//  Background.swift
//  PicPay
//
//  Created by Luccas Santana Marinho on 01/05/22.
//

import UIKit

class Background: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .greenDefault
        
        NotificationCenter.default.addObserver(self, selector: #selector(exitBG), name: UIApplication.didBecomeActiveNotification, object: .none)
        NotificationCenter.default.addObserver(self, selector: #selector(enterBG), name: UIApplication.willResignActiveNotification, object: .none)
        
        //MARK: - View's entrando em background
        
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(image)
        image.image = UIImage(named: "logo-picpay")
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 230),
            image.heightAnchor.constraint(equalToConstant: 230),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) não foi implementado")
    }
    
    // MARK: - Chamando as funções de entrar e sair background
    
    @objc func enterBG() {
        self.isHidden = false
    }
        
    @objc func exitBG() {
        self.isHidden = true
    }
}
