//
//  AddItemViewController.swift
//  Design Analytic
//
//  Created by Mousa on 01.04.21.
//

import UIKit

protocol DataEnteredFromGoBackDelegate: class {
    func userDidBack()
}

class AddItemViewController: UIViewController, DataEnteredFromGoBackDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var addBarButtonItem = UIBarButtonItem()
    let viewModel = AddItemViewModel()
    var pageTitle: String? {
        didSet {
            title = pageTitle
        }
    }
    var pageDescription: String? {
        didSet {
            titleLabel.text = "\(viewModel.getUserName()) \(pageDescription ?? "")"
        }
    }
    var isEditable: Bool? {
        didSet {
            tableView.isEditing = isEditable ?? false
        }
    }
    
    init(isEditable: Bool, pageTitle: String, pageDescription: String) {
        super.init(nibName: "AddItemViewController", bundle: nil)
        title = pageTitle
        self.isEditable = isEditable
        self.pageDescription = pageDescription
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupAddButton()
        setupEditableTableView()
        setupPageDescription()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupEditableTableView() {
        if isEditable ?? false {
            tableView.isEditing = true
        }
    }
    
    private func setupPageDescription() {
        titleLabel.text = "\(viewModel.getUserName()) \(pageDescription ?? "")"
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
        let vc = GoBackViewController(nibName: "GoBackViewController", bundle: nil)
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func userDidBack() {
        isEditable = true
        pageTitle = "Move it"
        pageDescription = "Move the Parrot to the top of the list"
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
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = viewModel.items[sourceIndexPath.row]
        viewModel.items.remove(at: sourceIndexPath.row)
        viewModel.items.insert(movedObject, at: destinationIndexPath.row)
    }
}
