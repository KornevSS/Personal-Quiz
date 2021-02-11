//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 08.02.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    // MARK: - IB Outlets
    
    @IBOutlet var resultNavigationItem: UINavigationItem!
    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var resultAnimalDefinitionLabel: UILabel!
    
    // MARK: - Public properties
    var answers: [Answer]!
    
    
    // Передать сюда массив с ответами
    // Определить наиболее часто встречающийся тип животного
    // Отобразить результат в соответсвии с этим животным.
    // Избавиться от кнопки возврата назад на экране результатов
    
    // MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        resultNavigationItem.hidesBackButton = true
        guard let resultAnimalType = calculateMostFrequentAnimal(answer: answers) else { return }
        resultAnimalLabel.text = "Вы - \(String(resultAnimalType.rawValue))"
        resultAnimalDefinitionLabel.text = resultAnimalType.definition
    }
    
    // MARK: - Calculating the most frequental animal
    private func calculateMostFrequentAnimal(answer: [Answer]) -> AnimalType? {
        var frequentAnimals: [AnimalType] = []
        for answer in answers {
            frequentAnimals.append(answer.type)
        }
        let mostFrequentAnimal = Set(frequentAnimals.filter({ (animal: AnimalType) in frequentAnimals.filter({ $0 == animal }).count > 1}))
        return mostFrequentAnimal.first
    }
    
    
}
