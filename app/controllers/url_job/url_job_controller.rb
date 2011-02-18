module UrlJob
  class UrlJobController < ApplicationController
    before_filter :set_token

    def perform
      method_parameters = {:token      => @token,
                           :user_agent => request.env['HTTP_USER_AGENT'],
                           :referrer   => request.referrer,
                           :ip_address => request.env['REMOTE_ADDR']
      }

      delegator = UrlJob::Job.find_by_token(@token)

      if delegator.nil? || delegator.limit_reached?
        render_not_found
        return
      end


      ac = delegator.payload_object.try(:perform, method_parameters)

      if ac.respond_to?(:redirect_to) and ac.redirect_to
        redirect_to ac.redirect_to
        return
      elsif ac.respond_to?(:render) and ac.render
        render :text => ac.render
        return
      end

      render_not_found
    end


    protected
    def set_token
      @token = params[:token]
      render_not_found if !@token
    end

    def render_not_found
      render :text => '404 Not Found', :status => :not_found
    end
  end
end