//
//  ViewController.swift
//  SaveFunction
//
//  Created by Yukiyo Suenaga on 2023/06/19.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet weak var fruitsTextField: UITextField!
    @IBOutlet weak var vegTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let memo: Memo? = read()
        
        fruitsTextField.text = memo?.fruits
        vegTextField.text = memo?.veg
    }
    
    func read() -> Memo? {
        return realm.objects(Memo.self).first
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        let fruits: String = fruitsTextField.text!
        let veg: String = vegTextField.text!
        
        let memo: Memo? = read()
        
        if memo != nil {
            try! realm.write {
                memo!.fruits = fruits
                memo!.veg = veg
            }
        } else {
            let newMemo = Memo()
            newMemo.fruits = fruits
            newMemo.veg = veg
            
            try! realm.write {
                realm.add(newMemo)
            }
        }
    }
}
