//
//  JDProgressRoundView.swift
//  ProgressRoundView
//
//  Created by Максим Савченко on 2020/10/11.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import UIKit

class JDProgressRoundView: UIView {
    
    var InnerView: JDInnerView!
    var Border: JDRoundLayer!
    
    public init (frame: CGRect,howtoincrease t:types = .heartBeat,unit u:String = "",ProgressColor pc:UIColor = UIColor.red,BorderWidth b:CGFloat = 13.0) {
        super.init(frame: frame)
        
        let SingleTap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(JDProgressRoundView.TapView))
        self.addGestureRecognizer(SingleTap)
        
        Border = JDRoundLayer(LineWidth: b, theBounds: self.frame.size, Stroke_Color: UIColor.white.cgColor, percent: 100.0)
        layer.addSublayer(Border)
        
        InnerView = JDInnerView(frame: CGRect(origin: CGPoint.zero, size: self.frame.size), howtoincrease: t,ProgressColor: pc,UNIT : u)
        self.addSubview(InnerView)
    }
    
    public func setProgress(_ p:CGFloat, animated: Bool)
    {
        InnerView.progress = p - 5.0
        InnerView.JDHasBeenTap(animated)
    }
    
    public func setTypes(_ change:types)
    {
        InnerView.setTypes(change)
    }
    
    @objc func TapView() {
        InnerView.JDHasBeenTap(true)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}



public enum types {
    case downToTop
    case loop
    case grownCircle
    case water
    case heartBeat
}


class JDInnerView: UIView {
    
    var bgColor:UIColor!
    var UnitString:String = "%"
    var progress:CGFloat = 0.0
    var ProgressLabel:UILabel?
    var ProgressInnerLayer:JDLayerClass!
    
    init(frame: CGRect,howtoincrease type:types,ProgressColor color:UIColor,UNIT u:String) {
        super.init(frame: frame)
        bgColor = color
        UnitString = u
        progress = 0.0
        self.DrawInnerLayer(IncreaseType: type)
    }
    
    func JDHasBeenTap(_ animated: Bool) {
        progress += 5.0
        ProgressInnerLayer.JDHasBeenTap(animated, progress: progress)
        ProgressLabel?.text = "  \(progress) %"
        if(progress == 100.0)
        {
            progress = -5.0
        }
        
    }
    
    func setTypes(_ change:types) {
        progress = 0.0
        DrawInnerLayer(IncreaseType: change)
    }
    
    func DrawInnerLayer(IncreaseType:types) {
        if(!(IncreaseType == .loop))
        {
            ProgressInnerLayer = JDInnerLayer(incresasetypes: IncreaseType, theBounds: self.frame.size, Stroke_Color: bgColor.cgColor, percent: progress)
        }
        else
        {
            ProgressInnerLayer = JDRoundLayer(LineWidth: 13.0, theBounds: self.frame.size, Stroke_Color: bgColor.cgColor, percent: 0.0)
        }
        layer.addSublayer(ProgressInnerLayer)
        if(IncreaseType == .heartBeat)
        {
            layer.addSublayer(ProgressInnerLayer.layeranimation.BeatingLayer)
        }
        

        ProgressLabel?.removeFromSuperview()
        let LabelFrame:CGRect = CGRect.zero
        ProgressLabel = UILabel(frame: LabelFrame)
        ProgressLabel?.translatesAutoresizingMaskIntoConstraints = false
        ProgressLabel?.numberOfLines = 0
        self.addSubview(ProgressLabel!)
        let width = NSLayoutConstraint(item: ProgressLabel!, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.6, constant: 0.0)
        let height = NSLayoutConstraint(item: ProgressLabel!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 250)
        ProgressLabel?.addConstraint(height)
        let MidX = NSLayoutConstraint(item: ProgressLabel!, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: -15)
        let Midy = NSLayoutConstraint(item: ProgressLabel!, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        self.addConstraints([width,MidX,Midy])
        ProgressLabel?.font = UIFont.systemFont(ofSize: 45, weight: UIFont.Weight.bold)
        ProgressLabel?.text = "\(progress) %"
        ProgressLabel?.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


