//
//  FibonacciHelper.swift
//  PrefetchingImages
//
//  Created by Luis Henrique Grassi on 11/07/17.
//  Copyright © 2017 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

class FibonacciHelper: NSObject {
    
    //https://gist.github.com/getaaron/939e27ff62bd99aba788aae8c3f5fcbc
    
    var cache = [Int:Int]()
    
    func fibonacci(_ index: Int) -> Int {
      
        guard index > 1 else { return 1 }
        
        if let cachedResult = cache[index] {
            return cachedResult
        }
        
        print("calculating f(\(index))")
        
        let n1 = fibonacci(index - 1)
        let n2 = fibonacci(index - 2)
        let result = n1 + n2
        
        cache[index] = result
        
        return result
    }
    
}
