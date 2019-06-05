//
//  BusinessB.swift
//  DesignPattern
//
//  Created by LTH on 2019/6/5.
//  Copyright © 2019 Tonio. All rights reserved.
//

import UIKit

class BusinessB: BusinessBase {

    override func handleBusiness(completion: (Bool) -> ()) {
        print("处理业务逻辑-B...")
        completion(false)
    }
    
}
