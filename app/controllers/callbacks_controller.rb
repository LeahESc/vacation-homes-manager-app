class CallbacksController < Devise::OmniauthCallbacksController

    # def github
    #     # binding.pry
    #     @user = User.from_omniauth(request.env['omniauth.auth'])
    #     sign_in_and_redirect @user
    # end 

    def github
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user
            flash[:notice] = "Congratulations, you're signed up!"
        else
            flash[:error] = 'There was a problem.'
            redirect_to new_user_registration_path
        end
    end

    def google_oauth2
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user
            flash[:notice] = "Congratulations, you're signed up!"
        else
            flash[:error] = 'There was a problem.'
            redirect_to new_user_registration_path
        end
    end
    def failure
        flash[:error] = 'There was a problem'
        redirect_to new_user_registration_path        
    end


end