//
//  DetaySayfa.swift
//  UrunlerApp
//
//  Created by Kadirhan Keles on 24.09.2023.
//

import UIKit

class DetaySayfa: UIViewController {

    @IBOutlet weak var ImageViewUrun: UIImageView!
    @IBOutlet weak var labelUrunFiyat: UILabel!
    
    var urun: Urunler?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let u = urun {
            self.navigationItem.title = u.ad
            ImageViewUrun.image = UIImage(named: u.resim!)
            labelUrunFiyat.text = "\(u.izleyici!) ₺"
        }
        
    }
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        if let u = urun {
            print("Detay Sayfa : \(u.ad!) sepete eklendi.")
        }
    }
    

}
