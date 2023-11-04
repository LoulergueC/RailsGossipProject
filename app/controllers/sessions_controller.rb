class SessionsController < ApplicationController
    def new
    end
    
    def create
        # cherche s'il existe un utilisateur en base avec l’e-mail
        user = User.find_by(email: params[:email][0].downcase)
      
        puts params

        # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
        if user && user.authenticate(params[:password].first)
          session[:user_id] = user.id
          # redirige où tu veux, avec un flash ou pas

          redirect_to root_path
      
        else
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        end
      end
      def destroy
        session.delete(:user_id)
        redirect_back(fallback_location: root_path)
      end
end
