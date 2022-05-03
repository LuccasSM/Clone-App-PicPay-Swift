//
//  PreLogin.swift
//  PicPay
//
//  Created by Luccas Santana Marinho on 01/05/22.
//

import UIKit

class PreLogin: UIViewController {
    
    var imageArr = ["image-pl-one","image-pl-two", "image-pl-three"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(buttonBanner)
        self.view.addSubview(buttonCadastrar)
        self.view.addSubview(buttonEntrar)
        self.view.addSubview(interrogationButton)
        
        NSLayoutConstraint.activate([
            buttonBanner.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            buttonBanner.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            buttonCadastrar.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.72),
            buttonCadastrar.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.053),
            buttonCadastrar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonCadastrar.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            buttonEntrar.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.72),
            buttonEntrar.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.053),
            buttonEntrar.topAnchor.constraint(equalTo: self.buttonCadastrar.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            buttonEntrar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            interrogationButton.widthAnchor.constraint(equalToConstant: 20),
            interrogationButton.heightAnchor.constraint(equalToConstant: 20),
            interrogationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            interrogationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
    // MARK: - Chamando Background
        
        let background = Background(frame: view.frame)
        self.view.addSubview(background)
        background.isHidden = true
    }
    
    // MARK: - Views da Tela
    
    private lazy var buttonBanner: UIButton = {
        let RandomNumber = Int(arc4random_uniform(UInt32(self.imageArr.count)))
        let image = UIImage.init(named: "\(imageArr[RandomNumber])")
        imageArr.shuffle()
        
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        button.setImage(image, for: .normal)
        return button
    }()
    
    private lazy var buttonCadastrar: UIButton = {
        let button = Buttons().button()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .greenButtonPL
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.adjustsImageWhenHighlighted = false
        return button
    }()
    
    private lazy var buttonEntrar: UIButton = {
        let button = Buttons().button()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.adjustsImageWhenHighlighted = false
        return button
    }()
    
    private lazy var interrogationButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "interrogation"), for: .normal)
        button.addTarget(self, action: #selector(interrogationPage), for: .touchUpInside)
        button.adjustsImageWhenHighlighted = false
        return button
    }()
    
    // MARK: - Navegacoes da tela
    
    @objc func interrogationPage() {
        self.present(InterrogationPage(), animated: true)
    }
}
