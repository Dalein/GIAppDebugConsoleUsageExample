//
//  Request.swift
//  rosneft-brands
//
//  Created by ivan.gnatyuk on 19.03.2021.
//  Copyright © 2021 Sitesoft LLC. All rights reserved.
//

import Foundation

final class APIRequest {
    let api: String
    let host: String
    let method: String
    let params: [String: Any]?
    var completion: ((Result<[String: Any], NSError>)->())? = nil
    
    
    // MARK: - Init
    
    init(api: String, host: String,
         method: String,
         params: [String: Any]? = nil,
         completion: ((Result<[String: Any], NSError>)->())? = nil)
    {
        self.api = api
        self.host = host
        self.method = method
        self.params = params
        self.completion = completion
    }
    
    deinit {
        print("Request on \(api) deinited")
    }
    
}


extension APIRequest {
    var fullApi: String {
        host + api
    }
}
