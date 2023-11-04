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

          flash_message :success, "Connexion reussie"
          redirect_back(fallback_location: root_path)
      
        else
          flash_message :danger, "Identifiants incorrects"
          render 'new'
        end
      end
      def destroy
        session.delete(:user_id)
        flash_message :success, "Deconnexion reussie"
        redirect_back(fallback_location: root_path)
      end
end
