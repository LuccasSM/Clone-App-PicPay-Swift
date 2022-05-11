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
        
    //MARK: - Esconder teclado quando clicar fora
        
        self.hideKeyboardWhenTappedAround()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CadastrarPage.dismissKeyboard)))
        
    // MARK: - Inserindo itens ao ScrollView
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(whiteView)
        
    //MARK: - Métodos para Observar quando entrar e sair de Background o App
        
        NotificationCenter.default.addObserver(self, selector: #selector(exitBG), name: UIApplication.didBecomeActiveNotification, object: .none)
        NotificationCenter.default.addObserver(self, selector: #selector(enterBG), name: UIApplication.willResignActiveNotification, object: .none)
        NotificationCenter.default.addObserver(self, selector: #selector(hiddenKeyboard), name: UIApplication.willResignActiveNotification, object: .none)
        
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        button.addTarget(self, action: #selector(returnButton), for: .touchUpInside)
        
        self.view.addSubview(identify)
        self.view.addSubview(textIdentify)
        self.view.addSubview(whyCPF)
        self.view.addSubview(tfCPF)
        self.view.addSubview(tfNasc)
        self.view.addSubview(textTermosPolitica)
        self.view.addSubview(termosButton)
        self.view.addSubview(politicaButton)
        self.view.addSubview(e)
        self.view.addSubview(privacidadeButton)
        self.view.addSubview(ponto)
        self.view.addSubview(buttonAvancar)
        self.view.addSubview(jaCadastrado)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            identify.centerXAnchor.constraint(equalTo: self.scrollViewContainer.centerXAnchor),
            identify.topAnchor.constraint(equalTo: self.scrollViewContainer.safeAreaLayoutGuide.topAnchor, constant: 32),
            
            textIdentify.centerXAnchor.constraint(equalTo: self.scrollViewContainer.centerXAnchor),
            textIdentify.topAnchor.constraint(equalTo: self.identify.safeAreaLayoutGuide.bottomAnchor, constant: 10),

            whyCPF.centerXAnchor.constraint(equalTo: self.scrollViewContainer.centerXAnchor),
            whyCPF.topAnchor.constraint(equalTo: self.textIdentify.safeAreaLayoutGuide.bottomAnchor, constant: 10),

            tfCPF.centerXAnchor.constraint(equalTo: self.scrollViewContainer.centerXAnchor),
            tfCPF.topAnchor.constraint(equalTo: self.whyCPF.safeAreaLayoutGuide.bottomAnchor, constant: 24),
            tfCPF.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50),
            tfCPF.heightAnchor.constraint(equalToConstant: 50),

            tfNasc.centerXAnchor.constraint(equalTo: self.scrollViewContainer.centerXAnchor),
            tfNasc.topAnchor.constraint(equalTo: self.tfCPF.safeAreaLayoutGuide.bottomAnchor, constant: 12),
            tfNasc.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50),
            tfNasc.heightAnchor.constraint(equalToConstant: 50),

            textTermosPolitica.centerXAnchor.constraint(equalTo: self.scrollViewContainer.centerXAnchor),
            textTermosPolitica.topAnchor.constraint(equalTo: self.tfNasc.safeAreaLayoutGuide.bottomAnchor, constant: 24),
            
            termosButton.centerXAnchor.constraint(equalTo: self.scrollViewContainer.centerXAnchor, constant: -43),
            termosButton.topAnchor.constraint(equalTo: self.textTermosPolitica.safeAreaLayoutGuide.bottomAnchor),
            
            e.topAnchor.constraint(equalTo: self.textTermosPolitica.safeAreaLayoutGuide.bottomAnchor),
            e.leadingAnchor.constraint(equalTo: self.termosButton.trailingAnchor),
            
            politicaButton.topAnchor.constraint(equalTo: self.textTermosPolitica.safeAreaLayoutGuide.bottomAnchor),
            politicaButton.leadingAnchor.constraint(equalTo: self.e.trailingAnchor),
            
            privacidadeButton.topAnchor.constraint(equalTo: self.termosButton.safeAreaLayoutGuide.bottomAnchor),
            privacidadeButton.centerXAnchor.constraint(equalTo: self.scrollViewContainer.centerXAnchor),
            
            ponto.topAnchor.constraint(equalTo: self.politicaButton.safeAreaLayoutGuide.bottomAnchor),
            ponto.leadingAnchor.constraint(equalTo: self.privacidadeButton.trailingAnchor),

            buttonAvancar.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
            buttonAvancar.bottomAnchor.constraint(equalTo: self.jaCadastrado.safeAreaLayoutGuide.bottomAnchor, constant: -55),

            jaCadastrado.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
            jaCadastrado.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
        ])
        
    // MARK: - Chamando Background
        
        let background = Background(frame: view.frame)
        self.view.addSubview(background)
        background.isHidden = true
    }
    
    // MARK: - Views relacionadas ao ScrollView da tela
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let whiteView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 550).isActive = true
        return view
    }()
    
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
        let button = ButtonUnderline().button()
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.underlineStyle: 1.2,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.greenButtonPL
        ]
        let attributedString = NSMutableAttributedString(string: "Por que precisamos do seu CPF?", attributes: attributes)
        button.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
        button.addTarget(self, action: #selector(popUpWhyCPF), for: .touchUpInside)
        return button
    }()

    private lazy var tfCPF: UITextField = {
        let tf = TextField().tf()
        tf.attributedPlaceholder = NSAttributedString(string: "CPF (somente números)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.textFieldPlaceholders])
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()

    private lazy var tfNasc: UITextField = {
        let tf = TextField().tf()
        tf.attributedPlaceholder = NSAttributedString(string: "Data de nascimento (dd/mm/aaaa)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.textFieldPlaceholders])
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()

    private lazy var textTermosPolitica: UILabel = {
        let text = UILabel(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Ao criar sua conta, você concorda \ncom nossos"
        text.textColor = .textFieldPlaceholders
        text.numberOfLines = 0
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 14)
        return text
    }()
    
    private lazy var termosButton: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(termosPresent))
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.underlineStyle: 1.2,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.greenButtonPL
        ]
        let underlineAttributedString = NSAttributedString(string: "Termos de Serviço", attributes: attributes)
        label.attributedText = underlineAttributedString
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .greenButtonPL
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tapAction)
        return label
    }()
    
    private lazy var e: UILabel = {
        let text = UILabel(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = " e"
        text.textColor = .textFieldPlaceholders
        text.numberOfLines = 0
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 14)
        return text
    }()
    
    private lazy var politicaButton: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(politicaPresent))
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.underlineStyle: 1.2,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.greenButtonPL
        ]
        let underlineAttributedString = NSAttributedString(string: " Política de", attributes: attributes)
        label.attributedText = underlineAttributedString
        label.textAlignment = .center
        label.textColor = .greenButtonPL
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tapAction)
        return label
    }()
    
    private lazy var ponto: UILabel = {
        let text = UILabel(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "."
        text.textColor = .textFieldPlaceholders
        text.numberOfLines = 0
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 14)
        return text
    }()
    
    private lazy var privacidadeButton: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(politicaPresent))
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.underlineStyle: 1.2,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.greenButtonPL
        ]
        let underlineAttributedString = NSAttributedString(string: "Privacidade", attributes: attributes)
        label.attributedText = underlineAttributedString
        label.textAlignment = .center
        label.textColor = .greenButtonPL
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tapAction)
        return label
    }()

    private lazy var buttonAvancar: UIButton = {
        let button = Buttons_Cadastrar_Entrar().button()
        button.setTitle("Avançar", for: .normal)
        button.addTarget(self, action: #selector(yourName), for: .touchUpInside)
        return button
    }()

    private lazy var jaCadastrado: UIButton = {
        let button = ButtonUnderline().button()
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.underlineStyle: 1.2,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor.greenButtonPL
        ]
        let attributedString = NSMutableAttributedString(string: "Já sou cadastrado", attributes: attributes)
        button.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
        button.addTarget(self, action: #selector(returnEentrar), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Navegacoes da tela
    
    @objc func yourName() {
        let controller = YourName()
        let navVC = UINavigationController(rootViewController: controller)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: false, completion: nil)
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
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
    
    @objc func termosPresent() {
        let controller = TermsPage()
        let navVC = UINavigationController(rootViewController: controller)
        present(navVC, animated: false, completion: nil)
    }
    
    @objc func politicaPresent() {
        let controller = PoliticaPage()
        let navVC = UINavigationController(rootViewController: controller)
        present(navVC, animated: false, completion: nil)
    }
    
    //MARK: - Func para quando entrar e sair de Background
    
    @objc func enterBG() {
        self.navigationController?.isNavigationBarHidden = true
    }

    @objc func exitBG() {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @objc func returnEentrar() {
        let controller = EntrarPage()
        let navVC = UINavigationController(rootViewController: controller)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: false, completion: nil)
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    // MARK: - Escondendo teclado quando clicar fora dele na tela
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CadastrarPage.dismissKeyboard))
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
