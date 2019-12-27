class BugsController < ApplicationController
    def new
        @project = Project.find(params[:project_id])
    end

    def create
        @project = Project.find(params[:project_id])
        @bug = @project.bugs.create(bug_params)
        redirect_to project_path(@project)
    end

    private
        def bug_params
            params.require(:bug).permit(:title,:deadline,:image,:type)
        end
end
