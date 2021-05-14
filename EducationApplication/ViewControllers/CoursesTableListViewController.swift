//
//  CoursesTableListViewController.swift
//  EducationApplication
//
//  Created by Rasmus Nilsson on 2021-03-10.
//

import UIKit
import CoreData

class CoursesTableListTableViewController: UITableViewController {
    
    var twoDimArray:[[Courses]] = [[]]
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var courses : [Courses] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        courses = getCourses()
        print("\(courses.count)")
        if courses.count > 0 { print("Det finns kurser!") }
           else {
                print("Creating courses")
                createCoreData()
                courses = getCourses()
        }
        
        twoDimArray = sortCourses(courses: courses)
            
    }
    
    func deleteData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Courses")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do { try context.execute(deleteRequest) } catch {}
        
        let fetchRequest1: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "User")
        let deleteRequest1 = NSBatchDeleteRequest(fetchRequest: fetchRequest1)
            do { try context.execute(deleteRequest1) } catch {}
    }
    
    func sortCourses(courses: [Courses]) -> [[Courses]] {
        var twoDimArray:[[Courses]] = [[]]
        var webbutveckling: [Courses] = []
        var progMobil: [Courses] = []
        var backend: [Courses] = []
        var databas: [Courses] = []
        
        for course in courses {
            switch course.category {
                case "Webbutveckling":
                    webbutveckling.append(course)
                case "Programmering för mobila enheter":
                    progMobil.append(course)
                case "Backend programmering":
                    backend.append(course)
                case "Databaser":
                    databas.append(course)
                default:
                    print("Category not found")
            }
            
        }
        twoDimArray.append(webbutveckling)
        twoDimArray.append(progMobil)
        twoDimArray.append(databas)
        twoDimArray.append(backend)

        return twoDimArray
    }
    func createCoreData() {
        insertData(name: "HTML och CSS", info: "Lär dig html", length: 5, category: "Webbutveckling")
        insertData(name: "Avancerad CSS", info: "Lär dig CSS", length: 4,category: "Webbutveckling")
        insertData(name: "Javascript för nybörjare", info: "Lär dig JS", length: 3, category: "Webbutveckling")
        insertData(name: "Avancerad JavaScript och serverprogrammering", info: "Bli expert på JS", length: 4, category: "Webbutveckling")
        insertData(name: "JavaScript för webben", info: "Lär dig JS för webb", length: 5, category: "Webbutveckling")
        insertData(name: "ASP.NET Core MVC", info: "Lär dig ASP.NET", length: 3,category: "Webbutveckling")
        insertData(name: "Introduktion till Androidutveckling", info: "Lär dig androidutveckling", length: 3, category: "Programmering för mobila enheter")
        insertData(name: "Avancerad Android programmering", info: "Lär dig avancerad Androidutveckling", length: 3, category: "Programmering för mobila enheter")
        insertData(name: "iOS utveckling med Objective-C", info: "Lär dig Objective-C", length: 3, category: "Programmering för mobila enheter")
        insertData(name: "iOS utveckling med Swift", info: "Börja din iOS utveckling med swift", length: 6, category: "Programmering för mobila enheter")
        insertData(name: "Design och layout för mobila enheter", info: "Lär dig design för mobila enheter", length: 5, category: "Programmering för mobila enheter")
        insertData(name: "REST Api med node.js", info: "Lär dig rest API..", length: 5, category: "Backend programmering")
        insertData(name: "Administrera MS SQL Server", info: "Lär dig sql..", length: 3, category: "Backend programmering")
        insertData(name: "Databas Design", info: "Lär dig designa en databas", length: 2, category: "Databaser")
        insertData(name: "Web Api med .NET Core", info: "Lär dig Web API med .NET core", length: 4, category: "Databaser")
        insertData(name: "Bygga system med MongoDB", info: "Lär dig MongoDB", length: 7, category: "Databaser")
        insertData(name: "Vad är ORM? Hur använder man ett sådant verktyg.", info: "Hur är det egentligen?", length: 6, category: "Databaser")
        
    }
    func insertData(name: String, info: String, length: Int16, category: String) {
        let course = Courses(context: context)
        course.nameOfCourse = name
        course.infoOfCourse = info
        course.lengthOfCourse = length
        course.statusOfCourse = ""
        course.counter = 0
        course.category = category

        if context.hasChanges {
        do {
            try self.context.save()
        } catch {} }
        
    }
    
    func getCourses() -> [Courses] {
        var courseArray: [Courses] = []
        courseArray = try! context.fetch(Courses.fetchRequest()) as! [Courses]
        
        return courseArray
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twoDimArray[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)

        cell.textLabel?.text = "\(twoDimArray[indexPath.section][indexPath.row].nameOfCourse!)"
        cell.detailTextLabel?.text = "Längd på denna kurs: \(twoDimArray[indexPath.section][indexPath.row].lengthOfCourse) veckor"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionLabel: String = ""
        switch section {
        case 1:
            sectionLabel = "Webbutveckling"
        case 2:
            sectionLabel = "Programmering för mobila enheter"
        case 3:
            sectionLabel = "Backend programmering"
        case 4:
            sectionLabel = "Databaser"
        default:
             return nil
        }
        return sectionLabel
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let course = twoDimArray[indexPath.section][indexPath.row]
        self.performSegue(withIdentifier: "showDetailsOfCourse", sender: course)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetailsOfCourse" {
            guard let vc = segue.destination as? DetailViewController else { return }
            guard let course = sender as? (Courses) else { return }
            vc.course = course

        }
    }
}

