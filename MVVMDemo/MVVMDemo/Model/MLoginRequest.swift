//
//  MLoginRequest.swift
//  MVVMDemo
//
//  Created by Shitesh Patel on 26/07/20.
//  Copyright © 2020 Shitesh Patel. All rights reserved.
//

import Foundation

struct LoginRequest: Encodable {
    var userEmail, userPassword: String?
}
