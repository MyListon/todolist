// Classe de controle para gerenciar a lista de tarefas
class TaskManager {
    var tasks: [Task] = []
    
    // Método para adicionar uma nova tarefa à lista
    func addTask(title: String, description: String?) {
        let newTask = Task(title: title, description: description, isCompleted: false)
        tasks.append(newTask)
        saveTasks()
    }
    
    // Método para atualizar o estado de conclusão de uma tarefa
    func toggleTaskCompletion(at index: Int) {
        tasks[index].isCompleted.toggle()
        saveTasks()
    }
    
    // Método para excluir uma tarefa da lista
    func deleteTask(at index: Int) {
        tasks.remove(at: index)
        saveTasks()
    }
    
    // Método para salvar a lista de tarefas localmente
    func saveTasks() {
        // Implemente a lógica para salvar as tarefas usando UserDefaults ou CoreData
    }
    
    // Método para carregar a lista de tarefas salva
    func loadTasks() {
        // Implemente a lógica para carregar as tarefas salvas usando UserDefaults ou CoreData
    }
}
