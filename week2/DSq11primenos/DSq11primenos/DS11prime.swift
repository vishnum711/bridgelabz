//
//  main.swift
//  DSq11primenos
//
//  Created by admin on 8/28/19.
//  Copyright © 2019 bridgelabz. All rights reserved.
//

import Foundation
class Primenos{
    static func isPrimeno(_ num: Int) ->[Int]{
        var arr = [Int]()
        for i in 2..<num{
            var  k=2
            var flag=0
            while(k*k <= i){
                if(i%k == 0){
                    flag=1
                    break;
                }
                k = k+1
            }
            if(flag==0){
                arr.append(i)
            }
        }
      return arr
    }
}
var num = 1000
var arrobj = Primenos.isPrimeno(num)
//print(arrobj)
var length = arrobj.count
var twoD = Array(repeating: [Int](), count: 10)
for i in arrobj {
    if(i<100){
        twoD[0].append(i)
    }
    else if(i>100 && i<200){
        twoD[1].append(i)
    }
    else if(i>200 && i<300){
        twoD[2].append(i)
    }
    else if(i>300 && i<400){
        twoD[3].append(i)
    }
    else if(i>400 && i<500){
        twoD[4].append(i)
    }
    else if(i>500 && i<600){
        twoD[5].append(i)
    }
    else if(i>600 && i<700){
        twoD[6].append(i)
    }
    else if(i>700 && i<800){
        twoD[7].append(i)
    }
    else if(i>800 && i<900){
        twoD[8].append(i)
    }
    else if(i>900 && i<1000){
        twoD[9].append(i)
    }
    
}
for i in twoD{
print(i)
}

