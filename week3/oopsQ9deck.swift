//
//  main.swift
//  deck
//
//  Created by admin on 9/5/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class deck{
    func decks(_ num: Int) ->String{
       var spade = ["2","3","4","5","6","7","8","9","10","jack","queen","king","ace"]
        var diamond = ["2","3","4","5","6","7","8","9","10","jack","queen","king","ace"]
        var hearts = ["2","3","4","5","6","7","8","9","10","jack","queen","king","ace"]
        var club = ["2","3","4","5","6","7","8","9","10","jack","queen","king","ace"]
        var type = num/13
        var itr = num%13
        var str = "hi"
        switch type{
        case 0:
            str = String(spade[itr])
            str.append("S")
        case 1:
            str = diamond[itr]
            str.append("D")
        case 2:
            str = hearts[itr]
            str.append("H")
        case 3:
            str = club[itr]
            str.append("C")
        default:
            str = "1"
        }
        return str
    }
}
class main{
    func distribute(){
    var player = [String]()
        var bool = true
    var checkarr = Array(repeating: false, count: 53)
        while bool {
    var random = Int.random(in: 1...52)
            if(checkarr[random] == false){
                checkarr[random] = true
                var deckparse = deck()
                var card = deckparse.decks(random)
                player.append(card)
            }
            if(player.count == 36){
                break
            }
        }
        
    var playerarr = Array(repeating: Array(repeating: " ", count: 9), count: 4)
        var itr  = 0
        for i in 0...3{
            for j in 0...8{
                playerarr[i][j] = player[itr]
                itr = itr+1
            }
        }
        for i in playerarr{
        print(i)
        }
    }
}

var call = main()
call.distribute()



//func random() ->(Int,Int){
//    var random2 = Int.random(in: 0...12)
//    var random1 = Int.random(in: 0...3)
//    return (random1,random2)
//}
//
//print("Hello, World!")
//var deckOfCard = Array(repeating: ["2","3","4","5","6","7","8","9","10","jack","queen","king","ace"], count: 4)
//var checkarr = Array(repeating: Array(repeating: false, count: 13), count: 4)
//var playerarr = [String]()
//var count = 1
//while(count<=36){
//    var randomNo = random()
//    if(checkarr[randomNo.0][randomNo.1] == false){
//        checkarr[randomNo.0][randomNo.1] = true
//      playerarr.append(deckOfCard[randomNo.0][randomNo.1])
//        count = count+1
//    }
//}


