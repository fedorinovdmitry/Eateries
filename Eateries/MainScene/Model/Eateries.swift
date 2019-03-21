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
    
    enum LocationCity: String {
        case ufa = "Уфа"
    }
    
    let name: String
    let type: EateryType
    let location: LocationCity
    let imageName: String
    var isVisited: Bool = false
    
    init(name: String, type: EateryType, location: LocationCity, imageName: String) {
        self.name = name
        self.type = type
        self.location = location
        self.imageName = imageName
    }
    
    static func getAllEateries() -> [Eatery] {
        
        let arr: [Eatery] = [
            Eatery(name: "Ogonёk Grill&Bar", type: .eatery, location: .ufa, imageName: "ogonek.jpg"),
            Eatery(name: "Елу", type: .eatery, location: .ufa, imageName: "elu.jpg"),
            Eatery(name: "Bonsai", type: .eatery, location: .ufa, imageName: "bonsai.jpg"),
            Eatery(name: "Дастархан", type: .eatery, location: .ufa, imageName: "dastarhan.jpg"),
            Eatery(name: "Индокитай", type: .eatery, location: .ufa, imageName: "indokitay.jpg"),
            Eatery(name: "X.O", type: .eateryClub, location: .ufa, imageName: "x.o.jpg"),
            Eatery(name: "Балкан Гриль", type: .eatery, location: .ufa, imageName: "balkan.jpg"),
            Eatery(name: "Respublica", type: .eatery, location: .ufa, imageName: "respublika.jpg"),
            Eatery(name: "Speak Easy", type: .eateryComplex, location: .ufa, imageName: "speakeasy.jpg"),
            Eatery(name: "Morris Pub", type: .eatery, location: .ufa, imageName: "morris.jpg"),
            Eatery(name: "Вкусные истории", type: .eatery, location: .ufa, imageName: "istorii.jpg"),
            Eatery(name: "Классик", type: .eatery, location: .ufa, imageName: "klassik.jpg"),
            Eatery(name: "Love&Life", type: .eatery, location: .ufa, imageName: "love.jpg"),
            Eatery(name: "Шок", type: .eatery, location: .ufa, imageName: "shok.jpg"),
            Eatery(name: "Бочка", type: .eatery, location: .ufa, imageName: "bochka.jpg")
        ]
        
        return arr
    }
    
}
