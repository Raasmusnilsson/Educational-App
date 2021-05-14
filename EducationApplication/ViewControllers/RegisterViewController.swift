//
//  RegisterViewController.swift
//  EducationApplication
//
//  Created by Rasmus Nilsson on 2021-03-18.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var phoneInput: UITextField!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    override func viewDidLoad() {
        super.viewDidLoad()


       
    }
    
    
    @IBAction func registerBtn(_ sender: UIButton) {
        
        let username = usernameInput.text
        let password = passwordInput.text
        let email = emailInput.text
        let phone = Int64(phoneInput.text!) ?? 0
        let userId = getRandomNumber()
        let newUser = User(context: context)
        
        newUser.email = email
        newUser.username = username
        newUser.password = password
        newUser.phone = phone
        newUser.userId = userId
        
        try? context.save()
        dismiss(animated: true, completion: nil)
    }
    func getRandomNumber() -> Int64 {
        return Int64.random(in: 1...100000)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


}
