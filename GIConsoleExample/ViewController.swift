//
//  ViewController.swift
//  GIConsoleExample
//
//  Created by daleijn on 28.05.2021.
//

import UIKit
import GIAppDebugConsole

class ViewController: UIViewController {
    let vmFormatter = APIItemsAttributedStringFormatter(defaultLogAttributes: [
        .foregroundColor: UIColor.white,
        .font: UIFont.systemFont(ofSize: 13, weight: .regular)
    ])
    
    
    let requests: [APIRequest] = [
        
        .init(api: "/instance/services/logs",
              host: "test.com",
              method: "POST",
              params: ["foo": "bar",
                       "1": 3]),
        
        .init(api: "news/10345", host: "test.com", method: "GET"),
        
        .init(api: "/instance/services/logs/8015", host: "test.com", method: "DELETE"),
        
        .init(api: "api/auth", host: "test.com", method: "POST")
    ]
    
    
    lazy var responses: [APIReponse] = [
        
        .init(request: requests[0], responseCode: 200, result: .success([
            "environment": "dev",
            "log_type": "AppCluster",
            "start_time": "2019-08-16T13:17:22.421Z",
            "duration": 10,
            "min_log_level": "all"
        ])),
        
        .init(request: requests[1],
              responseCode: 403,
              result: .failure(NSError(domain: "", code: 403, userInfo: nil))),
        
        .init(request: requests[2],
              responseCode: 301,
              result: .success([
                "is_dev": "1",
                "version": "18",
                "error_code": 0,
                "error_name": "Успешно",
                "authed_user_data": [
                    "token": "249188_sjhwxforQwADrDfOvvVF",
                    "card_num": "7005991*****3227"
                ]
              ])),
        
        .init(request: requests[3],
              responseCode: 500,
              result: .failure(NSError(domain: "", code: 8087, userInfo: nil)))
    ]
    
    
    // MARK: - VC lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requests.forEach { request in
            GIAppDebugConsole.shared.logAttributed(vmFormatter.attributedDescription(of: request))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            self.responses.forEach { response in
                GIAppDebugConsole.shared.logAttributed(self.vmFormatter.attributedDescription(of: response))
            }
            
        }
    }
    
    
    // MARK: - IBActions
    
    @IBAction func showConsoleButtonDidTap(_ sender: Any) {
        GIAppDebugConsole.shared.show()
    }
    
    @IBAction func hideConsoleButtonDidTap(_ sender: Any) {
        GIAppDebugConsole.shared.hide()
    }
    
    @IBAction func showModalVC(_ sender: Any) {
        let vc = UIViewController()
        vc.view.backgroundColor = .groupTableViewBackground
        
        self.present(vc, animated: true, completion: {
            let log = """
            GET /instance/services/logs/8015/file
            
            200 | /instance/services/logs/8015/file
            """
            GIAppDebugConsole.shared.log(log)
        })
        
    }
    
}

