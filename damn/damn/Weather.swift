//
//  Weather.swift
//  damn
//
//  Created by 劉 家寯 on 5/31/16.
//  Copyright © 2016 劉 家寯. All rights reserved.
//

import Foundation

struct Weather {
    
    let Cityname:String
    let temp: Double
    let Description: String
    
    init(Cityname:String, temp:Double, Description: String){
        
        self.Cityname = Cityname
        self.temp = temp
        self.Description = Description
    }
    
}