//
//  ObserableViewController.swift
//  ObservableButton3
//
//  Created by 차지용 on 12/24/24.
//

import UIKit
import RxSwift
class ObserableViewController: UIViewController {
//    private var timerDisposable: Disposable?
    private var disposeBag: DisposeBag = .init()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

        Observable<Int>.interval(
          .seconds(1),
          scheduler: MainScheduler.instance
        )
        .subscribe(onNext: {
            print($0)
        })
        .disposed(by: disposeBag)
    }
       
}




