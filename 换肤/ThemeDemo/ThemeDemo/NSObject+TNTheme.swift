//
//  NSObject+TNTheme.swift
//  ThemeDemo
//
//  Created by Tonio on 2019/6/17.
//  Copyright © 2019 Tonio. All rights reserved.
//

import Foundation
import UIKit

private var key_selectorDict: Void?
private var key_blockDic: Void?

extension NSObject {
    
    var selectorDict: [String: String]? {
        get {
            var dic = objc_getAssociatedObject(self, &key_selectorDict) as? [String: String]
            if dic == nil {
                NotificationCenter.default.addObserver(self, selector: #selector(themeChanging), name: NSNotification.Name(rawValue: "themeChanging"), object: nil)
                dic = [:]
//                objc_setAssociatedObject(self, &key_selectorDict, dic, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return dic
        }
        set {
            objc_setAssociatedObject(self, &key_selectorDict, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var blockDict: [String: tnBlock]? {
        get {
            var dic = objc_getAssociatedObject(self, &key_blockDic) as? [String: tnBlock]
            if dic == nil {
                NotificationCenter.default.addObserver(self, selector: #selector(themeChanging), name: NSNotification.Name(rawValue: "themeChanging"), object: nil)
                dic = [:]
            }
            return dic
        }
        set {
            objc_setAssociatedObject(self, &key_blockDic, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @objc func themeChanging() {
//        for (key, obj) in selectorDict ?? [:] {
//            let color = TNThemeManager.shared.getCurrentColor(theme: key)
//            self.perform(NSSelectorFromString(obj), with: color)
//        }
        for (key, obj) in blockDict ?? [:] {
            let color = obj(TNThemeManager.shared.currentTheme ?? "NORMAL")
            self.perform(NSSelectorFromString(key), with: color)
        }
    }
}
