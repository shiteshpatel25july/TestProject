//
//  EmployeResponse.swift
//  MVVMDemo
//
//  Created by Shitesh Patel on 26/07/20.
//  Copyright © 2020 Shitesh Patel. All rights reserved.
//

import Foundation

struct EmployeeResponse: Decodable {
    let errorMessage: String?
    let data: [Employee]?
}

struct Employee: Decodable {
    let name, email, id, joining : String
    
    enum CodingKeys: String, CodingKey {
        case name, email, id, joining
    }
}
