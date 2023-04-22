//
//  Extensions.swift
//  TinkoffSolutionsCup
//
//  Created by Efanov Sergey on 22.04.2023.
//

import Foundation
import UIKit

public enum BackgroundType {
    case white, gray
}

public enum EfanovColor {
    private static var _headerLightColor: UIColor {
        UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    }
    
    private static var _headerDarkColor: UIColor {
        UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    }
    
    private static var _labelLightColor: UIColor {
        UIColor(red: 0.573, green: 0.6, blue: 0.635, alpha: 1)
    }
    
    private static var _labelDarkColor: UIColor {
        UIColor(red: 0.573, green: 0.6, blue: 0.635, alpha: 1)
    }
    
    public static var buttonBackgroundColor: UIColor {
        UIColor(red: 0, green: 0.063, blue: 0.141, alpha: 0.03)
    }
    
    public static var buttonTittleColor: UIColor {
        UIColor(red: 0.259, green: 0.545, blue: 0.976, alpha: 1)
    }
    
    public static var labelColor: UIColor {
        _labelLightColor
    }
    
    public static var grayBackgroundColor: UIColor {
        UIColor(red: 0.965, green: 0.969, blue: 0.973, alpha: 1)
    }
    
    public static var shadowCollor: UIColor {
        UIColor(red: 0, green: 0, blue: 0, alpha: 0.12)
    }
    
    public static var headerColor: UIColor {
//        if dark {
//            return _headerDarkColor
//        } else {
            return _headerLightColor
//        }
    }
}
