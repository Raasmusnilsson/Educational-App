//
//  DetailViewController.swift
//  EducationApplication
//
//  Created by Rasmus Nilsson on 2021-03-10.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    var course: CoursesModel!
    var courseIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetails()
    }

    func setupDetails() {
        self.infoLabel.text = course.infoOfCourse
        self.lengthLabel.text = ("Längd på kurs: \(course.lengthOfCourse) veckor")
        self.nameLabel.text = course.nameOfCourse
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
