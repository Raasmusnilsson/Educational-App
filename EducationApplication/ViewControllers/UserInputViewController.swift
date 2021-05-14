//
//  UserInputViewController.swift
//  EducationApplication
//
//  Created by Rasmus Nilsson on 2021-03-18.
//

import UIKit

class UserInputViewController: UIViewController {

    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var users : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsers()
        
    }
    func setupAlert(Message: String) {
        let alert = UIAlertController(title: Message, message: "", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
 
    func loadUsers() {
        users = try! context.fetch(User.fetchRequest()) as! [User]
        for a in users {
            print("Username:\(String(describing: a.username))Password:\(String(describing: a.password))")
        }
    }
    
    @IBAction func registerBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "registerSegue", sender: nil)
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        let username = usernameInput.text
        let password = passwordInput.text
        
        for user in users {
            
            if user.username == username && user.password == password {
                print("Du är inloggad")
                setupAlert(Message: "Du är nu inloggad")
                DataManager.sharedInstance.currentUser = user
                
                usernameInput.text = ""
                passwordInput.text = ""
                return
                
            } else {
                setupAlert(Message: "Fel Användarnamn / Lösenord")
            }
        }
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }


}
