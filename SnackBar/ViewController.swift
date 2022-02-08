//
//  ViewController.swift
//  SnackBar
//
//  Created by Yunus Abubakarov on 08.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let snackBarViewModel = SnackBarModel(iconType: .note, title: "Title", buttonTittle: nil)
    lazy var snackBar = SnackBar(viewModel: snackBarViewModel, frame: CGRect())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSnackBar()
        //snackBar.isHidden = true
    }
    
    func setupSnackBar() {
        snackBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(snackBar)
        NSLayoutConstraint.activate([
            snackBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            snackBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            snackBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            snackBar.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    @IBAction func showSnackBar(_ sender: Any) {
        
        showHideSnackBar(snackBar: snackBar)
    }
    
    func showHideSnackBar(snackBar: UIView) {
        print(snackBar.frame)
        let snackBarHeight: CGFloat = 100
        if snackBar.isHidden {
            snackBar.transform = .identity
            snackBar.transform = CGAffineTransform(translationX: 0, y: snackBarHeight)
            snackBar.isHidden = false
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: []) {
                snackBar.transform = .identity
            } completion: {_ in
                snackBar.transform = .identity
            }
        } else {
            snackBar.transform = .identity
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: []) {
                snackBar.transform = CGAffineTransform(translationX: 0, y: snackBarHeight)
            } completion: {_ in
                snackBar.isHidden = true
                snackBar.transform = .identity
            }
        }
    }
    
}

