//
//  DetailViewController.swift
//  EducationApplication
//
//  Created by Rasmus Nilsson on 2021-03-10.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
        
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var intrestLabel: UILabel!
    @IBOutlet weak var intrestBtnProperty: UIButton!
    @IBOutlet weak var addToFavBtnProperty: UIButton!
    @IBOutlet weak var onDemandBtnProperty: UIButton!
    
    var course: Courses!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var currentUser : User?
    var statusString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidAppear(true)
        setupDetails()
        currentUser = DataManager.sharedInstance.currentUser
        checkIntrests()
        
        
        
    }
    func deleteData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Course")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do { try context.execute(deleteRequest) } catch {}
    }
    
    func setupDetails() {
        self.infoLabel.text = course.infoOfCourse
        self.lengthLabel.text = ("Längd på kurs: \(course.lengthOfCourse) veckor")
        self.nameLabel.text = course.nameOfCourse
    }

    @IBAction func addFavouriteBtn(_ sender: UIButton) {
        addToFavBtnProperty.isEnabled = false
        addToFavBtnProperty.setTitle("Tillagd i Mina Kurser", for: .normal)
        addToFavBtnProperty.backgroundColor = UIColor.gray
        
        let newFavourite = Courses(context: self.context)
        newFavourite.nameOfCourse = course.nameOfCourse
        newFavourite.infoOfCourse = course.infoOfCourse
        newFavourite.lengthOfCourse = course.lengthOfCourse
        newFavourite.statusOfCourse = statusString
        
        currentUser?.addToFavouritelist(newFavourite)
        
        if context.hasChanges {
        do {
            try self.context.save()
        } catch {} }
    }
    
    func checkIntrests() {
        if course.counter >= 8 {
            intrestLabel.text = "Denna kurs finns tillgänglig för klassrums undervisning"
            intrestBtnProperty.isEnabled = false
            intrestBtnProperty.isHidden = true
            intrestBtnProperty.backgroundColor = UIColor.gray
            print("Nu finns det intresse för klassrums undervisning.")

        }
    }
    @IBAction func onDemandBtn(_ sender: UIButton) {
        onDemandBtnProperty.isEnabled = false
        onDemandBtnProperty.setTitle(courseStatusEnum.Köpt.rawValue, for: .normal)
        onDemandBtnProperty.backgroundColor = UIColor.gray
        statusString = "Köpt"
        course?.statusOfCourse = statusString
        
        print("\(context.hasChanges)")
        if context.hasChanges {
        do {
            try self.context.save()
        } catch {} }
        
    }
    
    @IBAction func intrestBtn(_ sender: UIButton) {
        intrestBtnProperty.isEnabled = false
        course.counter+=1
        print("\(course.counter)")
        intrestBtnProperty.backgroundColor = UIColor.gray
        intrestLabel.text = "Tack för ditt intresse!"
        print("\(context.hasChanges)")
        if context.hasChanges {
        do {
            try self.context.save()
        } catch {} }
        
    }
    
}
