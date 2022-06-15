//
//  HomeViewController.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-11-30.
//

import UIKit

class HomeViewController: UIViewController {
    
    let Preparegamecontroller = 1

    @IBOutlet weak var pvpButton: UIButton!
    @IBOutlet weak var pvcButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        pvcButton.isSelected = true
        pvpButton.isSelected = true
    }
    var pvpon = true
    
    @IBAction func PVPBtnpush(_ sender: Any) {
        pvpon = true
        performSegue(withIdentifier: "Rungamesettings", sender: self)
    }
    @IBAction func PVCBtnpush(_ sender: Any) {
        pvpon = false
        performSegue(withIdentifier: "Rungamesettings", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Rungamesettings" {
            let PVCCtrl = segue.destination as! GamesettingsVC
            PVCCtrl.pvp = pvpon
        }
    }
}
