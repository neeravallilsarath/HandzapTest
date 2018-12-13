//
//  MultipleTextFieldTVCell.swift
//  Handzap
//
//  Created by Sarath NS on 11/12/18.
//  Copyright © 2018 Sarath NS. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

class MultipleTextFieldTVCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var textFieldLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var firstTextField: JVFloatLabeledTextField!
    @IBOutlet weak var secondTextField: JVFloatLabeledTextField!
    @IBOutlet weak var firstBottomView: UIView!
    @IBOutlet weak var secondBottomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        firstTextField.delegate = self
        secondTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func populateMultipleTextField(options: NewPostOptions) {
        let optionDescription = options.description.components(separatedBy: ",")
        let optionShortDescription = options.description.components(separatedBy: ",")

        self.firstTextField.placeholder = optionDescription[0]
        self.firstTextField.floatingLabel.text = optionShortDescription[0]
        
        self.secondTextField.placeholder = optionDescription[1]
        self.secondTextField.floatingLabel.text = optionShortDescription[1]
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == firstTextField {
            firstBottomView.backgroundColor = UIColor(red: 39.0/255.0, green: 108.0/255.0, blue: 131.0/255.0, alpha: 1.0)
        } else {
            secondBottomView.backgroundColor = UIColor(red: 39.0/255.0, green: 108.0/255.0, blue: 131.0/255.0, alpha: 1.0)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == firstTextField {
            firstBottomView.backgroundColor = UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0)
        } else {
            secondBottomView.backgroundColor = UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0)
        }
    }
    
}
