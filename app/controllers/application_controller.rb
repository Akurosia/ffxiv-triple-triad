class ApplicationController < ActionController::Base
  before_action :set_locale

  SUPPORTED_LOCALES = %w(en de fr ja).freeze

  def new_session_path(scope)
    new_user_session_path
  end

  def flash_errors(record)
    if record.errors.any?
      flash.now[:error] = record.errors.messages.values.flatten.join('<br>').html_safe
    else
      flash.now[:error] = 'Sorry, something went wrong.'
    end
  end

  private
  def set_locale
    locale = cookies['locale']

    unless locale.present?
      locale = request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first&.downcase

      unless locale.present? && SUPPORTED_LOCALES.include?(locale)
        locale = I18n.default_locale
      end

      cookies['locale'] = locale
    end

    I18n.locale = cookies['locale']
  end
end
