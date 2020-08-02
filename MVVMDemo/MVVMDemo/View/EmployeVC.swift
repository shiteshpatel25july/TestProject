//
//  EmployeVC.swift
//  MVVMDemo
//
//  Created by Shitesh Patel on 26/07/20.
//  Copyright © 2020 Shitesh Patel. All rights reserved.
//

import UIKit

class EmployeVC: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tblView: UITableView!
    
    private let employeeViewModel = EmployeeViewModel()
    var employeeTableData: EmployeeResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getEmployeeByDepartment(segmentIndex: 0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        getEmployeeByDepartment(segmentIndex: sender.selectedSegmentIndex)
    }
    
    
    func getEmployeeByDepartment(segmentIndex: Int) {
        employeeViewModel.getEmployeeByDepartment(departmentIndex: segmentIndex) { [weak self] (response) in
            if response?.data != nil {
                self?.employeeTableData = response
                
                DispatchQueue.main.async {
                    self?.tblView.reloadData()
                }
            }
        }
    }
}


extension EmployeVC : UITableViewDataSource {
    // MARK: - Table view datasource method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeTableData?.data?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = employeeTableData?.data?[indexPath.row].name
        
        return cell
    }
}
