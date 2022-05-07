//
//  FormTableViewCell.swift
//  Swiftagram
//
//  Created by Irfan Izudin on 07/05/22.
//

import UIKit

class FormTableViewCell: UITableViewCell, UITextFieldDelegate {

    static let identifier = "FormTableViewCell"
    
    private let formLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()

    private let field: UITextField = {
        let field = UITextField()
        field.returnKeyType = .done
        return field
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        field.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: EditProfileFormModel){
        formLabel.text = model.label
        field.placeholder = model.placeholder
        field.text = model.value
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        formLabel.text = nil
        field.placeholder = nil
        field.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        formLabel.frame = CGRect(x: 20, y: 0, width: contentView.width/4, height: contentView.height)
        field.frame = CGRect(x: 20 + formLabel.right, y: 0, width: contentView.width-40-formLabel.width, height: contentView.height)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }

}
