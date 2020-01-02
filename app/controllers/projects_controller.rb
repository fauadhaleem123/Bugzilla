class ProjectsController < ApplicationController
    before_action :authenticate_user!

    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
        authorize @project
    end
    def new
        @project = current_user.projects.build
        authorize @project
    end

    def edit
        @project = Project.find(params[:id])
        authorize @project
    end

    def create
        @project = current_user.projects.build(project_params)
        if @project.save
           @project.users << current_user
            redirect_to @project
        else
            render "new"
        end
    end

    def update
        @project = Project.find(params[:id])
        authorize @project
        if @project.update(project_params)
            redirect_to @project
        else
            render "edit"
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy

        redirect_to projects_path
    end

    def users
        @users = User.all
        @project = Project.find(params[:id])
    end

    def assign_user
        @project = Project.find(params[:id])
        @user = User.find(params[:user_id])
        @project.users << @user
        authorize @project

        redirect_to project_path(@project)
    end

    def remove_user
        @project = Project.find(params[:project_id])
        authorize @project
        @user = User.find(params[:user_id])
        if @user.role == "Developer"
            assigned_projects(@user, @project)
        end
        @project.users.delete(@user)

        redirect_to project_path(@project)
    end

    private
        def project_params
            params.require(:project).permit(:title, :description, :code)
        end

        def assigned_projects(user, project)
            @bugs = project.bugs.all
            project.bugs.each do |bug|
                if bug.user_id == user.id
                    puts "$$$$$"
                    bug.user_id = nil
                    bug.save
                    if bug.status == "Started"
                        bug.status = "New"
                        bug.save
                    end
                end
            end

        end
end
 