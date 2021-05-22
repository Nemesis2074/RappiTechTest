//
//  RatingView.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 20/05/21.
//

import UIKit

@IBDesignable
class RatingView: UIView {

    public weak var label: UILabel!
    
    @IBInspectable public var text:String?{
        get{
            return self.label.text
        }
        set{
            self.label.text = newValue
        }
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
        self.backgroundColor = Styles.Color.textAccent
        self.layer.cornerRadius = Styles.Constants.CornerRadius
        self.layer.borderColor = Styles.Color.textAccent.cgColor
        self.layer.borderWidth = 1
        
        let label = UILabel(frame: CGRect.zero)
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.textAlignment = .center
        label.font = Styles.Font.mediumBold
        label.textColor = Styles.Color.textPrimaryLight
        self.addSubview(label)
        self.label = label
    }
    
    /*MARK: ++++++++++++++++++++ EVENTOS ++++++++++++++++++++*/
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = frame.width / 2
        
        label.frame = CGRect(x: Styles.Margin.MarginMin,
                             y: Styles.Margin.MarginMin,
                             width: frame.width - Styles.Margin.Margin1x,
                             height: frame.height - Styles.Margin.Margin1x)
    }

}
