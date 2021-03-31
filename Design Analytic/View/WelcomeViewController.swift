//
//  WelcomeViewController.swift
//  Design Analytic
//
//  Created by Mousa on 30.03.21.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var startButton: UIButton!
    
    var viewModel = WelcomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.isHidden = true
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: WelcomeCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: WelcomeCollectionViewCell.reuseIdentifier)
    }
    
    @IBAction func skipButtonAction(_ sender: Any) {
        collectionView.scrollToItem(at: IndexPath(item: 3, section: 0), at: .centeredHorizontally, animated: true)
        startButton.isHidden = false
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        let vc = InformationViewController(nibName: "InformationViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}

extension WelcomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WelcomeCollectionViewCell.reuseIdentifier, for: indexPath as IndexPath) as! WelcomeCollectionViewCell
        
        cell.item = viewModel.items[indexPath.row]
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in collectionView.visibleCells {
            let indexPath = collectionView.indexPath(for: cell)
            if indexPath!.row == viewModel.items.count - 1 {
                startButton.isHidden = false
            }else {
                startButton.isHidden = true
            }
        }
    }
    
    
}
