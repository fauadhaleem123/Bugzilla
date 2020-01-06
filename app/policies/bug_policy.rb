class BugPolicy < ApplicationPolicy
    def new?
        @user.type == "Qa" && @record.project.qas.include?(@user)
    end

    def create?
        @user.type == "Qa" && @record.project.qas.include?(@user)
    end

    def show?
        @record.project.qas.include?(@user) || @record.project.developers.include?(@user) || @record.project.manager_id == @user.id
    end

    def edit?
        @user.type == "Qa" && @record.project.qas.include?(@user) && @record.qa_id == @user.id
    end

    def update?
        @user.type == "Qa" && @record.project.qas.include?(@user) && @record.qa_id == @user.id
    end

    def destroy?
        @user.type == "Qa" && @record.project.qas.include?(@user) && @record.qa_id == @user.id
    end

    def assign_bug?
        @user.type == "Developer" && @record.project.developers.include?(@user) && @record.developer_id.nil? && @record.status == 'New'
    end

    def mark_resolved?
        @user.type == "Developer" && @record.project.developers.include?(@user) && @record.developer_id == @user.id && @record.status == 'Started'
    end
end
 