//
//  NewPostViewController.swift
//  Handzap
//
//  Created by Sarath NS on 11/12/18.
//  Copyright © 2018 Sarath NS. All rights reserved.
//

import UIKit

enum NewPostOptions: Int, CaseIterable {
    case PostTitle = 0
    case DescribePost
    case PostCategories
    case BudgetAndCountry
    case RateAndPaymentMethod
    case Location
    case StartDateAndTerm
    
    var description: String {
        switch self {
            case .PostTitle:                return "Enter Post Title"
            case .DescribePost:             return "Descibe Your Post"
            case .PostCategories:           return "Select Post Categories"
            case .BudgetAndCountry:         return "Budget,Country"
            case .RateAndPaymentMethod:     return "Rate,Payment Method"
            case .Location:                 return "Set Location"
            case .StartDateAndTerm:         return "Start Date,Job Term"
            }
    }
    
    var shortDescription: String {
        switch self {
            case .PostTitle:                return "Post Title"
            case .DescribePost:             return "Post Description"
            case .PostCategories:           return "Post Categories"
            case .BudgetAndCountry:         return "Budget,Country"
            case .RateAndPaymentMethod:     return "Rate,Payment"
            case .Location:                 return "Location"
            case .StartDateAndTerm:         return "Start Date,Job Term"
        }
    }
}

class NewPostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- View Life Cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "New Post"
        tableView.register(UINib(nibName: "SingleTextFieldTVCell", bundle: nil), forCellReuseIdentifier: "SingleTextFieldTVCell")
        tableView.register(UINib(nibName: "MultipleTextFieldTVCell", bundle: nil), forCellReuseIdentifier: "MultipleTextFieldTVCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    //MARK:- Tableview Datasource Methods -
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewPostOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell?
        
        switch NewPostOptions(rawValue: indexPath.row) {
            case .PostTitle?, .DescribePost?: let singleTextFieldCell = tableView.dequeueReusableCell(withIdentifier: "SingleTextFieldTVCell") as! SingleTextFieldTVCell
                singleTextFieldCell.populateSingleTextField(options: NewPostOptions(rawValue: indexPath.row)!)
                cell = singleTextFieldCell
            case .PostCategories?:  let singleTextFieldCell =  tableView.dequeueReusableCell(withIdentifier: "SingleTextFieldTVCell") as! SingleTextFieldTVCell
                singleTextFieldCell.populateSingleTextField(options: .PostCategories)
                cell = singleTextFieldCell
            case .BudgetAndCountry?: let multipleTextFieldCell = tableView.dequeueReusableCell(withIdentifier: "MultipleTextFieldTVCell") as! MultipleTextFieldTVCell
                multipleTextFieldCell.populateMultipleTextField(options: .BudgetAndCountry)
                cell = multipleTextFieldCell
            case .RateAndPaymentMethod?: let multipleTextFieldCell = tableView.dequeueReusableCell(withIdentifier: "MultipleTextFieldTVCell") as! MultipleTextFieldTVCell
                multipleTextFieldCell.populateMultipleTextField(options: .RateAndPaymentMethod)
                cell = multipleTextFieldCell
            case .Location?: let singleTextFieldCell = tableView.dequeueReusableCell(withIdentifier: "SingleTextFieldTVCell") as! SingleTextFieldTVCell
                singleTextFieldCell.populateSingleTextField(options: NewPostOptions(rawValue: indexPath.row)!)
                cell = singleTextFieldCell
            case .StartDateAndTerm?: let multipleTextFieldCell = tableView.dequeueReusableCell(withIdentifier: "MultipleTextFieldTVCell") as! MultipleTextFieldTVCell
                multipleTextFieldCell.populateMultipleTextField(options: .StartDateAndTerm)
                cell = multipleTextFieldCell
            default: break
        }
        
        return cell!
    }

    //MARK:- Tableview Delegate Methods -

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 67.0
    }

}

