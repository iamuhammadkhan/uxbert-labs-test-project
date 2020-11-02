//
//  UIStoryBoard+Extension.swift
//  UXBERT-LABS-Test-Project-MK
//
//  Created by Muhammad Khan on 02/11/2020.
//  Copyright © 2020 Muhammad Khan. All rights reserved.
//

import UIKit

extension UIStoryboard {
    enum Storyboard: String {
        case main
    }
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue.capitalized, bundle: bundle)
    }
    
    func instantiateViewController<VC: UIViewController>() -> VC {
        guard let viewController = instantiateViewController(withIdentifier: VC.identifier) as? VC else {
            fatalError("Couldn't instantiate view controller with identifier \(VC.identifier) ")
        }
        return viewController
    }
}
