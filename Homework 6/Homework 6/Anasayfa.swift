//
//  ViewController.swift
//  UrunlerApp
//
//  Created by Kadirhan Keles on 24.09.2023.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var urunlerTableView: UITableView!
    
    var oyunlarListesi = [Oyunlar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urunlerTableView.dataSource = self
        urunlerTableView.delegate = self
        urunlerTableView.separatorColor = UIColor.clear
        
        veriGirisi()
    }

    func veriGirisi() {
        let u1 = Oyunlar(id: 1 , ad: "Sadece Sohbet", resim : "indir",izleyici: 271.4)
        let u2 = Oyunlar(id: 2 , ad: "Counter Strike", resim : "cs",izleyici: 89)
        let u3 = Oyunlar(id: 3 , ad: "EA Sports FC 24", resim : "fifa",izleyici: 61.1)
        let u4 = Oyunlar(id: 4 , ad: "Codenames", resim : "codenames",izleyici: 1.2)
        let u5 = Oyunlar(id: 5 , ad: "PUBG: BATTLEGROUNDS", resim : "pubg",izleyici: 8.3)
        let u6 = Oyunlar(id: 6 , ad: "League of Legends", resim : "lol",izleyici: 47.2)
        let u7 = Oyunlar(id: 7 , ad: "VALORANT", resim : "valo",izleyici: 25.4)
        oyunlarListesi.append(u1)
        oyunlarListesi.append(u2)
        oyunlarListesi.append(u3)
        oyunlarListesi.append(u4)
        oyunlarListesi.append(u5)
        oyunlarListesi.append(u6)
        oyunlarListesi.append(u7)
    }
    

}
//MARK: - UITableViewDelegate & UITableViewDataSource
extension Anasayfa: UITableViewDelegate, UITableViewDataSource, HucreProtocol {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oyunlarListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! Oyunlar
        let urun = oyunlarListesi[indexPath.row]
        hucre.urunImageView.image = UIImage(named: urun.resim!)
        hucre.labelUrunAd.text = urun.ad
        hucre.labelUrunFiyat.text = "\(urun.izleyici!)bin izleyici"
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.arkaPlan.layer.cornerRadius = 10
        hucre.selectionStyle = .none
        hucre.indexPath = indexPath
        hucre.hucreProtocol = self
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let urun = oyunlarListesi[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { ca, v, b in
            print("\(urun.ad!) silindi")
        }
        
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle") { ca, v, b in
            print("\(urun.ad!) düzenlendi")
        }
        
        return UISwipeActionsConfiguration(actions: [silAction, duzenleAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urun = oyunlarListesi[indexPath.row]
        
        performSegue(withIdentifier: "toDetay", sender: urun)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let urun = sender as? Oyunlar {
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.urun = urun
            }
        }
    }
    
    func sepeteEkleTiklandi(indexPath: IndexPath) {
        let urun = oyunlarListesi[indexPath.row]
        print("Anasayfadan Sepete eklendi : \(urun.ad!) ")
    }
    
}

