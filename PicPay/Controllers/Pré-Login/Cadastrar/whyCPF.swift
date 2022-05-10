//
//  whyCPF.swift
//  PicPay
//
//  Created by Luccas Santana Marinho on 07/05/22.
//

import UIKit

class WhyCPF: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //MARK: - Método para Observar quando entrar e sair de Background o App
        
        NotificationCenter.default.addObserver(self, selector: #selector(enterBG), name: UIApplication.willResignActiveNotification, object: .none)
        
        self.view.addSubview(whyCPF)
        self.whyCPF.addSubview(image)
        self.whyCPF.addSubview(titleCPF)
        self.whyCPF.addSubview(textCPF)
        self.whyCPF.addSubview(button)
        
        NSLayoutConstraint.activate([
            whyCPF.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            whyCPF.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            whyCPF.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50),
            whyCPF.heightAnchor.constraint(equalToConstant: 420),
            
            image.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 170),
            image.heightAnchor.constraint(equalToConstant: 150),
            
            titleCPF.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleCPF.bottomAnchor.constraint(equalTo: self.textCPF.topAnchor, constant: -12),
            
            textCPF.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textCPF.bottomAnchor.constraint(equalTo: self.button.topAnchor, constant: -20),
            
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 90),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: self.whyCPF.bottomAnchor, constant: -22),
        ])
        
    // MARK: - Chamando Background
        
        let background = Background(frame: view.frame)
        self.view.addSubview(background)
        background.isHidden = true
    }
    
    private lazy var image: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "exclamation-yellow")
        return image
    }()
    
    private lazy var whyCPF: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .whyCPFPopUp
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var titleCPF: UILabel = {
        let text = UILabel(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Por que precisamos do \nseu CPF?"
        text.font = UIFont.boldSystemFont(ofSize: 22)
        text.textColor = .black
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    private lazy var textCPF: UILabel = {
        let text = UILabel(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Seu CPF é necessário para \natender às normas brasileiras \nque tratam de carteiras digitais. \nFique tranquilo, seus dados \nestão protegidos e ningúem \ntem acesso a eles."
        text.font = UIFont.systemFont(ofSize: 16)
        text.textColor = .whyCPFPopUpText
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .greenButtonPL
        button.setTitle("Ok, entendi", for: .normal)
        button.layer.cornerRadius = 25
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
