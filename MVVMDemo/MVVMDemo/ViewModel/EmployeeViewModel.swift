//
//  EmployeeViewModel.swift
//  MVVMDemo
//
//  Created by Shitesh Patel on 26/07/20.
//  Copyright © 2020 Shitesh Patel. All rights reserved.
//

import Foundation

struct EmployeeViewModel {
    func getEmployeeByDepartment(departmentIndex: Int, completion: @escaping(_ response: EmployeeResponse?) -> Void) {
        let userId = UserDefaultUtility().getUserId()
        let employeeRequest = EmployeeRequest(userId: userId, department: DepartmentPropertyWrapper(index: "\(departmentIndex)"))
        
        let employeeEndpoint = "\(ApiEndpoints.employees)?Department=\(employeeRequest.department)&UserId=\(employeeRequest.userId)"
        let url = URL(string: employeeEndpoint)!
        
        let serviceManager = ServiceManager()
        serviceManager.getAPIData(requestUrl: url, resultType: EmployeeResponse.self) { (response) in
            completion(response)
        }
    }
}
