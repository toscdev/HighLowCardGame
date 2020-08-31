//
//  HighLowCardGame
//  COPYRIGHT © 2020 Tobias Schaarschmidt
//
//  https://tosc.dev
//

import UIKit

extension UIButton {
    func setGradientBackground(firstColor: UIColor, secondColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.6)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.cornerRadius = 20
        gradientLayer.borderWidth = 2
        gradientLayer.borderColor = UIColor.white.cgColor
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
}
