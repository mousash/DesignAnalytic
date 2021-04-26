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

class AddItemViewController: UIViewController, DataEnteredFromGoBackDelegate, Alert {
    
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
        tableView.register(UINib(nibName: AddTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: AddTableViewCell.reuseIdentifier)
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
        if #available(iOS 13.0, *) {
            addBarButtonItem = UIBarButtonItem(image: .add, style: .done, target: self, action: #selector(addItemButtonAction))
        } else {
            addBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addItemButtonAction))
        }
        self.navigationItem.rightBarButtonItem  = addBarButtonItem
    }
    
    @objc private func addItemButtonAction() {
        addItem()
    }
    
    private func addItem() {
        viewModel.addToSeenItems()
        tableView.reloadData()
        if viewModel.getItemsToBeSeen() == viewModel.items.count {
            addBarButtonItem.isEnabled = false
        }
        
        if viewModel.getItemsToBeSeen() == 4 {
            setAlert(title: "Perfect", message: "OK, now go to the next page")
        }else {
            setAlert(title: "hmm", message: "Looks like you want to know about animal names 😃, I think that's enough")
        }
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        if isEditable ?? false {
            let vc = LastViewController(nibName: "LastViewController", bundle: nil)
            navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = GoBackViewController(nibName: "GoBackViewController", bundle: nil)
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func userDidBack() {
        isEditable = true
        pageTitle = "Move it"
        pageDescription = "Move the last item to the top of the list"
    }
    
}

extension AddItemViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getItemsToBeSeen()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let itemCell: UITableViewCell = {
            guard let itemCell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            return itemCell
        }()
        
        itemCell.textLabel?.text = viewModel.items[indexPath.row]
        
        return itemCell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let button = UIButton()
        customView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: customView.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: customView.safeAreaLayoutGuide.leadingAnchor, constant: 32).isActive = true
        button.trailingAnchor.constraint(equalTo: customView.safeAreaLayoutGuide.trailingAnchor, constant: -32).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.setTitle("Add an animal", for: .normal)
        button.backgroundColor = UIColor(named: "Accent")
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        
        return customView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 150
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
    
    @objc func addButtonAction() {
        addItem()
    }
}
