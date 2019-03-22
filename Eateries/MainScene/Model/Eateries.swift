//
//  Eateries.swift
//  Eateries
//
//  Created by Дмитрий Федоринов on 19/03/2019.
//  Copyright © 2019 DmitryFedorinov. All rights reserved.
//

import Foundation

struct Eatery {
    
    enum EateryType: String {
        case eatery = "ресторан"
        case eateryClub = "ресторан-клуб"
        case eateryComplex = "ресторан комплекс"
    }
    
    let name: String
    let type: EateryType
    let location: String
    let imageName: String
    var isVisited: Bool = false
    
    init(name: String, type: EateryType, location: String, imageName: String) {
        self.name = name
        self.type = type
        self.location = location
        self.imageName = imageName
    }
    
    static func getAllEateries() -> [Eatery] {
        
        let arr: [Eatery] = [
            Eatery(name: "Ogonёk Grill&Bar", type: .eatery, location: "Уфа, бульвар Хадии Давлетшиной 21, вход со стороны улицы", imageName: "ogonek.jpg"),
            Eatery(name: "Елу", type: .eatery, location: "Уфа", imageName: "elu.jpg"),
            Eatery(name: "Bonsai", type: .eatery, location: "Уфа", imageName: "bonsai.jpg"),
            Eatery(name: "Дастархан", type: .eatery, location: "Уфа", imageName: "dastarhan.jpg"),
            Eatery(name: "Индокитай", type: .eatery, location: "Уфа", imageName: "indokitay.jpg"),
            Eatery(name: "X.O", type: .eateryClub, location: "Уфа", imageName: "x.o.jpg"),
            Eatery(name: "Балкан Гриль", type: .eatery, location: "Уфа", imageName: "balkan.jpg"),
            Eatery(name: "Respublica", type: .eatery, location: "Уфа", imageName: "respublika.jpg"),
            Eatery(name: "Speak Easy", type: .eateryComplex, location: "Уфа", imageName: "speakeasy.jpg"),
            Eatery(name: "Morris Pub", type: .eatery, location: "Уфа", imageName: "morris.jpg"),
            Eatery(name: "Вкусные истории", type: .eatery, location: "Уфа", imageName: "istorii.jpg"),
            Eatery(name: "Классик", type: .eatery, location: "Уфа", imageName: "klassik.jpg"),
            Eatery(name: "Love&Life", type: .eatery, location: "Уфа", imageName: "love.jpg"),
            Eatery(name: "Шок", type: .eatery, location: "Уфа", imageName: "shok.jpg"),
            Eatery(name: "Бочка", type: .eatery, location: "Уфа", imageName: "bochka.jpg")
        ]
        
        return arr
    }
    
}
