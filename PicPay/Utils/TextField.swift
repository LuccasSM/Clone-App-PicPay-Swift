//
//  TextFields.swift
//  PicPay
//
//  Created by Luccas Santana Marinho on 09/05/22.
//

import UIKit

class TextField: UITextField {
    func tf() -> UITextField {
        let tf = UITextField(frame: .zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 25
        tf.layer.borderWidth = 1.0
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: tf.frame.height))
        tf.leftViewMode = .always
        return tf
    }
}


