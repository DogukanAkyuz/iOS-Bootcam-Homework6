//
//  Urunler.swift
//  UrunlerApp
//
//  Created by Kadirhan Keles on 24.09.2023.
//

import Foundation

class Urunler {
    var id: Int?
    var ad: String?
    var resim: String?
    var izleyici: Double?
    
    init(id: Int, ad: String, resim: String, izleyici: Double) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.izleyici = izleyici
    }
}
