//
//  DataManger.swift
//  HW13_PhotoScreen
//
//  Created by mac on 13.06.22.
//

import UIKit

class DataManger {
    
    static let shared = DataManger()
    
    func createModels() -> [[Item]] {
        return [
            [Item(text: "Недавние", image: UIImage(named: "house"), number: 3154),
             Item(text: "Избранное", image: UIImage(named: "cat"), number: 26),
             Item(text: "Documents", image: UIImage(named: "Documents"), number: 11),
             Item(text: "WhatsApp", image: UIImage(named: "flowers"), number: 1208),
             Item(text: "Lightroom", image: UIImage(named: "dog"), number: 67),
             Item(text: "Рецепты", image: UIImage(named: "recipes"), number: 34),
             Item(text: "Instagram", image: UIImage(named: "sea"), number: 104),
             Item(text: "VSCO", image: UIImage(named: "bicycle"), number: 89),],
            
            [Item(text: "Horses", image: UIImage(named: "horse"), number: 34),
             Item(text: "Зима", image: UIImage(named: "winter"), number: 22),
             Item(text: "Travel", image: UIImage(named: "travel"), number: 66),
             Item(text: "Deutsch", image: UIImage(named: "deutsch"), number: 103),],
          
            [Item(text: "Видео",
                  image: UIImage(systemName: "video")?
                .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                  number: 679),
             Item(text: "Селфи",
                   image: UIImage(systemName: "person.crop.square")?
                 .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                   number: 29),
             Item(text: "Фото Live Photos",
                   image: UIImage(systemName: "livephoto")?
                 .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                   number: 497),
             Item(text: "Портреты",
                   image: UIImage(systemName: "cube")?
                 .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                   number: 311),
             Item(text: "Панорамы",
                   image: UIImage(systemName: "pano")?
                 .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                   number: 7),
             Item(text: "Серии",
                   image: UIImage(systemName: "square.stack.3d.down.right")?
                 .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                   number: 5),
             Item(text: "Снимки экрана",
                   image: UIImage(systemName: "camera.viewfinder")?
                 .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                   number: 690),
             Item(text: "Анимированные",
                   image: UIImage(systemName: "square.stack.3d.forward.dottedline")?
                 .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                   number: 4),],
            
            [Item(text: "Импортированные",
                  image: UIImage(systemName: "square.and.arrow.down")?
                .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                  number: 0),
             Item(text: "Скрытые",
                   image: UIImage(systemName: "eye.slash")?
                 .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                   number: 57),
             Item(text: "Недавно удаленные",
                   image: UIImage(systemName: "trash")?
                 .withTintColor(.systemBlue, renderingMode: .alwaysOriginal),
                   number: 2),],
        ]
    }
}
