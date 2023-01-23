//
//  Question.swift
//  PersonalQuiz
//
//  Created by Николай Коваленко on 07.01.2023.
//

struct Question {
    let title: String
    let type: ResponceType
    let answers: [Answer]
    
}

enum ResponceType {
    case single
    case mulitple
    case range
}

struct Answer {
    let title: String
    let type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравиться быть друзьями. Вы окружате себя людьми, которые Вам нравяться и всегда готовы помочь"
        case .cat:
            return "Вы себе на умен. Вы любите гулять сами по себе. Вы любите одиночество"
        case .rabbit:
            return "вам нравиться все мягкое. Вы зворовы и полны энергии"
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях"
        }
    }
}

extension Question {
    
    static func getQuestion() -> [Question] {
        [
            Question(
                title: "Какую пищу Вы предпочитаете?",
                type: .single,
                answers: [
                    Answer(title: "Cтейк", type: .dog),
                    Answer(title: "Рыба", type: .cat),
                    Answer(title: "Морковь", type: .rabbit),
                    Answer(title: "Кукуруза", type: .turtle)
                ]
            ),
            Question(
                title: "Что Вам гравиться больше?",
                type: .mulitple,
                answers: [
                    Answer(title: "Плавать", type: .dog),
                    Answer(title: "Спать", type: .cat),
                    Answer(title: "Обниматься", type: .rabbit),
                    Answer(title: "Есть", type: .turtle)
                ]
            ),
            Question(
                title: "Любите ли Вы поездки на машине?",
                type: .range,
                answers: [
                    Answer(title: "Ненавиже", type: .cat),
                    Answer(title: "Нервничаю", type: .rabbit),
                    Answer(title: "Не замечаю", type: .turtle),
                    Answer(title: "Обожаю", type: .dog)
                ]
            ),
        ]
    }
}
