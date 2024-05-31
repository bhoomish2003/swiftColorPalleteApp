//
//  ColorTableC.swift
//  RandomColor
//
//  Created by APPLE on 28/05/24.
//

import UIKit

class ColorTableC: UIViewController {
  
    var colors:[UIColor]=[]
    
    enum Cell{
        static let colorCell="ColorCell"
    }
    
    enum Segues{
        static let ToDetail="ToColorDetailVC"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
        // Do any additional setup after loading the view.
    }
 
    func addRandomColors(){
        for _ in 0..<50{
            colors.append(.random())
        }
    }
    
 
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorDetailVC
        destVC.color=sender as? UIColor
    }

}

extension ColorTableC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell=tableView.dequeueReusableCell(withIdentifier: Cell.colorCell) else {
            return UITableViewCell()
        }
        let color=colors[indexPath.row]
        cell.backgroundColor=color
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: Segues.ToDetail, sender: colors[indexPath.row])
    }
}
