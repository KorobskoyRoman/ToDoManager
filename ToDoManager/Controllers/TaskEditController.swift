//
//  TaskEditController.swift
//  ToDoManager
//
//  Created by Roman Korobskoy on 12.12.2021.
//

import UIKit

class TaskEditController: UITableViewController {
    
    var taskText: String = ""
    var taskType: TaskPriority = .normal
    var taskStatus: TaskStatus = .planned
    var doAfterEdit: ((String, TaskPriority, TaskStatus) -> Void)? //для захвата элемента и последующиего изменения
    private var taskTitles: [TaskPriority: String] = [.important: "Важная", .normal: "Текущая"]
    
    @IBOutlet var taskTitle: UITextField!
    @IBOutlet var taskTypeLabel: UILabel!
    @IBOutlet var taskStatusSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTitle?.text = taskText
        taskTypeLabel?.text = taskTitles[taskType]
        
        if taskStatus == .completed {
            taskStatusSwitch.isOn = true
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toTaskTypeScreen" {
            let destination = segue.destination as! TaskTypeController
            destination.selectedType = taskType
            destination.doAfterTypeSelected = { [unowned self] selectedType in
                taskType = selectedType
                taskTypeLabel?.text = taskTitles[taskType]
            }
        }
    }
    
    @IBAction func saveTask(_ sender: UIBarButtonItem) {
        
        var title = taskTitle?.text ?? ""
        let type = taskType
        let status: TaskStatus = taskStatusSwitch.isOn ? .completed : .planned
        
        if title.isEmpty {
            showAlert(title: "Ошибка!", message: "Не заполнено название!")
//        } else if title.trimmingCharacters(in: .whitespacesAndNewlines) = false {
//            showAlert(title: "Ошибка!", message: "Удалите лишние пробелы")
        } else {
            title = title.trimmingCharacters(in: .whitespacesAndNewlines)
            doAfterEdit?(title, type, status)
            navigationController?.popViewController(animated: true)
        }
        
    }
}
