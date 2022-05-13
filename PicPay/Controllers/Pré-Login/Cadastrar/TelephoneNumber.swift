//
//  TelephoneNumber.swift
//  PicPay
//
//  Created by Luccas Santana Marinho on 12/05/22.
//

import UIKit

class TelephoneNumber: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
    //MARK: - Esconder teclado quando clicar fora
                
        self.hideKeyboardWhenTappedAround()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(YourName.dismissKeyboard)))
        
    //MARK: - Métodos para Observar quando entrar e sair de Background o App
                
        NotificationCenter.default.addObserver(self, selector: #selector(exitBG), name: UIApplication.didBecomeActiveNotification, object: .none)
        NotificationCenter.default.addObserver(self, selector: #selector(enterBG), name: UIApplication.willResignActiveNotification, object: .none)
        NotificationCenter.default.addObserver(self, selector: #selector(hiddenKeyboard), name: UIApplication.willResignActiveNotification, object: .none)
        
        self.view.addSubview(telephone)
        self.view.addSubview(textTelephone)
        self.view.addSubview(tfDDD)
        self.view.addSubview(tfTelephone)
        self.view.addSubview(buttonAvancar)
        self.view.addSubview(jaCodigo)
        
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        button.addTarget(self, action: #selector(returnButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            telephone.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            telephone.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 32),
            
            textTelephone.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textTelephone.topAnchor.constraint(equalTo: self.telephone.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            
            tfDDD.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            tfDDD.topAnchor.constraint(equalTo: self.textTelephone.safeAreaLayoutGuide.bottomAnchor, constant: 50),
            tfDDD.widthAnchor.constraint(equalToConstant: 90),
            tfDDD.heightAnchor.constraint(equalToConstant: 50),
            
            tfTelephone.leadingAnchor.constraint(equalTo: self.tfDDD.trailingAnchor, constant: 15),
            tfTelephone.topAnchor.constraint(equalTo: self.textTelephone.safeAreaLayoutGuide.bottomAnchor, constant: 50),
            tfTelephone.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 145),
            tfTelephone.heightAnchor.constraint(equalToConstant: 50),
            
            buttonAvancar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonAvancar.bottomAnchor.constraint(equalTo: self.jaCodigo.safeAreaLayoutGuide.bottomAnchor, constant: -55),

            jaCodigo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            jaCodigo.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
        ])
        
    // MARK: - Chamando Background
        
        let background = Background(frame: view.frame)
        self.view.addSubview(background)
        background.isHidden = true
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
    
    private lazy var telephone: UILabel = {
        let ident = UILabel(frame: .zero)
        ident.translatesAutoresizingMaskIntoConstraints = false
        ident.text = "Qual é o seu telefone?"
        ident.font = UIFont.boldSystemFont(ofSize: 22)
        return ident
    }()
    
    private lazy var textTelephone: UILabel = {
        let text = UILabel(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Precisamos te enviar um código de \nconfirmação para garantir que só você vai \nter acesso à sua conta."
        text.font = UIFont.systemFont(ofSize: 14)
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    private lazy var tfDDD: UITextField = {
        let tf = TextField().tf()
        tf.attributedPlaceholder = NSAttributedString(string: "00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.textFieldPlaceholders])
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.keyboardType = .asciiCapableNumberPad
        return tf
    }()
    
    private lazy var tfTelephone: UITextField = {
        let tf = TextField().tf()
        tf.attributedPlaceholder = NSAttributedString(string: "00000-0000", attributes: [NSAttributedString.Key.foregroundColor: UIColor.textFieldPlaceholders])
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.keyboardType = .asciiCapableNumberPad
        return tf
    }()
    
    private lazy var buttonAvancar: UIButton = {
        let button = Buttons_Cadastrar_Entrar().button()
        button.setTitle("Avançar", for: .normal)
        return button
    }()

    private lazy var jaCodigo: UIButton = {
        let button = ButtonUnderline().button()
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.underlineStyle: 1.2,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.greenButtonPL
        ]
        let attributedString = NSMutableAttributedString(string: "Já possuo código", attributes: attributes)
        button.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
        return button
    }()
    
    // MARK: - Navegacoes da tela
    
    @objc func returnButton() {
        let controller = YourName()
        let navVC = UINavigationController(rootViewController: controller)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: false, completion: nil)
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    //MARK: - Func para quando entrar e sair de Background
    
    @objc func enterBG() {
        self.navigationController?.isNavigationBarHidden = true
    }

    @objc func exitBG() {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Escondendo teclado quando clicar fora dele na tela
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(YourName.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    //MARK: - Funcao para esconder teclado quando entrar em background
    
    @objc func hiddenKeyboard() {
        self.view.endEditing(true)
    }
}
