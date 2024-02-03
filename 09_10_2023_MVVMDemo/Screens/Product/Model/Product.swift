//
//  Product.swift
//  09_10_2023_MVVMDemo
//
//  Created by Vishal Jagtap on 03/02/24.
//

import Foundation
struct Product : Decodable{
    let id : Int
    let title : String
    let price : Float
    let description: String
    let category : String
    let image : String
    let rating : Rating
}

struct Rating : Decodable{
    let rate : Float
    let count : Int
}
