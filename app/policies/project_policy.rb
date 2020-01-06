class ProjectPolicy < ApplicationPolicy
     
    def new?
        @user.type == "Manager"
    end
    
    def create?
        @user.type == "Manager"
    end

    def show?
        @record.manager_id == @user.id || @record.developers.include?(@user) || @record.qas.include?(@user)
    end

    def edit?
        @user.type == "Manager" && record.manager_id == @user.id
    end

    def update?
        @user.type == "Manager"
    end

    def destroy?
        @user.type == "Manager" && @record.manager_id == @user.id
    end

    def assign_user?
        @user.type == "Manager" && @record.manager_id == @user.id
    end

    def remove_user?
        @user.type == "Manager" && @record.manager_id == @user.id
    end  
end    