//: Playground - noun: a place where people can play

import UIKit

struct Card {
    var color: String
    var roll: Int
}

class Deck {
    var cards:[Card] = []
    init() {
        for _ in 1...10 {
            let card = Card(color: "Blue", roll: Int(arc4random_uniform(2)+1))
            cards.append(card)

        }
        for _ in 1...10 {
            let card = Card(color: "Red", roll: Int(arc4random_uniform(2)+3))
            cards.append(card)
        }
        for _ in 1...10 {
            let card = Card(color: "Green", roll: Int(arc4random_uniform(3)+4))
            cards.append(card)
        }
    }
    func removeTop()->Card{
        let top = cards.count - 1
        let temp = cards[top]
        cards.remove(at: top)
        print(temp)
        return temp
    }
    
    func isEmpty()->Bool{
        if cards.count == 0 {
            return true
        }
        else {
            return false
        }
    }
    
    func shuffle()->Any{
        for _ in 1...30 {
            let randomNumber1 = Int(arc4random_uniform(UInt32(cards.count-1)))
            let randomNumber2 = Int(arc4random_uniform(UInt32(cards.count-1)))
            let temp = cards[randomNumber1]
            cards[randomNumber1] = cards[randomNumber2]
            cards[randomNumber2] = temp
        }
        return deck.cards
    }
}
var deck = Deck()


print(deck.removeTop())
print(deck.isEmpty())
print(deck.shuffle())
print(deck.cards)

class Player {
    var name: String
    var hand:[Card]=[]
    init(name: String){
        self.name = name
    }
    func draw(deck: Deck) -> Card {
        let draw_card = deck.removeTop()
        self.hand.append(draw_card)
        return draw_card
    }
    func rolldice() -> Int {
        let diceroll: Int = Int(arc4random_uniform(5) + 1)
        return diceroll
    }

    func matchingCards(roll: Int, color: String) -> Int {
        var count: Int = 0
        for i in hand {
            if (roll == i.roll && color == i.color){
                count += 1
            }
        }
        print(count)
        return(count)
    }
}

var player = Player(name:"Jay")
print(player.draw(deck: deck))
print(player.rolldice())
print(player.matchingCards(roll:5, color:"Green"))
