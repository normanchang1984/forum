class Admin::ForumsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
    layout "admin"

    def index
      @forums = Forum.all
    end




    protected

    def authenticate
       authenticate_or_request_with_http_basic do |user_name, password|
           user_name == "nsc.chang@gmail.com" && password == "12345678"
       end
    end

    def check_admin
      unless current_user.role=="admin"
        raise ActiveRecord::RecordNotFound
      end
    end
end
