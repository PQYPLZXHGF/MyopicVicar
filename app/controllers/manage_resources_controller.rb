class ManageResourcesController < ApplicationController
  require "county"
  require 'userid_role'
  #skip_before_filter :require_login, only: [:index,:new, :pages]


  def create
    @user = UseridDetail.where(:userid => params[:manage_resource][:userid] ).first
    session[:userid] = @user.userid
    session[:first_name] = @user.person_forename
    session[:manager] = manager?(@user)
    redirect_to manage_resource_path(@user)
  end

  def index
    redirect_to :new
  end

  def load(userid_id)
    @first_name = session[:first_name]
    @user = UseridDetail.find(userid_id)
  end

  def logout
    reset_session
    redirect_to refinery.logout_path
  end

  def new

    if !is_ok_to_render_actions?
      stop_processing and return
    else
      if user_is_computer?
        go_to_computer_code
        return
      else
        clean_session
        clean_session_for_syndicate
        clean_session_for_county
        if @page = Refinery::Page.where(:slug => 'information-for-members').exists?
          @page = Refinery::Page.where(:slug => 'information-for-members').first.parts.first.body.html_safe
        else
          @page = ""
        end
        @manage_resources = ManageResource.new
        render 'actions'
        return
      end
    end
  end

  def pages
    current_authentication_devise_user = Refinery::Authentication::Devise::User.where(:id => session[:devise]).first
    redirect_to '/cms/refinery/pages'
  end

  def selection
    if UseridRole::OPTIONS_TRANSLATION.has_key?(params[:option])
      value = UseridRole::OPTIONS_TRANSLATION[params[:option]]
      redirect_to value
      return
    else
      flash[:notice] = 'Invalid option'
      redirect_to :back
      return
    end
  end


  def show
    load(params[:id])
  end

  private

  def go_to_computer_code
    redirect_to new_transreg_user_path
    return
  end

  def is_ok_to_render_actions?
    continue = true
    if session[:userid_detail_id].present?
      @user = UseridDetail.id(session[:userid_detail_id]).first
      if @user.blank?
        logger.warn "FREEREG::USER userid not found #{session[:userid_detail_id]}"
        flash[:notice] = "Your userid was not found in the system (if you believe this to be a mistake please contact your coordinator)"
        continue = false
      end
    else
      continue = false
      logger.warn "FREEREG::USER No session "
    end
    case
    when @user.blank?
      continue = false
    when  !@user.active
      flash[:notice] = "You are not active, if you believe this to be a mistake please contact your coordinator"
      continue = false
    when @user.person_role == "researcher"  || @user.person_role == 'pending'
      flash[:notice] = "You are not currently permitted to access the system as your functions are still under development"
      continue = false
    when !Rails.application.config.member_open  && !(@user.person_role == "system_administrator"  || @user.person_role == 'technical')
      #we set the mongo_config.yml member open flag. true is open. false is closed We do allow technical people in
      flash[:notice] = "The system is presently undergoing maintenance and is unavailable"
      continue = false
    end
    set_session if continue
    continue
  end


  def set_session
    @user_id = @user._id
    @userid = @user.userid
    @first_name = @user.person_forename
    @manager = manager?(@user)
    @roles = UseridRole::OPTIONS.fetch(@user.person_role)
    session[:userid] = @userid
    session[:user_id] = @user_id
    session[:first_name] = @first_name
    session[:manager] = manager?(@user)
    session[:role] = @user.person_role
    logger.warn "FREEREG::USER user #{@user.userid}"
    logger.warn "FREEREG::USER  manager #{@manager}"
  end

  def stop_processing
    redirect_to refinery.logout_path and return
  end

  def user_is_computer?
    @user.person_role == "computer" ? result = true : result = false
    result
  end


end
