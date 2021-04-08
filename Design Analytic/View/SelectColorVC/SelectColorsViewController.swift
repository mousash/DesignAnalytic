//
//  SelectColorsViewController.swift
//  Design Analytic
//
//  Created by Mousa on 08.04.21.
//

import UIKit

class SelectColorsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = SelectColorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select items"
        setupCollectionView()
        setTitleText()
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: SelectColorCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: SelectColorCollectionViewCell.reuseIdentifier)
    }
    
    private func setTitleText() {
        titleLabel.text = "Please select two colors from below"
    }

}

extension SelectColorsViewController: UICollectionViewDelegate,  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
        return CGSize(width: (collectionView.frame.width / 2) - 45, height: 100.0)
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectColorCollectionViewCell.reuseIdentifier, for: indexPath) as? SelectColorCollectionViewCell else { fatalError() }
        
        cell.item = viewModel.items[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.items[indexPath.item].isSelected.toggle()
        collectionView.reloadData()
        
    }

}
