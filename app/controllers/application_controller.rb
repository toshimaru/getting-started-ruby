# Copyright 2015, Google, Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class ApplicationController < ActionController::Base

  # [START logged_in]
  helper_method :logged_in?

  def logged_in?
    current_user.present?
  end
  # [END logged_in]

  # [START current_user]
  helper_method :current_user

  def current_user
    Marshal.load session[:user] if session.has_key?(:user)
  end
  # [END current_user]

  # [START logout]
  def logout!
    session.delete :user
  end
  # [END logout]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
