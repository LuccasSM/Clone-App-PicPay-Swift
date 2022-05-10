//
//  ButtonUnderline.swift
//  PicPay
//
//  Created by Luccas Santana Marinho on 09/05/22.
//

import UIKit

class ButtonUnderline: UIButton {
    func button() -> UIButton {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitleColor(.greenButtonPL, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }
}
