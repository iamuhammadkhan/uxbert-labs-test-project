//
//  UIScrollView+Extension.swift
//  UXBERT-LABS-Test-Project-MK
//
//  Created by Muhammad Khan on 02/11/2020.
//  Copyright © 2020 Muhammad Khan. All rights reserved.
//

import UIKit

extension UIScrollView {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        next?.touchesBegan(touches, with: event)
    }
}
