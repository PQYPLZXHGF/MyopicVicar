# Copyright 2012 Trustees of FreeBMD
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class ApplicationController < ActionController::Base

  protect_from_forgery
  before_filter :require_login

  require 'record_type'
  require 'name_role'
  require 'chapman_code'
  require 'userid_role'
  require 'register_type'
  def clean_session
    session.delete(:freereg1_csv_file_id) 
    session.delete(:freereg1_csv_file_name) 
    session.delete(:county) 
    session.delete(:place_name) 
    session.delete(:church_name) 
    session.delete(:sort) 
    session.delete(:csvfile) 
    session.delete(:my_own)
    session.delete(:role) 
    session.delete(:freereg) 
    session.delete(:edit) 

  end

  private

   def check_for_mobile
    session[:mobile_override] = true if mobile_device?
  end

  
  def mobile_device?
   # Season this regexp to taste. I prefer to treat iPad as non-mobile.
   request.user_agent =~ /Mobile|webOS/ && request.user_agent !~ /iPad/
  end

  helper_method :mobile_device?


  def require_login
    if session[:userid].nil?
      flash[:error] = "You must be logged in to access this section"
      redirect_to refinery.login_path # halts request cycle
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    @user = current_refinery_user.userid_detail
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    home_path = "#{scope}_root_path"
    respond_to?(home_path, true) ? refinery.send(home_path) : main_app.new_manage_resource_path
  end
  def  get_user_info_from_userid
    if current_refinery_user.nil?
      redirect_to refinery.login_path
      return
    else
      @user = current_refinery_user.userid_detail
      @userid = @user._id
      @first_name = @user.person_forename
      @manager = manager?(@user)
      @roles = UseridRole::OPTIONS.fetch(@user.person_role)
    end
  end
  def  get_user_info(userid,name)
    #old version for compatibility
    @userid = userid
    @user = UseridDetail.where(:userid => @userid).first
    @first_name = @user.person_forename
    @roles = UseridRole::OPTIONS.fetch(@user.person_role)
  end


  def manager?(user)
    #sets the manager flag status
    a = false
    a = true if (user.person_role == 'technical' || user.person_role == 'system_administrator' || user.person_role == 'country_coordinator'  || user.person_role == 'county_coordinator'  || user.person_role == 'volunteer_coordinator' || user.person_role == 'syndicate_coordinator')
  end


end
