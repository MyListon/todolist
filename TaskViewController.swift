// Classe para a tela principal da lista de tarefas
class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    let taskManager = TaskManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskManager.loadTasks()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // Implementação dos métodos do protocolo UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        let task = taskManager.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        cell.detailTextLabel?.text = task.description
        cell.accessoryType = task.isCompleted ? .checkmark : .none
        return cell
    }
    
    // Implementação dos métodos do protocolo UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        taskManager.toggleTaskCompletion(at: indexPath.row)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    // Método para excluir uma tarefa quando o usuário deslizar a célula para a esquerda
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            taskManager.deleteTask(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}