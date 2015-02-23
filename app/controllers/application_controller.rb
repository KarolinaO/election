class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
  helper_method :current_user, :current_user_session

  private

  def current_user_session
    return @current_user if defined?(@current_user_sesssion)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def current_client
    return @current_client if defined?(@current_user)
    @current_client = User.find(@current_user.id).client_id
  end


  def authenticate
    if !current_user
      redirect_to new_user_session_path
    end
  end
  def index
    # Load the html to convert to PDF
    html = File.read("#{Rails.root}views/statistics/index.html.erb")
    # Create a new kit and define page size to be US letter
    kit = PDFKit.new(html, :page_size => 'Letter')
    # Load our stylesheet into the kit to have colors & formatting
    kit.stylesheets << "#{Rails.root}views/statistics/index.html.erb"
    # Save the html to a PDF file
    kit.to_file("#{Rails.root}/app/raport.pdf")
    # Render the html
    render :text => html
  end
':lkjh'

  #before_filter :require_login

 # private

 # def require_login
    #unless current_user
    #  redirect_to login_url
   # end
 # end
end
