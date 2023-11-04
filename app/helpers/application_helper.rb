module ApplicationHelper
    def flash_message(type, text)
        flash[type] ||= []
        flash[type] << text
    end

    def render_flash
        rendered = []
        flash.each do |type, messages|
          messages.each do |m|
            rendered << render(:partial => 'partials/flash', :locals => {:type => type, :message => m}) unless m.blank?
          end
        end
        rendered.join
    end

    def flash_errors(variable)
        if variable.errors.any?
            variable.errors.full_messages.each do |error|
                flash_message :danger, error
            end
        end
    end
end
