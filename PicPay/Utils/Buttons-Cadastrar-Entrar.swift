//
//  Buttons-Cadastrar-Entrar.swift
//  PicPay
//
//  Created by Luccas Santana Marinho on 09/05/22.
//

import UIKit

class Buttons_Cadastrar_Entrar: UIButton {
    func button() -> UIButton {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .greenButtonPL
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 25
        button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }
}
