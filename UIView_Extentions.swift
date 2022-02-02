//
//  File2.swift


//

import UIKit

// MARK: - UIView
extension UIView
{
    
    // Add borderWidth i StoryBoard
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
    //Mark: - works with images too 
    func viewsetRounded(borderWidth: CGFloat, borderColor: CGColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
        //Mark: - works with images too 

    func viewSetCornerImage(borderWidth: CGFloat, borderColor: CGColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.layer.masksToBounds = true
        self.clipsToBounds = true
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
