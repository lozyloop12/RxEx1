//
//  DemoViewController.swift
//  RxDemo
//
//  Created by LozyLoop on 28/03/2021.
//  Copyright © 2021 LozyLoop. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DemoViewController: UIViewController {
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    private let disposeBag = DisposeBag()
    private let testViewModal = TestViewModal()
        
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.isNavigationBarHidden = true
         setUpUI()
        
        text1.rx.text.map { $0 ?? "" }.bind(to: testViewModal.text1).disposed(by: disposeBag)
        text2.rx.text.map { $0 ?? "" }.bind(to: testViewModal.text2).disposed(by: disposeBag)
        text3.rx.text.map { $0 ?? "" }.bind(to: testViewModal.text3).disposed(by: disposeBag)
        
        testViewModal.isValid().bind(to: button.rx.isEnabled).disposed(by: disposeBag)
        testViewModal.isValid().map { $0 ? 1 : 0.1 }.bind(to: button.rx.alpha).disposed(by: disposeBag)
    }
    
    private func setUpUI(){
        let round_width = UIScreen.main.bounds.size.width / 4
        button.layer.cornerRadius = round_width
    }

    @IBAction func tapButton(_ sender: Any) {
        let new_text1 = String(text1.text ?? "")
        let new_text2 = String(text2.text ?? "")
        let new_text3 = String(text3.text ?? "")
        label.text = "\(new_text1) \(new_text2) \(new_text3)"
    }
}

class TestViewModal {
    let text1 = PublishSubject<String>()
    let text2 = PublishSubject<String>()
    let text3 = PublishSubject<String>()
    
    func isValid() -> Observable<Bool>{
        Observable.combineLatest(text1.asObserver().startWith(""), text2.asObserver().startWith(""), text3.asObserver().startWith("")).map{
            textLabel1, textLabel2, textLabel3 in return textLabel1.count > 0 && textLabel2.count > 0 && textLabel3.count > 0
        }.startWith(false)
    }
}
