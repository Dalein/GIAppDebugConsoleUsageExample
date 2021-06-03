//
//  APIItemsAttributedStringFormatter.swift
//  GIAppdebugConsoleDeveloping
//
//  Created by ivan.gnatyuk on 02.06.2021.
//

import UIKit

class APIItemsAttributedStringFormatter {
    let defaultLogAttributes: [NSAttributedString.Key: Any]
    
    
    // MARK: - Init
    
    init(defaultLogAttributes: [NSAttributedString.Key: Any]) {
        self.defaultLogAttributes = defaultLogAttributes
    }
    
    
    // MARK: - API
    
    func attributedDescription(of request: APIRequestProtocol) -> NSAttributedString {
        let log: String = {
            var log = "\(request.method) | \(request.api)"
            if let params = request.params {
                log.append("\nparams: \(params)")
            }
            
            return log
        }()
        
        let attributedLog = NSMutableAttributedString(string: log,
                                                      attributes: defaultLogAttributes)
        attributedLog.addAttribute(.underlineStyle,
                                   value: NSNumber(value: NSUnderlineStyle.single.rawValue),
                                   range: (log as NSString).range(of: request.api))
        
        if let params = request.params {
            attributedLog.addAttribute(.font,
                                       value: UIFont.systemFont(ofSize: 13, weight: .bold),
                                       range: (log as NSString).range(of: "\(params)"))
        }
        
        return attributedLog
    }
    
    
    func attributedDescription(of response: APIResponseProtocol) -> NSAttributedString {
        let responseCode = "\(response.responseCode)"
        
        let reponseResultType: String = {
            switch response.result {
            case .success(_):
                return "json"
            case .failure(_):
                return "error"
            }
        }()
        
        let resposnseResult: String = {
            switch response.result {
            case .success(let json):
                return "\(json)"
            case .failure(let error):
                return error.localizedDescription
            }
        }()
        
        let responseResult = "\(reponseResultType): \(resposnseResult)"
        
        
        let log = "\(responseCode) | \(response.request.api)\n\(responseResult)"
        
        let attributedLog = NSMutableAttributedString(string: log,
                                                      attributes: defaultLogAttributes)
        
        
        let responseCodeColor = responseCodeColor(by: response.responseCode)
        
        attributedLog.addAttributes([.foregroundColor: responseCodeColor,
                                     .font: UIFont.systemFont(ofSize: 13, weight: .bold)],
                                    range: (log as NSString).range(of: responseCode))
        
        attributedLog.addAttribute(.underlineStyle,
                                   value: NSNumber(value: NSUnderlineStyle.single.rawValue),
                                   range: (log as NSString).range(of: response.request.api))
        
        attributedLog.addAttribute(.font,
                                   value: UIFont.systemFont(ofSize: 13, weight: .bold),
                                   range: (log as NSString).range(of: "\(resposnseResult)"))
        
        return attributedLog
    }
    
}


private extension APIItemsAttributedStringFormatter {
    
    func responseCodeColor(by resposneCode: Int) -> UIColor {
        switch resposneCode {
        case 100..<200:
            return .white
        case 200..<300:
            return .systemGreen
        case 300..<400:
            return .systemBlue
        case 400..<500:
            return .systemYellow
        case ..<0, 500..<600:
            return .systemRed
        default:
            return .white
        }
    }
    
}
