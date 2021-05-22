//
//  XibView.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 19/05/21.
//

import UIKit

@IBDesignable
class XibView: UIView {

    public var contentView:UIView?
    
    @IBInspectable var xibFileName:String?
    
    public typealias AwakeBlock = () -> Void
    
    private var onAwakeBlock:AwakeBlock?
    public func onAwake(_ onAwakeBlock:@escaping AwakeBlock){
        self.onAwakeBlock = onAwakeBlock
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initXibFile()
        self.contentView?.prepareForInterfaceBuilder()
        if let block = self.onAwakeBlock{
            block()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.initXibFile()
        self.contentView?.prepareForInterfaceBuilder()
    }
    
    private func initXibFile(){
        if let view = loadViewFromXibFile(){
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(view)
            self.contentView = view
        }
    }
    
    private func loadViewFromXibFile() -> UIView?{
        if let fileName = self.xibFileName{
            let bundle = Bundle(for: type(of: self))
            let xibFile = UINib(nibName: fileName, bundle: bundle)
            return xibFile.instantiate(withOwner: self, options: nil).first as? UIView
        }
        return nil
    }

}

