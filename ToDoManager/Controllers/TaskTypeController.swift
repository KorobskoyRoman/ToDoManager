//
//  TaskTypeController.swift
//  ToDoManager
//
//  Created by Roman Korobskoy on 12.12.2021.
//

import UIKit

class TaskTypeController: UITableViewController {
    
    typealias TypeCellDescription = (type: TaskPriority, title: String, description: String)
    
    private var taskTypesInformation: [TypeCellDescription] = [
        (type: .important,
         title: "Важная",
         description: "Такой тип задач является наиболее приоритетным для выполнения. Все важные задачи выводятся в самом верху списка задач"),
        (type: .normal,
         title: "Текущая",
         description: "Задача с обычным приоритетом")
    ]

    var selectedType: TaskPriority = .normal
    var doAfterTypeSelected: ((TaskPriority) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellTypeNib = UINib(nibName: "TaskTypeCell", bundle: nil) //соответствие xib файлу
        tableView.register(cellTypeNib, forCellReuseIdentifier: "TaskTypeCell") //регистрируем кастомную ячейку
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskTypesInformation.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTypeCell", for: indexPath) as! TaskTypeCell
        let typeDescription = taskTypesInformation[indexPath.row]
        
        cell.typeTitle.text = typeDescription.title
        cell.typeDescription.text = typeDescription.description
        
        if selectedType == typeDescription.type {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedType = taskTypesInformation[indexPath.row].type
        doAfterTypeSelected?(selectedType)
        navigationController?.popViewController(animated: true)
    }
}
