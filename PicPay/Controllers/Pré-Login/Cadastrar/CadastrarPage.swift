//
//  CadastrarPage.swift
//  PicPay
//
//  Created by Luccas Santana Marinho on 05/05/22.
//

import UIKit

class CadastrarPage: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    //MARK: - Método para Observar quando entrar e sair de Background o App
        
        NotificationCenter.default.addObserver(self, selector: #selector(exitBG), name: UIApplication.didBecomeActiveNotification, object: .none)
        NotificationCenter.default.addObserver(self, selector: #selector(enterBG), name: UIApplication.willResignActiveNotification, object: .none)
        
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        button.addTarget(self, action: #selector(returnButton), for: .touchUpInside)
        
        self.view.addSubview(identify)
        self.view.addSubview(textIdentify)
        self.view.addSubview(whyCPF)
        
        NSLayoutConstraint.activate([
            identify.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            identify.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 32),
            
            textIdentify.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textIdentify.topAnchor.constraint(equalTo: self.identify.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            
            whyCPF.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            whyCPF.topAnchor.constraint(equalTo: self.textIdentify.safeAreaLayoutGuide.bottomAnchor, constant: 10),
        ])
        
        let background = Background(frame: view.frame)
        self.view.addSubview(background)
        background.isHidden = true
        background.layer.zPosition = 2
    }
    
    private lazy var button: UIButton = {
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.widthAnchor.constraint(equalToConstant: 75).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.adjustsImageWhenHighlighted = false
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 10)
        button.setImage(UIImage(named: "back"), for: UIControl.State.normal)
        return button
    }()
    
    private lazy var identify: UILabel = {
        let ident = UILabel(frame: .zero)
        ident.translatesAutoresizingMaskIntoConstraints = false
        ident.text = "Sua Identificação"
        ident.font = UIFont.boldSystemFont(ofSize: 22)
        return ident
    }()
    
    private lazy var textIdentify: UILabel = {
        let text = UILabel(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Não se preocupe! Seus dados estão \nseguros conosco e são necessários para \nconfirmar sua identidade."
        text.font = UIFont.systemFont(ofSize: 14)
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    private lazy var whyCPF: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white

        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.underlineStyle: 1.2,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.greenButtonPL
        ]
        let attributedString = NSMutableAttributedString(string: "Por que precisamos do seu CPF?", attributes: attributes)
        
        button.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
        button.setTitleColor(.greenButtonPL, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(popUpWhyCPF), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Navegacoes da tela
    
    @objc func returnButton() {
        let controller = PreLogin()
        let navVC = UINavigationController(rootViewController: controller)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: false, completion: nil)
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    @objc func popUpWhyCPF() {
        let vc = WhyCPF()
        self.present(vc, animated: true)
    }
    
    //MARK: - Func para quando entrar e sair de Background
    
    @objc func enterBG() {
        button.isHidden = true
    }

    @objc func exitBG() {
        button.isHidden = false
    }
}
