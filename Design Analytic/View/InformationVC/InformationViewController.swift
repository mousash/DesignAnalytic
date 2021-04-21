//
//  InformationViewController.swift
//  Design Analytic
//
//  Created by Mousa on 31.03.21.
//

import UIKit

class InformationViewController: UIViewController, Alert {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var nameView: InformationInputView!
    @IBOutlet weak var ageView: InformationInputView!
    @IBOutlet weak var locationView: InformationInputView!
    @IBOutlet weak var maleButton: CustomSelectingButton!
    @IBOutlet weak var femaleButton: CustomSelectingButton!
    @IBOutlet weak var otherGenderButton: CustomSelectingButton!
    
    let viewModel = InformationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Information"
        setupTextFieldsDelegate()
        setupView()
    }
    
    private func setupTextFieldsDelegate() {
        nameView.textFieldInput.delegate = self
        ageView.textFieldInput.delegate = self
        locationView.textFieldInput.delegate = self
    }
    
    private func setupView() {
        nameView.titleLabel.text = "Name"
        nameView.textFieldInput.placeholder = "Name"
        
        ageView.titleLabel.text = "Age"
        ageView.textFieldInput.placeholder = "Age"
        ageView.textFieldInput.keyboardType = .numberPad
        
        locationView.titleLabel.text = "Location"
        locationView.textFieldInput.placeholder = "Location"
        
        maleButton.setTitle("Male", for: .normal)
        femaleButton.setTitle("Female", for: .normal)
        otherGenderButton.setTitle("Other", for: .normal)
    }
    
    @IBAction func genderButtonAction(_ sender: CustomSelectingButton) {
        maleButton.isChecked = false
        femaleButton.isChecked = false
        otherGenderButton.isChecked = false
        sender.isChecked = true
        viewModel.gender = sender.titleLabel?.text ?? ""
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if nameView.textFieldInput.text! == "" || ageView.textFieldInput.text! == "" || locationView.textFieldInput.text! == "" {
                setAlert(title: "Something is wrong", message: "please fill out all the informations")
                return
        }
        saveUserInformation()
        goToNextVC()
    }
    
    private func saveUserInformation() {
        UserDefaults.standard.setValue(nameView.textFieldInput.text!, forKey: "Name")
        UserDefaults.standard.setValue(ageView.textFieldInput.text!, forKey: "Age")
        UserDefaults.standard.setValue(locationView.textFieldInput.text!, forKey: "Location")
    }
    
    private func goToNextVC() {
        let vc = SelectColorsViewController(nibName: "SelectColorsViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension InformationViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != "" {
            if textField == nameView.textFieldInput {
                updateNameWelcomeLabel()
            }
            if textField == locationView.textFieldInput {
                updateLocatioWelcomeLabel()
            }
        }
    }
    
    private func updateNameWelcomeLabel() {
        welcomeLabel.fadeTransition(0.5)
        welcomeLabel.text = "Hello \(nameView.textFieldInput.text!)"
    }
    
    private func updateLocatioWelcomeLabel() {
        welcomeLabel.fadeTransition(0.5)
        welcomeLabel.text = "Hello \(nameView.textFieldInput.text!) \n\n \(locationView.textFieldInput.text!) is a nice place!"
    }
}
