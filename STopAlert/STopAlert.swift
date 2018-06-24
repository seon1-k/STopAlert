//
//  STopAlert.swift
//  STopAlert
//
//  Created by SeonIl Kim on 2018. 6. 24..
//  Copyright © 2018년 Seonift. All rights reserved.
//

import UIKit

class STopAlert: NSObject {
    
    private static let shared = STopAlert()
    private var popupView: UIView?
    private var popupLabel: UILabel?
    
    private let defaultDuration: Double = 1.0
    private let defualtAnimationDuration: Double = 0.5
    private let defaultBackgroundColor: UIColor = UIColor(red: 109/255, green: 200/255, blue: 87/255, alpha: 1.0)
    
    override init() { }
    
    class func showMessage(text: String, backgroundColor: UIColor = shared.defaultBackgroundColor, textColor: UIColor = UIColor.white, duration: Double = shared.defaultDuration, animationDuration: Double = shared.defualtAnimationDuration) {
        
        if shared.popupView != nil { return }
        
        let width = UIScreen.main.bounds.width
        let height = UIApplication.shared.statusBarFrame.height
        
        let popupView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 0))
        popupView.backgroundColor = backgroundColor
        popupView.clipsToBounds = true
        
        let popupLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
        popupLabel.textColor = .clear
        popupLabel.text = text
        popupLabel.textAlignment = .center
        popupLabel.font = UIFont.systemFont(ofSize: 11)
        popupView.addSubview(popupLabel)
        
        if let status = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            status.addSubview(popupView)
            //            status.addSubview(popupLabel)
            shared.popupView = popupView
            shared.popupLabel = popupLabel
            UIView.animate(withDuration: animationDuration, animations: {
                popupView.frame.size.height = height
                popupLabel.textColor = textColor
            }, completion: { _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: {
                    self.hide(animationDuration)
                })
            })
            
        }
    }
    
    private class func hide(_ duration: Double) {
        if let view = shared.popupView, let label = shared.popupLabel {
            UIView.animate(withDuration: duration, animations: {
                view.frame.size.height = 0.0
            }, completion: { _ in
                view.removeFromSuperview()
                label.removeFromSuperview()
                shared.popupView = nil
                shared.popupLabel = nil
            })
        }
    }
}
