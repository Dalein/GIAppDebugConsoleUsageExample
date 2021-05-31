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
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vel gravida ante, ultricies commodo urna. Quisque lectus turpis, maximus vel efficitur et, hendrerit ut tellus. Curabitur sit amet quam sodales, pharetra nibh ut, imperdiet quam. Donec scelerisque eu tellus et gravida. Sed sit amet sodales ex. Donec consectetur odio vel interdum ultricies. Sed faucibus consequat neque vitae volutpat. Sed sagittis eros a nisl posuere vehicula consequat a magna. Duis erat felis, cursus et porttitor ut, fermentum nec quam. Aliquam tellus nulla, ultricies at rhoncus a, iaculis sit amet est. In fermentum nisi augue. Praesent molestie ullamcorper diam a congue. Etiam eget fringilla orci, eget consequat justo.

        Ut quis elit quis mauris tristique porta. Nulla tincidunt velit nisi, vel venenatis turpis pharetra in. Suspendisse mi justo, tristique non erat quis, bibendum maximus lectus. Phasellus in nibh elit. Pellentesque ut justo luctus, bibendum augue non, aliquam est. Aliquam erat volutpat. Nullam vitae purus at diam vulputate pharetra. Ut faucibus dapibus cursus. Aliquam quis laoreet enim, et euismod est.

        Nulla vel ex sagittis, malesuada purus eu, porta metus. Maecenas felis lacus, varius vitae risus ac, fringilla porta odio. Quisque non augue vel orci lacinia congue. Phasellus varius felis ullamcorper, sollicitudin sapien ut, mollis velit. Praesent nec lacus sed massa blandit rhoncus nec sit amet turpis. Ut leo lorem, vehicula sit amet interdum id, semper sit amet enim. Pellentesque maximus tortor eu facilisis posuere. Nam commodo condimentum justo, ut tristique orci gravida non. Donec id nunc lacus. Sed lobortis diam et rutrum blandit. Nullam sed imperdiet nisi, in volutpat tellus. Aliquam faucibus vulputate felis sit amet finibus. Praesent elementum rutrum nibh, non consectetur ipsum facilisis ut. Nullam rutrum in risus sed sollicitudin.

        Praesent in rutrum lacus. Nullam scelerisque odio id orci ornare, et lacinia magna tincidunt. Curabitur ornare non odio et pellentesque. Fusce scelerisque, mauris ut volutpat luctus, ex odio pulvinar turpis, sit amet rutrum felis nisl ac nisl. Cras dapibus interdum quam, sed lobortis magna tempus in. Phasellus tincidunt, felis eget consectetur semper, quam magna tempor ipsum, id sodales dui massa laoreet neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit.

        Nulla elit sapien, varius id tincidunt pharetra, faucibus sed urna. Aenean nec volutpat erat. Praesent nec erat id nisl suscipit dictum vel non risus. Aenean condimentum purus vitae eleifend dictum. In hendrerit, est sit amet commodo laoreet, mi sapien viverra purus, sit amet iaculis metus lectus eget ante. Ut interdum lacus vel maximus sagittis. Integer rutrum, urna et vulputate condimentum, magna nunc hendrerit quam, condimentum cursus ante arcu et orci. Morbi tellus orci, finibus at metus sit amet, ultricies bibendum dolor. Etiam erat metus, malesuada id ex nec, cursus posuere arcu. Suspendisse potenti. Aliquam sagittis arcu erat, sed interdum magna pharetra id. Sed dapibus, est eu aliquet bibendum, elit nisi pellentesque velit, eu feugiat ante velit non justo.
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
        vc.view.backgroundColor = .green
        
        self.present(vc, animated: true, completion: nil)
    }
    
}

