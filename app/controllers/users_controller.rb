class UsersController < ApplicationController
    before_action :set_s3_direct_post, only: [:painel]
    before_action :require_admin, only: [:permission]
    def new
        @user = User.new
    end
    def permission
        if request.get?
            @users = User.all
        else
            a = User.find_by_email(users_params['email'])
            a.role = users_params['role']
            if a.save
                flash[:success] = "Permissões de usuário alteradas!"
                redirect_to '/users/permission'
            else
                flash[:success] = "Falhou!"
                render :permission
            end
        end
    end
    def create
        @user = User.new(users_params)
        @user.active = true
        @user.approved = true
        @user.confirmed = true
        @user.role = "member"
        if @user.save
            flash[:success] = "Cadastro efetuado!"
            redirect_to root_path
        else
            render :new
        end
    end
    
    def painel #painel form
    end
    
    def update
        @user = current_user
        @user.bio = users_params['bio']
        @user.photo = users_params['photo']
        @user.name = users_params['name']
        if @user.save
            flash[:success] = "Informações salvas!"
            redirect_to '/painel'
        end
        
    end

  private
    def users_params
        params.require(:user).permit(:email, :password, :password_confirmation, :password_news, :role, :bio, :photo, :name, :portrait_cache)
    end
end
