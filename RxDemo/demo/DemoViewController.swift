//
//  DemoViewController.swift
//  RxDemo
//
//  Created by LozyLoop on 28/03/2021.
//  Copyright © 2021 LozyLoop. All rights reserved.
//

import UIKit
//import RxSwift

class DemoViewController: UIViewController {
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.isNavigationBarHidden = true
         setUpUI()
        text1.addTarget(self, action: #selector(self.validateTextField), for: UIControl.Event.editingChanged)
        text2.addTarget(self, action: #selector(self.validateTextField), for: UIControl.Event.editingChanged)
        text3.addTarget(self, action: #selector(self.validateTextField), for: UIControl.Event.editingChanged)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        button.isEnabled = false
    }
    
    @objc func validateTextField() {
        if text1.text?.isEmpty == true || text2.text?.isEmpty == true || text3.text?.isEmpty == true
          {
            button.isEnabled = false

          }
         else
          {
           button.isEnabled = true
          }
    }
    
    private func setUpUI(){
        button.layer.cornerRadius = 30
    }

    @IBAction func tapButton(_ sender: Any) {
//       let disposeBag = DisposeBag()
//       UIButton.rx.tap.subscribe({ [weak self] _ in
//        guard let text = self?.text1.text + self?.text2.text + self?.text3.text  else {
//            return
//        }
//        self.label.text = text
//        }).disposed(by: disposeBag)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
