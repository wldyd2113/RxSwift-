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
        bindButton()
    }
    func bindButton() {
        // observerButton의 탭 이벤트를 구독
        observerButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.presentObserableViewController()
            })
            .disposed(by: disposeBag)
    }
    func presentObserableViewController() {
        let observaleVC = ObserableViewController()
//        observaleVC.modalPresentationStyle = .automatic
        self.present(observaleVC, animated: true, completion: nil)
    }
}

