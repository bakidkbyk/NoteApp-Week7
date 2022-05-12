//
//  ViewController.swift
//  NoteApp-Week7
//
//  Created by Baki Dikbıyık on 7.05.2022.
//

import UIKit

class ViewController: UIViewController, notEkle {
    var tumNotlar = [Info]()
    func notEkle(_ controller: SecondViewController, with item: Info) {
        let yeniHucre =  tumNotlar.count
        tumNotlar.append(item)
        let indexPatha = IndexPath(row: yeniHucre, section: 0)
        let indexPaths = [indexPatha]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
        }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var notEkleButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecond" {
            let destinationVC = segue.destination as? SecondViewController
            destinationVC?.delegate = self
        }
    }

    @IBAction func notEkleButton(_ sender: Any) {
        performSegue(withIdentifier: "goToSecond", sender: nil)
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tumNotlar.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell {
            let info = tumNotlar[indexPath.row]
            cell.prepareForInfo(for: info)
            return cell
            
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
            

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        tableView.beginUpdates()
        tumNotlar.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        tableView.endUpdates()
    }
    

  

    
   
        
        
            
    
   
        
    }
    
    




