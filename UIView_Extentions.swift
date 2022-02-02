//
//  File2.swift


//

import UIKit

// MARK: - UIView
extension UIView
{
    // MARK:- Gradient
    func setGradientBackground(colors: [UIColor], start: CGPoint, end: CGPoint, corner: CGFloat)
    {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        gradient.startPoint = start
        gradient.endPoint = end  
        gradient.cornerRadius = corner
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.layer.borderWidth = 0.1
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.insertSublayer(gradient, at: 0)
    }
    func setLinearGradient(colors: [UIColor]){
        let gradientLayer:CAGradientLayer = CAGradientLayer()
         gradientLayer.frame.size = self.frame.size
         gradientLayer.colors = colors
        self.layer.addSublayer(gradientLayer)
    }
    func applyGradient(colours: [UIColor], start: CGPoint = CGPoint(x : 0.0, y : 0.2), end: CGPoint = CGPoint(x :0, y: 0.6)) -> Void
    {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = start
        gradient.endPoint = end
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    
    // Add borderWidth i Story Bord
    @IBInspectable var borderWidth: CGFloat
        {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    // Add cornerRadius in Story Bord
    @IBInspectable var cornerRadius: CGFloat
        {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    // Add borderColor in Story Bord
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    func maskedCorners_Border_shadow(maskedCorners: CACornerMask? = nil, cornerRadius:CGFloat, borderWidth:CGFloat = 0, borderColor: CGColor = ColorDesignSystem.Colors.gray.color.cgColor, shadowOffsetWidth: CGFloat = 0, shadowOffsetheight: CGFloat = 0, shadowRadius: CGFloat = 0, shadowOpacity: Float = 0, shadowColor:CGColor = ColorDesignSystem.Colors.gray.color.cgColor,backColor: CGColor = UIColor.clear.cgColor, masksToBounds: Bool? = false) {
     
     
        self.clipsToBounds = true
        self.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetheight)
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.layer.backgroundColor = backColor
  
        self.layer.shadowOpacity = shadowOpacity
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = shadowColor
        self.layer.shadowRadius = shadowRadius
        if maskedCorners != nil {
            self.layer.maskedCorners = maskedCorners ?? []
            self.layer.masksToBounds = masksToBounds ?? false
        }else{
            self.layer.masksToBounds =  masksToBounds ?? false

        }
//        self.clipsToBounds = true
    }
    
    func shadow_corner_Border(Corner:CGFloat, border:CGFloat, Radius:CGFloat, Opacity:Float, Width:CGFloat, height:CGFloat, borderColor: CGColor = ColorDesignSystem.Colors.LightGray.color.cgColor ,shadowColor:CGColor = #colorLiteral(red: 0.831372549, green: 0.831372549, blue: 0.831372549, alpha: 1))
    {
        self.layer.shadowOffset = CGSize(width: Width, height: height)
        self.layer.borderWidth = border
        self.layer.masksToBounds = false
        self.layer.shadowRadius = Radius
        self.layer.shadowOpacity = Opacity
        self.layer.cornerRadius = Corner
        self.layer.borderColor = borderColor
        self.layer.shadowColor = shadowColor
    }
    
    func viewsetRounded(borderWidth: CGFloat, borderColor: CGColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    func viewSetCornerImage(borderWidth: CGFloat, borderColor: CGColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) {
       
        self.layer.cornerRadius = 10
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    func applyCurvedPath(givenView: UIView,curvedPercent:CGFloat) {
        guard curvedPercent <= 1 && curvedPercent >= 0 else{
            return
        }
        
        let shapeLayer = CAShapeLayer(layer: givenView.layer)
        shapeLayer.path = self.pathCurvedForView(givenView: givenView,curvedPercent: curvedPercent).cgPath
        shapeLayer.frame = givenView.bounds
        shapeLayer.masksToBounds = true
        givenView.layer.mask = shapeLayer
    }
    
    func pathCurvedForView(givenView: UIView, curvedPercent:CGFloat) ->UIBezierPath {
        let arrowPath = UIBezierPath()
        arrowPath.move(to: CGPoint(x:0, y:0))
        arrowPath.addLine(to: CGPoint(x:givenView.bounds.size.width, y:0))
        arrowPath.addLine(to: CGPoint(x:givenView.bounds.size.width, y:givenView.bounds.size.height))
        arrowPath.addQuadCurve(to: CGPoint(x:0, y:givenView.bounds.size.height), controlPoint: CGPoint(x:givenView.bounds.size.width/2, y:givenView.bounds.size.height-givenView.bounds.size.height*curvedPercent))
        arrowPath.addLine(to: CGPoint(x:0, y:0))
        arrowPath.close()
        
        return arrowPath
    }
    //https://stackoverflow.com/questions/48317569/how-to-apply-curve-at-bottom-of-uiimageview
    
    
    func setHeight(_ h:CGFloat, animateTime:TimeInterval?=nil) {
        if let c = self.constraints.first(where: { $0.firstAttribute == .height && $0.relation == .equal }){
            c.constant = CGFloat(h)
            if let animateTime = animateTime {
                UIView.animate(withDuration: animateTime, animations:{
                    self.superview?.layoutIfNeeded()
                })
            }
            else {
                self.superview?.layoutIfNeeded()
            }
        }
    }
    //https://stackoverflow.com/questions/43010173/how-to-programmatically-increase-the-height-of-uiview-with-swift
   
        func setTransformRotation(toDegrees angleInDegrees: CGFloat) {
            let angleInRadians = angleInDegrees / 180.0 * CGFloat.pi
            let rotation = self.transform.rotated(by: angleInRadians)
            self.transform = rotation
        }
}
extension UIView {
     
     func dropShadow(color: UIColor = UIColor.lightGray, opacity: Float = 0.5, offSet: CGSize = CGSize(width: 0, height: 0), radius: CGFloat = 5, scale: Bool = false) {
          self.layer.masksToBounds = false
          self.layer.shadowColor = color.cgColor
          self.layer.shadowOpacity = opacity
          self.layer.shadowOffset = offSet
          self.layer.shadowRadius = radius
          
          self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
          self.layer.shouldRasterize = false
          //self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
     }
        func addDashedBorder(color: UIColor) {
            let color = color.cgColor

            let shapeLayer: CAShapeLayer = CAShapeLayer()
            let frameSize = self.frame.size
            let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

            shapeLayer.bounds = shapeRect
            shapeLayer.position = CGPoint(x: frameSize.width / 2, y: frameSize.height / 2)
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.strokeColor = color
            shapeLayer.lineWidth = 1.5
            shapeLayer.lineJoin = CAShapeLayerLineJoin.round
            shapeLayer.lineDashPattern = [4, 4]
            shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 15).cgPath
            self.layer.addSublayer(shapeLayer)

        }
}
