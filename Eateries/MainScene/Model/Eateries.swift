//
//  Eateries.swift
//  Eateries
//
//  Created by Дмитрий Федоринов on 19/03/2019.
//  Copyright © 2019 DmitryFedorinov. All rights reserved.
//

import Foundation

struct Eatery {
    let name: String
    let imageName: String
    var isVisited: Bool = false
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
    static func getAllEateries() -> [Eatery] {
        let restaurantNames = ["Ogonёk Grill&Bar",
                               "Елу",
                               "Bonsai",
                               "Дастархан",
                               "Индокитай",
                               "X.O",
                               "Балкан Гриль",
                               "Respublica",
                               "Speak Easy",
                               "Morris Pub",
                               "Вкусные истории",
                               "Классик",
                               "Love&Life",
                               "Шок",
                               "Бочка"]
        
        let restaurantImages = ["ogonek.jpg",
                                "elu.jpg",
                                "bonsai.jpg",
                                "dastarhan.jpg",
                                "indokitay.jpg",
                                "x.o.jpg",
                                "balkan.jpg",
                                "respublika.jpg",
                                "speakeasy.jpg",
                                "morris.jpg",
                                "istorii.jpg",
                                "klassik.jpg",
                                "love.jpg",
                                "shok.jpg",
                                "bochka.jpg"]
        var array = [Eatery]()
        for str in 0...restaurantNames.count - 1 {
            array.append(Eatery(name: restaurantNames[str],
                                imageName: restaurantImages[str]))
        }
        return array
    }
    
}
