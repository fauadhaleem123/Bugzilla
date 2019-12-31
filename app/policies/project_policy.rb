class ProjectPolicy < ApplicationPolicy
    def create?
        @user.role == "Manager"
    end

    def show?
        @record.users.include?(@user)
    end

    def edit?
        @user.role == "Manager" && @record.users.include(@user)
    end

    def assign_user?
        @user.role == "Manager" && @record.users.include(@user)
    end

    def remove_user?
        @user.role == "Manager" && @record.users.include(@user)
    end  
end    