//
//  EmployeRequest.swift
//  MVVMDemo
//
//  Created by Shitesh Patel on 26/07/20.
//  Copyright © 2020 Shitesh Patel. All rights reserved.
//

import Foundation

@propertyWrapper struct DepartmentPropertyWrapper {
    private var _value:String
    var wrappedValue: String {
        get {
            return _value == "0" ? "mobile" : "web"
        }
        
        set {
            _value = newValue
        }
    }
    
    init(index: String) {
        _value = index
    }
}

struct EmployeeRequest {
    var userId: Int
    @DepartmentPropertyWrapper var department: String
}
