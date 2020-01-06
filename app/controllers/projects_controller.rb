class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_project, except: [:index, :new, :create, :remove_user]

    def index
        get_projects
    end

    def show
        authorize @project
    end
    def new
        @project = current_user.projects.build
        authorize @project
    end

    def edit
        authorize @project
    end
 
    def create
        @project = current_user.projects.build(project_params)
        redirect_to @project
        if @project.save
           @project.manager_id = current_user.id
        else
            render "new"
        end
    end
   
    def update
        authorize @project
        if @project.update(project_params)
            redirect_to @project
        else
            render "edit"
        end
    end

    def destroy
        authorize @project

        @project.destroy

        redirect_to projects_path
    end

    def users
        get_users(@project)
    end
  
    def assign_user
        @user = User.find(params[:user_id])
        authorize @project
        if @user.type == "Developer"
            @project.developers << @user
        else @user.type == "Qa"
            @project.qas << @user
        end

        redirect_to project_path(@project)
    end

    def remove_user
        @project = Project.find(params[:project_id])
        @user = User.find(params[:user_id])
        authorize @project
        if @user.type == "Developer"
            assigned_projects(@user, @project)
        end
        if @user.type == "Developer"
            @project.developers.delete(@user)
        else @user.type == "Qa"
            @project.qas.delete(@user)
        end
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
                    bug.user_id = nil
                    bug.save
                    if bug.status == "Started"
                        bug.status = "New"
                        bug.save
                    end
                end
            end
        end

        def find_project
            @project = Project.find(params[:id])
        end

        def get_projects
            @allprojects = Project.all
            @projects = @allprojects.select do |project|
                project.manager_id == current_user.id || project.qas.include?(current_user) || project.developers.include?(current_user)
            end
            @projects
        end

        def get_users(project)
            @allusers = User.all
            @users = @allusers.select do |user|
                user.type != "Manager" && user != current_user && ! ( project.qas.include?(user) || project.developers.include?(user) )
            end
            @users
        end
end
   