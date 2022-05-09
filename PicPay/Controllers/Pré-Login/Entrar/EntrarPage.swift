//
//  EntrarPage.swift
//  PicPay
//
//  Created by Luccas Santana Marinho on 06/05/22.
//

import UIKit

class EntrarPage: UIViewController {
    
    // MARK: - Setando cor do BarStyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Login"
        
    //MARK: - Método para Observar quando entrar e sair de Background o App
            
        NotificationCenter.default.addObserver(self, selector: #selector(exitBG), name: UIApplication.didBecomeActiveNotification, object: .none)
        NotificationCenter.default.addObserver(self, selector: #selector(enterBG), name: UIApplication.willResignActiveNotification, object: .none)

        
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        button.addTarget(self, action: #selector(returnButton), for: .touchUpInside)
        
        
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
    
    //MARK: - Func para quando entrar e sair de Background
    
    @objc func enterBG() {
        button.isHidden = true
    }

    @objc func exitBG() {
        button.isHidden = false
    }
}
