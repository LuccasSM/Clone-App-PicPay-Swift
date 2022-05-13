//
//  YourName.swift
//  PicPay
//
//  Created by Luccas Santana Marinho on 10/05/22.
//

import UIKit

class YourName: UIViewController {

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
        
        self.view.addSubview(name)
        self.view.addSubview(textName)
        self.view.addSubview(tfNome)
        self.view.addSubview(tfSobreNome)
        self.view.addSubview(buttonAvancar)
        
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        button.addTarget(self, action: #selector(returnButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            name.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 32),
            
            textName.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textName.topAnchor.constraint(equalTo: self.name.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            
            tfNome.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tfNome.topAnchor.constraint(equalTo: self.textName.safeAreaLayoutGuide.bottomAnchor, constant: 24),
            tfNome.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50),
            tfNome.heightAnchor.constraint(equalToConstant: 50),
            
            tfSobreNome.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tfSobreNome.topAnchor.constraint(equalTo: self.tfNome.safeAreaLayoutGuide.bottomAnchor, constant: 24),
            tfSobreNome.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50),
            tfSobreNome.heightAnchor.constraint(equalToConstant: 50),
            
            buttonAvancar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonAvancar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -35),
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
    
    private lazy var name: UILabel = {
        let ident = UILabel(frame: .zero)
        ident.translatesAutoresizingMaskIntoConstraints = false
        ident.text = "Qual o seu nome?"
        ident.font = UIFont.boldSystemFont(ofSize: 22)
        return ident
    }()
    
    private lazy var textName: UILabel = {
        let text = UILabel(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "É necessário que você informe o seu nome \nverdadeiro. Não utilize nome de terceiros."
        text.font = UIFont.systemFont(ofSize: 14)
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    private lazy var tfNome: UITextField = {
        let tf = TextField().tf()
        tf.attributedPlaceholder = NSAttributedString(string: "Nome", attributes: [NSAttributedString.Key.foregroundColor: UIColor.textFieldPlaceholders])
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    private lazy var tfSobreNome: UITextField = {
        let tf = TextField().tf()
        tf.attributedPlaceholder = NSAttributedString(string: "Sobrenome", attributes: [NSAttributedString.Key.foregroundColor: UIColor.textFieldPlaceholders])
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    private lazy var buttonAvancar: UIButton = {
        let button = Buttons_Cadastrar_Entrar().button()
        button.setTitle("Avançar", for: .normal)
        button.addTarget(self, action: #selector(telephonePage), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Navegacoes da tela
    
    @objc func returnButton() {
        let controller = CadastrarPage()
        let navVC = UINavigationController(rootViewController: controller)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: false, completion: nil)
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    @objc func telephonePage() {
        let controller = TelephoneNumber()
        let navVC = UINavigationController(rootViewController: controller)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: false, completion: nil)
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
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
