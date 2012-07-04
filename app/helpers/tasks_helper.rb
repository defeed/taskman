module TasksHelper
  def assigned_person
    if @task.user
    	"Assigned person: #{@task.user.name}"
    else
    	"No assigned person"
    end 
  end
end
