//
//  MonsterListViewController.swift
//  MonsterRoster
//
//  Created by user128720 on 7/28/17.
//  Copyright © 2017 djbcn6. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class MonsterListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var RosterView: UITableView!
   
    @IBOutlet var MonsterView: UITableView!
    let model = MonsterModel()
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedList = UserDefaults.standard.array(forKey: "Saved Listmk3") as? [Int]{
            print("Previous roster data found")
            if savedList.count != 0 {
            for i in 0...(savedList.count-1){
                model.monsters.append(model.bestiary[savedList[i]-1])
            }
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MonsterListViewController.didTap(recognizer:)) );
        self.MonsterView.addGestureRecognizer(tapGesture)
    
    }
    func didTap(recognizer: UITapGestureRecognizer){
        print("Tapped")
        if recognizer.state == UIGestureRecognizerState.ended{
            let tapLocation = recognizer.location(in: self.MonsterView)
            print("\(tapLocation) tapped")
            if MonsterView.indexPathForRow(at: tapLocation) != nil{
                let tappedIndexPath = MonsterView.indexPathForRow(at: tapLocation)
                //if let tappedCell = self.MonsterView.cellForRow(at: tappedIndexPath!){
                    showAlert(tappedIndexPath! as NSIndexPath)
                    
                
            }
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return(model.monsters.count)
    }
    
    public func showAlert( _ Index: NSIndexPath){
        let alertController = UIAlertController(title: "Hey Monster Master!", message: "What do you want to do?", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "Nothing", style: .default, handler: nil)
        let deleteAction = UIAlertAction(title: "Remove", style: .destructive){
            UIAlertAction in
            print("remove Pressed")
            self.removeMonster(index: Index)
        }
        let inspectAction = UIAlertAction(title: "Inspect", style: .default){
            UIAlertAction in
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "Monster Inspector") as! MonsterInspectorViewController
            nextVC.inspectedMonster = self.model.monsters[Index.row]
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        alertController.addAction(inspectAction)
        alertController.addAction(deleteAction)
        alertController.addAction(defaultAction)
    
        present(alertController, animated: true, completion: nil)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "myProtoCell") as! RosterCell
        cell.spriteView?.animationImages = model.monsters[indexPath.row].animation
        
        cell.spriteView?.animationDuration = Duration
        
        
        cell.imageView?.image = cell.imageView?.animationImages?[0]
        
        cell.spriteView?.startAnimating()
        cell.nameLabel?.text = model.monsters[indexPath.row].name
        return(cell)
    }
    
    
    @IBAction func addMonster(_ sender: Any) {
        model.addMonster()
        MonsterView.beginUpdates()
        MonsterView.insertRows(at: [
            IndexPath(row: model.monsters.count-1, section: 0)
            ], with: .automatic)
        MonsterView.endUpdates()
        save()
    }
    func save(){
        var currentRoster = [Int]()
        if model.monsters.count == 0 {
            UserDefaults.standard.set(currentRoster, forKey: "Saved Listmk3")
            return
        }
        for i in 0...(model.monsters.count-1){
            currentRoster.append(model.monsters[i].index)
        }
        UserDefaults.standard.set(currentRoster, forKey: "Saved Listmk3")
    }
    
    func removeMonster(index: NSIndexPath){
        MonsterView.beginUpdates()
        model.monsters.remove(at:index.row)
        MonsterView.deleteRows(at: [index as IndexPath], with: UITableViewRowAnimation.automatic)
        MonsterView.endUpdates()
        save()
    }
   
    
}
