//
//  DetailOfMyCourseViewController.swift
//  EducationApplication
//
//  Created by Rasmus Nilsson on 2021-03-17.
//

import UIKit
import CoreData

class DetailOfMyCourseViewController: UIViewController {
    weak var delegate: CoursesDelegate?
    @IBOutlet weak var nameOfCourseLabel: UILabel!
    @IBOutlet weak var infoOfCourseLabel: UILabel!
    @IBOutlet weak var lengthOfCourseLabel: UILabel!
    @IBOutlet weak var startCourseBtnOutlet: UIButton!
    @IBOutlet weak var completeBtnOutlet: UIButton!
    
    var course: Courses?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetails()
        checkStatus()
        
        hideButton()
        print("Inloggad som:\(String(describing: DataManager.sharedInstance.currentUser?.username!))")
    }
    func checkStatus() {
        if course?.statusOfCourse == "Påbörjad" {
            startCourseBtnOutlet.isEnabled = false
            startCourseBtnOutlet.setTitle("Påbörjad", for: .normal)
        }
    }
    
    func setupDetails() {
        self.infoOfCourseLabel.text = course?.infoOfCourse
        self.lengthOfCourseLabel.text = ("Längd på kurs: \(course!.lengthOfCourse) veckor")
        self.nameOfCourseLabel.text = course?.nameOfCourse
    }
    
    func hideButton() {
        if startCourseBtnOutlet.isEnabled == true {
            completeBtnOutlet.isHidden = true
        } else { completeBtnOutlet.isHidden = false
            }
    }
    
    @IBAction func startCourseBtn(_ sender: UIButton) {
        
        startCourseBtnOutlet.setTitle(courseStatusEnum.Påbörjad.rawValue, for: .normal)
        startCourseBtnOutlet.isEnabled = false
        course?.statusOfCourse = "Påbörjad"
        
        if context.hasChanges {
        do {
            try self.context.save()
        } catch {} }
    }
    
    @IBAction func completedCourseBtn(_ sender: UIButton) {
        completeBtnOutlet.setTitle(courseStatusEnum.Genomförd.rawValue, for: .normal)
        completeBtnOutlet.isEnabled = false
        course?.statusOfCourse = "Genomförd"
        
        if context.hasChanges {
        do {
            try self.context.save()
        } catch {} }
    }
}

