//
//  ViewController.swift
//  GIConsoleExample
//
//  Created by daleijn on 28.05.2021.
//

import UIKit
import GIAppDebugConsole

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let log = """
        200 | POST /instance/services/logs
            ...
            {
              "environment": "dev",
              "log_type": "AppCluster",
              "start_time": "2019-08-16T13:17:22.421Z",
              "duration": 10,
              "min_log_level": "all"
            }
        
        
        200 | GET /instance/services/logs/8015/file
        
        301 | DELETE /instance/services/logs/8015
        
        
        curl -X GET 'https://my.api.swiftype.com/api/as/v1/engines/test/logs/api' \
        -H 'Content-Type: application/json' \
        -H 'Authorization: Bearer hd57ehjkuydwcvb9545'
        
        Response:
        {
          "results": [
            {
              "timestamp": 15974335,
              "http_method": GET,
              "path": as/v1/engines/test/logs,
              "full_request_path": my.api.swiftype.com/api/as/v1/engines/test/logs/api,
              "status": OK,
              "user_agent": iOS
            }
          ],
          "meta": {
            "query": string,
            "filters": {
              "date": {
                "from": string,
                "to": string
              }
            },
            "page": {
              "current": number,
              "total_pages": number,
              "total_results": number,
              "size": number
            }
          }
        }
        
        """
        
        GIAppDebugConsole.shared.log(log)
    }
    
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

