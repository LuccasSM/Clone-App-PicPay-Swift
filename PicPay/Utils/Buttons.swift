//
//  Buttons.swift
//  PicPay
//
//  Created by Luccas Santana Marinho on 02/05/22.
//

import UIKit

class Buttons: UIButton {
    func button() -> UIButton {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 21
        return button
    }
}
