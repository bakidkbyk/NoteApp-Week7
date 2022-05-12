//
//  SecondViewController.swift
//  NoteApp-Week7
//
//  Created by Baki Dikbıyık on 7.05.2022.
//

import UIKit

protocol notEkle: AnyObject {
    func notEkle(_ controller: SecondViewController, with item: Info)
}

class SecondViewController: UIViewController {
    @IBOutlet weak var başlıkText: UITextField!
    @IBOutlet weak var notText: UITextField!
    
    var delegate: notEkle?
    var info = Info()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func kaydetButton(_ sender: Any) {
        if başlıkText.text == "" {
            getAlert()
        }
        else if notText.text == "" {
            getAlert()
        }
        info.başlık = başlıkText.text!
        info.note = notText.text!
        delegate?.notEkle(self, with: info)
        
       
           
    }
    
    func getAlert(){
        
        let alert = UIAlertController.init(title: "Hata", message: "Lütfen alanları eksiksiz doldurun!", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        
        alert.addAction(alertAction)
        
        self.present(alert, animated: true)
        
        
    }

    
}
