//
//  FavouriteTableViewController.swift
//  EducationApplication
//
//  Created by Rasmus Nilsson on 2021-03-10.
//

import UIKit
import CoreData

class FavouriteTableViewController: UITableViewController {

    @IBOutlet weak var customNavigationItem: UINavigationItem!
    var courseArray = [Courses]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupEditButton()
        user = DataManager.sharedInstance.currentUser
        loadUserCoreData()
        
        

    }
    override func viewDidAppear(_ animated: Bool) {
        loadUserCoreData()
    }
    func setupEditButton() {
        customNavigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
    }
    
    @objc func editTapped() {
        tableView.setEditing(!tableView.isEditing, animated: true)
        
        if tableView.isEditing {
            customNavigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editTapped))
        }else {
            customNavigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        }
    }
    func loadUserCoreData() {
        if let userFavourites = user?.favouritelist?.allObjects as? [Courses] {
            courseArray = userFavourites
            tableView.reloadData()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.courseArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)

        let course = self.courseArray[indexPath.row]
        cell.textLabel?.text = course.nameOfCourse
        cell.detailTextLabel?.text = course.statusOfCourse

        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            UISwipeActionsConfiguration(actions: [deleteCourseAction(forRowAt: indexPath)])
        }
    
    func deleteCourseAction(forRowAt indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Radera") {
            (contextualAction, swipeButton, completionHandler: (Bool) -> Void) in
            
            self.user?.removeFromFavouritelist(self.courseArray[indexPath.row])
            
            do {
                try self.context.save()
            } catch{}

            self.loadUserCoreData()
        }
            return action
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailOfMyCourseSegue", sender: courseArray[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "detailOfMyCourseSegue" {
            guard let vc = segue.destination as? DetailOfMyCourseViewController else { return }
            guard let courseArray = sender as? (Courses) else { return }
            vc.course = courseArray
            vc.delegate = self
            print(courseArray.nameOfCourse!)
        }
    }
}
extension FavouriteTableViewController : CoursesDelegate {
    func save(courses: CoursesModel) {

        let kurs = Courses(context: context)
        kurs.infoOfCourse = courses.infoOfCourse
        kurs.nameOfCourse = courses.nameOfCourse
        kurs.lengthOfCourse = Int16(courses.lengthOfCourse)
        kurs.statusOfCourse = courses.statusOfCourse.rawValue
        
        do {
            try self.context.save()
        } catch{}
        self.tableView.reloadData()
    }
}

