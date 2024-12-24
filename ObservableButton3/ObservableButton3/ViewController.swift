//
//  ViewController.swift
//  ObservableButton
//
//  Created by 차지용 on 12/23/24.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    var observerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Obserable Button", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var disposeButton:UIButton = {
        let button = UIButton()
        button.setTitle("Dipose Button", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let disposeBag = DisposeBag()
    var buttonSubscription: Disposable? //구독을 저장할 변수
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(observerButton)
        view.addSubview(disposeButton)
        NSLayoutConstraint.activate([
            observerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            observerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            disposeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor ),
            disposeButton.topAnchor.constraint(equalTo: observerButton.bottomAnchor, constant: 16)
            
        ])
        setupSubscriptions()
    }
    func setupSubscriptions() {
        buttonSubscription = observerButton.rx
            .tap
            .subscribe(onNext: {
                print("Observable 버튼이 눌림")
            })
        
        disposeButton.rx
            .tap
            .subscribe(onNext: {
                self.buttonSubscription?.dispose()
                print("Observable 버튼 구독 해제")

            })
            .disposed(by: disposeBag)
    }

}

