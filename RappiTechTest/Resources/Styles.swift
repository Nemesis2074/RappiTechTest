//
//  Styles.swift
//  RappiTechTest
//
//  Created by Adair de Jesús Castillo Meza on 19/05/21.
//

import Foundation
import UIKit

class Styles{
    
    private struct AppFont {
        static let AppFontNormal = "Avenir-Light"
        static let AppFontItalic = "Avenir-LightOblique"
        static let AppFontBold = "Avenir-Medium"
        static let AppFontItalicBold = "Avenir-MediumOblique"
    }
    
    public struct Margin{
        static let MarginMin:CGFloat = 4.0
        static let Margin1x:CGFloat = 8.0
        static let Margin2x:CGFloat = 16.0
        static let Margin3x:CGFloat = 24.0
        static let Margin4x:CGFloat = 32.0
    }
    
    public struct Constants{
        static let AnimationTime = 0.5
        static let CornerRadius:CGFloat = 8.0
        static let ShadowOffset:CGSize = CGSize(width: 1.0, height: 1.0)
        static let ShadowOpacity:Float = 0.5
        static let ShadowRadius:CGFloat = 8
    }
    
    
    public class Color{
        
        class var textPrimary:UIColor{
            return UIColor(named: "TextPrimary")!
        }

        class var textPrimaryLight:UIColor{
            return UIColor(named: "TextPrimaryLight")!
        }

        class var textSecondary:UIColor{
            return UIColor(named: "TextSecondary")!
        }

        class var textAccent: UIColor {
            return UIColor(named: "AccentColor")!
        }
        
        class var bgGeneral:UIColor{
            return UIColor(named: "BgGeneral")!
        }

        class var bgSecondary:UIColor{
            return UIColor(named: "BgSecondary")!
        }
        
        class var bgCard:UIColor {
            return UIColor(named: "BgCard")!
        }

    }
    
    public class Font{
        
        class var small:UIFont{
            return UIFont(name: AppFont.AppFontNormal, size: 13.0)!
        }
        
        class var smallBold:UIFont{
            return UIFont(name: AppFont.AppFontBold, size: 13.0)!
        }
        
        class var normal:UIFont{
            return UIFont(name: AppFont.AppFontNormal, size: 16.0)!
        }
        
        class var normalBold:UIFont{
            return UIFont(name: AppFont.AppFontBold, size: 16.0)!
        }
        
        class var normalItalic:UIFont{
            return UIFont(name: AppFont.AppFontItalic, size: 16.0)!
        }
        
        class var medium:UIFont{
            return UIFont(name: AppFont.AppFontNormal, size: 19.0)!
        }
        
        class var mediumBold:UIFont{
            return UIFont(name: AppFont.AppFontBold, size: 19.0)!
        }
        
        class var large:UIFont{
            return UIFont(name: AppFont.AppFontNormal, size: 22.0)!
        }
        
        class var largeBold:UIFont{
            return UIFont(name: AppFont.AppFontBold, size: 22.0)!
        }
        
        class var big:UIFont{
            return UIFont(name: AppFont.AppFontBold, size: 40.0)!
        }
        
    }
    
    public class Icon{
        
        class var tabSearch: UIImage?{
            return UIImage(named: "tab_search")
        }
        
    }
    
}
