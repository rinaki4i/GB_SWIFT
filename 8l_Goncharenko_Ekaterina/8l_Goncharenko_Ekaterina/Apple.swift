//
//  Apple.swift
//  8l_Goncharenko_Ekaterina
//
//  Created by user on 27.07.2020.
//  Copyright © 2020 EG. All rights reserved.
//


import UIKit
import SpriteKit
// Яблоко
class Apple: SKShapeNode {
    // определяем, как оно будет отрисовываться
    convenience init(position: CGPoint) {
        self.init()
        // рисуем круг
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
        // заливаем красным
        fillColor = UIColor.red
        // рамка тоже красная
        strokeColor = UIColor.red
        // ширина рамки 5 поинтов
        lineWidth = 5
        self.position = position
        // Добавляем физическое тело, совпадающее с изображением яблока
        self.physicsBody = SKPhysicsBody(circleOfRadius: 10.0, center:CGPoint(x:5, y:5))
        // Категория - яблоко
        self.physicsBody?.categoryBitMask = CollisionCategories.Apple
    }
}
