module ProjectsHelper



  # completed projects status = 0
  # on going projects status = 1


def get_status(project)
    if project.status== true
      return "on going"
    elsif project.status == false
      return "completed"
    else
      return "completed!"
    end
  end


end
