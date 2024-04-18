// Classe para a tela de adição de tarefas
class AddTaskViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    let taskManager = TaskManager()
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let title = titleTextField.text, !title.isEmpty else {
            return
        }
        taskManager.addTask(title: title, description: descriptionTextField.text)
        navigationController?.popViewController(animated: true)
    }
}
