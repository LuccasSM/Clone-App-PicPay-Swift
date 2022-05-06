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
        
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        button.addTarget(self, action: #selector(returnButton), for: .touchUpInside)
    }
    
    private lazy var button: UIButton = {
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.widthAnchor.constraint(equalToConstant: 75).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.adjustsImageWhenHighlighted = false
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 7)
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
}
