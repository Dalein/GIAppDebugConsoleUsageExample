//
//  APIResponse.swift
//  rosneft-brands
//
//  Created by ivan.gnatyuk on 03.06.2021.
//  Copyright © 2021 Sitesoft LLC. All rights reserved.
//

import Foundation

struct APIReponse {
    let request: APIRequestProtocol
    let responseCode: Int
    let result: Result<[String: Any], NSError>
}
