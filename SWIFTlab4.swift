//
//  main.swift
//  lab4
//
//  Created by Aleksandra Olejarz on 11/19/23.
//

import Foundation

//zad5.3
var sum = 0
var i = 0
while (i <= 7 ) {
    
    i += 1
    if i % 2 == 0 {
      continue
    }
    sum += i
    print(i)
    
    
}
print("Suma elementow wynosi \(sum)")

print("Wprowadz liczbe ( co najmniej 3-cyfrowa): ")
var wpisana = readLine()!
//if(Int(wpisana) != nil && wpisana.count >= 3){
//var liczba = Int(wpisana)!
//var iloczyn = 1
//    while(liczba>0)
//    {
//        iloczyn*=liczba%10
//        liczba /= 10
//    }
//    let srediaGeom = pow(Double(iloczyn),1/Double(wpisana.count))
//    print(String(format:"Srednia geometryczna cyfr podanej liczby: %.2lf",srediaGeom))
//}
//else{
//    print("Wpisano niepoprawna wartosc")
//}


while(Int(wpisana)==nil || wpisana.count < 3 ){
    print("Wartosc jest nieprawidlowa. Wprowadz poprawna 3-cyfrowa liczbe: ")
    wpisana = readLine()!
    
}
if(Int(wpisana) != nil && wpisana.count >= 3)
{
    var liczba = Int(wpisana)!
    var iloczyn = 1
    while(liczba>0)
    {
        iloczyn *= liczba%10
        liczba /= 10
    }
    let sredniaGeom = pow(Double(iloczyn),1/Double(wpisana.count))
    print(String(format:"Srednia geometryczna wynosi: %.2lf",sredniaGeom))
}

//zad5.5
print("Wprowadz dlugosc ciagu(liczba calkowita): ")
var dl = readLine()!
while(Int(dl) == nil )
{
    print("Wprowadz poprawna wartosc: ")
    dl = readLine()!
}
var dlCiagu = Int(dl)!
var ciag : [Int] = []
var poprzedni = -1
for i in 1...dlCiagu
{
    
    print("Wprowadz element \(i) ciagu: ")
    var elem = readLine()!
    while(Int(elem) == nil || Int(elem)! == poprzedni ){
        print("Wprowadzono niepoprawny element. Wprowadz element \(i) ciagu: ")
             elem = readLine()!
    }
    poprzedni = Int(elem)!
    ciag.append(poprzedni)
    
}
//MAKSIMUM LOKALNE TO MIEJSCE, W KTORYM FUNKCJA ZMIENIA SIE Z ROSNACEJ W MALEJACA
//MINIMUM LOKALNE TO MIEJSCE, W KTORYM FUNKCJA ZMIENIA SIE Z MALEJACEJ W ROSNACA

var max = 0
var min = 0
for i in ciag.indices
{
    if(i+3 <= ciag.count){
        print("\n")
    for j in stride (from:i, to:i+3, by:1)
    {
        print(ciag[j],terminator: ", ")
        if(j == (i+1)) {
           if(ciag[j]>ciag[j-1] && ciag[j]>ciag[j+1] && ciag[j+1]<ciag[j-1])
            {
               max = 1
               min = 0
            }
            else if(ciag[j]<ciag[j-1] && ciag[j]<ciag[j+1])
            {
                max = 1
                min = 1
                
            }
            else if(ciag[j]>ciag[j-1] && ciag[j] < ciag[j+1])
            {
                min = 1
                max = 1
            }
            else if(ciag[j]>ciag[j-1] && ciag[j]>ciag[j+1] && ciag[j+1]>ciag[j-1])
            {
                max = 2
                min = 1
            }
            else if(ciag[j]<ciag[j-1] && ciag[j]>ciag[j+1])
            {
                max = 0
                min = 1
            }
           
    }
        if(j==i+2){print("min: \(min), max: \(max)")}
        
    }
       
    }
}
