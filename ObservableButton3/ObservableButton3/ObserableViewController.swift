//
//  ObserableViewController.swift
//  ObservableButton3
//
//  Created by 차지용 on 12/24/24.
//

import UIKit
import RxSwift
class ObserableViewController: UIViewController {
    private var timerDisposable: Disposable?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

        timerDisposable = Observable<Int>.interval(
          .seconds(1),
          scheduler: MainScheduler.instance
        )
        .subscribe(onNext: {
            print($0)
        })
    }
    deinit {
        timerDisposable?.dispose()
        print("ObserableViewController deinit - Timer 구독 해제")
    }
}




