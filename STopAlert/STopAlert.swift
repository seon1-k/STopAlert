//
//  STopAlert.swift
//  STopAlert
//
//  Created by SeonIl Kim on 2018. 6. 24..
//  Copyright © 2018년 Seonift. All rights reserved.
//

import UIKit

open class STopAlert: NSObject {
    
    private static let shared = STopAlert()
    private var popupView: UIView?
    private var popupLabel: UILabel?
    
    override init() { }
    
    public enum AlertType {
        case positive
        case negative
    }
    
    open class func show(text: String, type: AlertType) {
        var backgroundColor = UIColor()
        switch type {
        case .positive:
            backgroundColor = UIColor(red: 109/255, green: 200/255, blue: 87/255, alpha: 1.0)
        case .negative:
            backgroundColor = .red
        }
        show(text: text, backgroundColor: backgroundColor, textColor: .white)
    }
    
    open class func show(text: String, backgroundColor: UIColor = UIColor(red: 109/255, green: 200/255, blue: 87/255, alpha: 1.0), textColor: UIColor = UIColor.white, duration: Double = 1.0, animationDuration: Double = 0.5) {
        
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
        
        if isX() {
            popupLabel.sizeToFit()
            popupLabel.center.x = popupView.center.x
            popupLabel.frame.origin.y = height - popupLabel.frame.height
        }
        
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
    
    private class func isX() -> Bool {
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let max_length = max(width, height)
        
        
        if UIDevice.current.userInterfaceIdiom == .phone && max_length == 812 {
            return true
        }
        return false
    }
}
