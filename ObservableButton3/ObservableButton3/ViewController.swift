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
        button.addTarget(self, action: #selector(TapEvent), for: .touchUpInside)
        return button
    }()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(observerButton)
        NSLayoutConstraint.activate([
            observerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            observerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func TapEvent() {
        observerButton.rx
            .tap
            .subscribe(onNext: {
                print("Observable이 항목을 방출 했다!")
            },
            onError: { error in
                print("에러가 발생 했다!")
            },
            onCompleted: {
                print("해당 이벤트가 끝났다!")
            })
            .disposed(by: disposeBag)

    }

}

