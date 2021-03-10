//
//  CoursesTableListViewController.swift
//  EducationApplication
//
//  Created by Rasmus Nilsson on 2021-03-10.
//

import UIKit

class CoursesTableListTableViewController: UITableViewController {
    
    var twoDimArray = [
        [CoursesModel(nameOfCourse: "HTML och CSS", infoOfCourse: "Lär dig HTML", lengthOfCourse: 4),
        CoursesModel(nameOfCourse: "Avancerad CSS", infoOfCourse: "Bli bättre på CSS", lengthOfCourse: 5),
        CoursesModel(nameOfCourse: "Javascript för nybörjade", infoOfCourse: "Lär dig grunderna i JS", lengthOfCourse: 3),
        CoursesModel(nameOfCourse: "Avancerad JavaScript och serverprogrammering", infoOfCourse: "Bli expert på JS", lengthOfCourse: 5),
        CoursesModel(nameOfCourse: "JavaScript för webben", infoOfCourse: "Lär dig JS för webben", lengthOfCourse: 4),
        CoursesModel(nameOfCourse: "ASP.NET Core MVC", infoOfCourse: "Lär dig ASP.NET", lengthOfCourse: 6)],
        [CoursesModel(nameOfCourse: "Introduktion till Androidutveckling", infoOfCourse: "Lär dig androidutveckling..", lengthOfCourse: 4),
        CoursesModel(nameOfCourse: "Avancerad Android programmering", infoOfCourse: "Lär dig avancerad Androidutveckling", lengthOfCourse: 6),
        CoursesModel(nameOfCourse: "iOS utveckling med Objective-C", infoOfCourse: "Lär dig Objective-C", lengthOfCourse: 3),
        CoursesModel(nameOfCourse: "iOS utveckling med Swift", infoOfCourse: "Börja din iOS utveckling med swift", lengthOfCourse: 5),
        CoursesModel(nameOfCourse: "Design och layout för mobila enheter", infoOfCourse: "Lär dig design för mobila enheter", lengthOfCourse: 3)],
        [CoursesModel(nameOfCourse: "REST Api med node.js", infoOfCourse: "Lär dig rest API..", lengthOfCourse: 4),
        CoursesModel(nameOfCourse: "Web Api med .NET Core", infoOfCourse: "Lär dig Web API med .NET core", lengthOfCourse: 4)],
        [CoursesModel(nameOfCourse: "Administrera MS SQL Server", infoOfCourse: "Lär dig sql..", lengthOfCourse: 5),
        CoursesModel(nameOfCourse: "Databas Design", infoOfCourse: "Lär dig designa en databas", lengthOfCourse: 4)]
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
  
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return twoDimArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return twoDimArray[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)

        cell.textLabel?.text = "\(twoDimArray[indexPath.section][indexPath.row].nameOfCourse)"
        cell.detailTextLabel?.text = "Length of this course: \(twoDimArray[indexPath.section][indexPath.row].lengthOfCourse) weeks"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let categoryArray = ["Webbutveckling","Programmering för mobila enheter","Backend programmering","Databaser"]
        return "\(categoryArray[section].uppercased())"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let course = twoDimArray[indexPath.section][indexPath.row]
        self.performSegue(withIdentifier: "showDetailsOfCourse", sender: course)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetailsOfCourse" {
            guard let vc = segue.destination as? DetailViewController else { return }
            guard let course = sender as? (CoursesModel) else { return }
            vc.course = course

        }
    }

}
