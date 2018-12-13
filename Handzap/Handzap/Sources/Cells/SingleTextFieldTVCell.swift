//
//  SingleTextFieldTVCell.swift
//  Handzap
//
//  Created by Sarath NS on 11/12/18.
//  Copyright © 2018 Sarath NS. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

class SingleTextFieldTVCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var textField: JVFloatLabeledTextField!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var textFieldTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomLabel: UILabel!
    
    var options: NewPostOptions!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func populateSingleTextField(options: NewPostOptions) {
        self.options = options
        self.textField.placeholder = options.description
        self.textField.floatingLabel.text = options.shortDescription
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        bottomView.backgroundColor = UIColor(red: 39.0/255.0, green: 108.0/255.0, blue: 131.0/255.0, alpha: 1.0)
        if options == NewPostOptions.PostTitle {
            bottomLabel.isHidden = false
        } else if options == NewPostOptions.DescribePost {
            bottomLabel.isHidden = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        bottomView.backgroundColor = UIColor(red: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0)
        bottomLabel.isHidden = true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var characterLimit = 0
        if options == NewPostOptions.PostTitle {
            characterLimit = 50
        } else if options == NewPostOptions.DescribePost {
            characterLimit = 400
        }
        
        guard let text = textField.text else { return true }
        let length = text.count + string.count - range.length
        let count = characterLimit - length
        bottomLabel.text =  "\(String(count)) characters left"
        return length < characterLimit
    }
}
