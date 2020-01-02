class BugsController < ApplicationController
    def new
        @project = Project.find(params[:project_id])
        @bug = @project.bugs.new
        authorize @bug
    end

    def create
        @project = Project.find(params[:project_id])
        @bug = @project.bugs.create(bug_params)

        if @bug.save
            redirect_to @project
        else
            render 'new'
        end  
    end

    def show
        @project = Project.find(params[:project_id])
        puts params
        @bug = @project.bugs.find(params[:bug_id])
    end

    def edit
        @project = Project.find(params[:project_id])
        @bug = @project.bugs.find(params[:bug_id])
    end

    def update
        @project = Project.find(params[:project_id])
        @bug = @project.bugs.find(params[:bug_id])
        if @bug.update(bug_params)
            redirect_to project_path(@project)
        else
            render 'edit'
        end
    end

    def destroy
        @project = Project.find(params[:project_id])
        @bug = @project.bugs.find(params[:bug_id])
        authorize @bug
        @bug.destroy

        redirect_to project_path(@project)
    end

    def assign_bug
        @project = Project.find(params[:project_id])
        @bug = @project.bugs.find(params[:bug_id])
        @user = User.find(params[:user_id])
        @bug.user_id = @user.id
        @bug.status = "Started"

        if @bug.save
            redirect_to project_path(@project)
        end
    end

    def mark_resolved
        @project = Project.find(params[:project_id])
        @bug = @project.bugs.find(params[:bug_id])
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
end
