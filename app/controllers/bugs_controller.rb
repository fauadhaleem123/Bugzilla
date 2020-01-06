class BugsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_project
    before_action :find_bug, except: [:new, :create]

    def new
        @bug = @project.bugs.new
        authorize @bug
    end

    def create
        @bug = @project.bugs.new(bug_params)
        authorize @bug
        @bug.qa_id = current_user.id

        if @bug.save
            redirect_to @project
        else
            render 'new'
        end  
    end
 
    def show
        authorize @bug
    end

    def edit
        authorize @bug
    end

    def update
        authorize @bug

        if @bug.update(bug_params)
            redirect_to project_path(@project)
        else
            render 'edit'
        end
    end

    def destroy
        authorize @bug
        @bug.destroy

        redirect_to project_path(@project)
    end
 
    def assign_bug
        authorize @bug
        @user = User.find(params[:user_id])
        @bug.developer_id = @user.id
        @bug.status = "Started"

        if @bug.save
            redirect_to project_path(@project)
        end
    end

    def mark_resolved
        authorize @bug
        if @bug.bug_type == "Feature"
            @bug.status = "Completed"
        else
            @bug.status = "Resolved"
        end

        if @bug.save
            redirect_to project_path(@project)
        else
            redirect_to projects_path
        end

    end

    private
        def bug_params
            params.require(:bug).permit(:title, :deadline, :image, :bug_type, :status)
        end

        def find_project
            @project = Project.find(params[:project_id])
        end

        def find_bug
            @bug = @project.bugs.find(params[:bug_id])
        end
end
