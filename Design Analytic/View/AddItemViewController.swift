//
//  AddItemViewController.swift
//  Design Analytic
//
//  Created by Mousa on 01.04.21.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var addBarButtonItem = UIBarButtonItem()
    
    let viewModel = AddItemViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setuptableView()
        setTitleText()
        setupAddButton()
    }

    private func setuptableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setTitleText() {
        titleLabel.text = "\(viewModel.getUserName()) try to add a new row to this animal list please"
    }
    
    private func setupAddButton() {
        addBarButtonItem = UIBarButtonItem(image: .add, style: .done, target: self, action: #selector(addItemButtonAction))
            self.navigationItem.rightBarButtonItem  = addBarButtonItem
    }
    
    @objc private func addItemButtonAction() {
        viewModel.addToSeenItems()
        tableView.reloadData()
        if viewModel.getItemsToBeSeen() == viewModel.items.count {
            addBarButtonItem.isEnabled = false
        }
        
        if viewModel.getItemsToBeSeen() == 4 {
            let alertController = UIAlertController(title: "Perfect", message: "OK, now go to the next page", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {_ in }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }else {
            let alertController = UIAlertController(title: "hmm", message: "Looks like you want to know about animal names 😃, I think that's enough", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {_ in }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
    }
    
}

extension AddItemViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getItemsToBeSeen()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell(style: .default, reuseIdentifier: "cell")
                }
                return cell
            }()
            
        cell.textLabel?.text = viewModel.items[indexPath.row]
        return cell
    }
    
    
}
