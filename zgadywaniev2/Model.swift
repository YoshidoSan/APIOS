//
//  Model.swift
//  zgadywaniev2
//
//  Created by apios on 03/04/2023.
//
import Foundation
import Cocoa
class Model{
    
    var rozmiar: Int
    var password: [Int]
    
    init(){
        self.rozmiar = 5
        var haslo = [Int](repeating: 0, count: rozmiar)
        for i in stride(from: 0, to: rozmiar, by: 1){
            haslo[i] = Int.random(in: 0...9)
        }
        self.password = haslo
    }

    //dostaje wpisane prez gracza i porownuje z haslem - zwraca jakie kolorki
    func porownanie(_ letters: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: password.count)
        for i in stride(from: 0, to: password.count, by: 1){
            if letters[i] == password[i]{
                result[i] = 1
            }
            else{
                for j in stride(from: 0, to: password.count, by: 1){
                    if letters[i] == password[j]{
                        result[i] = -1
                    }
                }
            }
        }
        return result
    }
    
    //generuje randomowe haslo
    func generuj_haslo(_ size: Int) -> [Int] {
        var haslo = [Int](repeating: 0, count: size)
        for i in stride(from: 0, to: size, by: 1){
            haslo[i] = Int.random(in: 0...9)
        }
        return haslo
    }
    
    //sprawdza czy pora skonczyc gre
    func czy_nowe(_ result: [Int]) -> Bool {
        var count = 0
        for i in stride(from: 0, to: result.count, by: 1){
            if result[i] == 1{
                count += 1
            }
        }
        if count == result.count{
            return true
        }
        else{
            return false
        }
    }
    
    

}
