//
//  LoadingView.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 22/05/21.
//

import UIKit

@IBDesignable
class LoadingView: UIView {
    
    private let kIndicatorSize:CGFloat = 100
    
    @IBInspectable
    private var blurred:Bool = false{
        didSet{
            self.layoutIfNeeded()
        }
    }
    
    public weak var indicator:LoadingIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initComponents()
    }
    
    init(frame: CGRect, blurred:Bool){
        super.init(frame: frame)
        self.blurred = blurred
        initComponents()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initComponents()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initComponents()
    }
    
    private func initComponents() {
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.isHidden = true
        
        if(self.blurred){
            if !UIAccessibility.isReduceTransparencyEnabled {
                
                let blurEffect = UIBlurEffect(style: .dark)
                let blurEffectView = UIVisualEffectView(effect: blurEffect)
                
                blurEffectView.frame = self.bounds
                blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                
                self.addSubview(blurEffectView)
            }else{
                self.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            }
        }else{
            self.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        }
        
        let indicator = LoadingIndicatorView(frame: CGRect.zero)
        indicator.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        self.indicator = indicator
        self.addSubview(indicator)
    }
    
    public func startAnimating() {
        self.isHidden = false
        self.layer.opacity = 1.0
        self.indicator.startAnimating()
    }
    
    public func stopAnimating(_ completion:(() -> Void)? = nil) {
        UIView.animate(withDuration: Styles.Constants.AnimationTime,
                       delay: Styles.Constants.AnimationTime,
                       options: [], animations: {
                        
            self.layer.opacity = 0
                        
        }, completion: { (finished) in
            self.isHidden = true
            self.indicator.stopAnimating()
            if let block = completion{
                block()
            }
        })
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        indicator.frame = CGRect(x: (self.frame.size.width / 2) - (kIndicatorSize / 2),
                                 y: (self.frame.size.height / 2) - (kIndicatorSize / 2),
                                 width: kIndicatorSize,
                                 height: kIndicatorSize)
    }

}

