//
//  MLoginResponse.swift
//  MVVMDemo
//
//  Created by Shitesh Patel on 26/07/20.
//  Copyright © 2020 Shitesh Patel. All rights reserved.
//

import Foundation

struct LoginResponse : Decodable {

    let errorMessage: String?
    let data: LoginResponseData?
}

struct LoginResponseData : Decodable {
    let userName: String
    let userID: Int
    let email: String

    enum CodingKeys: String, CodingKey {
        case userName
        case userID = "userId"
        case email
    }
}
