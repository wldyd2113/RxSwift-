//
//  ObserableViewController.swift
//  ObservableButton3
//
//  Created by 차지용 on 12/24/24.
//

import UIKit
import RxSwift
class ObserableViewController: UIViewController {
    var observerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Obserable Button", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(observerButton)
        NSLayoutConstraint.activate([
            observerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            observerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
        bindBtn()
    }
    
    func bindBtn() {
        observerButton.rx.tap
            .subscribe(onNext: {
                print("버튼 눌림")
            },onDisposed: {
                print("버튼 disposed")
            }
            )
    }
    
    
}
