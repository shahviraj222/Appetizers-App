//
//  Appetizer.swift
//  Appetizers
//
//  Created by viraj shah on 13/05/25.
//

import Foundation

struct Appetizer:Decodable,Identifiable {
    let id:Int
    let name:String
    let description:String
    let price:Double
    let imageURL:String
    let calories:Int
    let protein:Int
    let carbs:Int
}

struct AppetizerResponse:Decodable{
    let request:[Appetizer]
}

struct MockData
{
    static let sampleAppetizers = Appetizer(id:001,
                                            name:"test",
                                            description: "this is testing appetizer",
                                            price:10.99,
                                            imageURL: "sample",
                                            calories: 100,
                                            protein: 10,
                                            carbs: 100)
                             
    static let appetizeer = [sampleAppetizers,sampleAppetizers,sampleAppetizers]
}

