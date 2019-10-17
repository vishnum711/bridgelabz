//
//  main.swift
//  deckQ9_10
//
//  Created by admin on 9/6/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class deck{
    func decks(_ num: Int) ->String{
        var cards = ["2","3","4","5","6","7","8","9","10","jack","queen","king","ace"]
        var type = num/13
        var itr = num%13
        var str = "hi"
        switch type{
        case 0:
            str = String(cards[itr])
            str.append("S")
        case 1:
            str = cards[itr]
            str.append("D")
        case 2:
            str = cards[itr]
            str.append("H")
        case 3:
            str = cards[itr]
            str.append("C")
        default:
            str = "1"
        }
        return str
    }
}
class main{
    func players() ->([String],[String],[String],[String]){
        var p1 = [String]()
        var p2 = [String]()
        var p3 = [String]()
        var p4 = [String]()
        var playerarr = Array(repeating: [String](), count: 4)
        var distribution = player()
        for i in 0...3{
            var cardsDistribution = distribution.distribute()
            playerarr[i] = cardsDistribution
        }
        p1 = playerarr[0]
        p2 = playerarr[1]
        p3 = playerarr[2]
        p4 = playerarr[3]
        return (p1,p2,p3,p4)
}
}


class player{
    func distribute() ->[String]{
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
            if(player.count == 9){
                break
            }
          
        }
          return player
    }
}



class sort{
    func issort(_ arr: [String]) ->[String]{
var str2 = arr
var str3 = [String]()
var str10 = [String]()
var strJ = [String]()
var strK = [String]()
var strQ = [String]()
var strA = [String]()

for i in 0..<str2.count
{
    if (!str2[i].hasPrefix("10") && !str2[i].hasPrefix("q") && !str2[i].hasPrefix("a") && !str2[i].hasPrefix("k") && !str2[i].hasPrefix("j"))
    {
        str3.append(str2[i])
        str3.sort()
    }
    if(str2[i].hasPrefix("10"))
    {
        str10.append(str2[i])
    }
    if(str2[i].hasPrefix("j"))
    {
        strJ.append(str2[i])
    }
    if(str2[i].hasPrefix("q"))
    {
        strQ.append(str2[i])
    }
    if(str2[i].hasPrefix("k"))
    {
        strK.append(str2[i])
    }
    if(str2[i].hasPrefix("a"))
    {
        strA.append(str2[i])
    }
    
    
}
var strfinl = str3+str10+strJ+strQ+strK+strA
return(strfinl)
    }
}

var call = main()
var plyrs = call.players()
var Sort = sort()
var p1sort = Sort.issort(plyrs.0)
var p2sort = Sort.issort(plyrs.1)
var p3sort = Sort.issort(plyrs.2)
var p4sort = Sort.issort(plyrs.3)
//print(plyrs.0)
print(p1sort)
print(p2sort)
print(p3sort)
print(p4sort)
