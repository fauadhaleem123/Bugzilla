class BugPolicy < ApplicationPolicy
    def new?
        @user.role == "QA" && @record.project.users.include?(@user)
    end

    def edit?
        @id = @record.project_id
        @project = Project.find(@id)
        @user.role == "QA" && @project.users.include?(@user)
    end

    def destroy?
        @id = @record.project_id
        @project = Project.find(@id)
        @user.role == "QA" && @project.users.include?(@user)
    end
end
