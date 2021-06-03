//
//  APIItemsProtocols.swift
//  GIAppdebugConsoleDeveloping
//
//  Created by ivan.gnatyuk on 02.06.2021.
//

import Foundation

/// Interface describes api request object
protocol APIRequestProtocol {
    var api: String { get }
    var params: [String: Any]? { get }
    var method: String { get }
}


/// Interface describes api response object
protocol APIResponseProtocol {
    var request: APIRequestProtocol { get }
    var responseCode: Int { get }
    var result: Result<[String: Any], NSError> { get }
}
