module ApplicationHelper
  ##############################################################################
  # Get Application name (used by page_title)
  #   Alternatives:
  #       Rails.application.class.to_s.split("::").first
  #       Rails.application.config.session_options[:key].sub(/^_/,'').sub(/_session/,'')
  #       Rails.application.engine_name.gsub(/_application/,'')
  #
  # 15.12.2013  Created
  # 16.10.2020  'module_parent_name' to be used since Rails 6.1
  # 27.10.2020  asset image files renamed
  # 23.06.2021  'language_switch_bootstrap' updated for Bootstrap 5 
  # 12.02.2022  object locales corrected
  ##############################################################################
 
  def app_name
    Rails.application.class.module_parent_name
  end
  
  ##############################################################################
  #  Handles flash type and sets a note class
  #
  #  14.01.2017 Created
  ##############################################################################
  def bootstrap_class_for(flash_type)
    case flash_type
    when "success"
      "alert-success"   # Green
    when "error"
      "alert-danger"    # Red
    when "alert"
      "alert-warning"   # Yellow
    when "notice"
      "alert-info"      # Blue
    else
      flash_type.to_s
    end
  end

  ##############################################################################
  # Handles Error messages with Bootstrap 3 styles
  # Source: http://stackoverflow.com/questions/15155890/styling-form-error-message-bootstrap-rails
  #
  # 18.07.2015  Created
  # 12.02.2022  object locales corrected
  ##############################################################################
  def errors_for(object)
    if object.errors.any?
      content_tag(:div, :class => "panel panel-danger") do
        concat(content_tag(:div, :class => "panel-heading") do
          concat(content_tag(:h4, :class => "panel-title") do
            concat "#{t('entity.object')} '#{t(object.class.name.underscore)}' #{t('entity.not_saved')}"
            # concat "Объект '#{t(object.class.name.underscore)}' не может быть сохранен из-за ошибок:"
          end)
        end)
        concat(content_tag(:div, :class => "panel-body") do
          concat(content_tag(:ul) do
            object.errors.full_messages.each do |msg|
                concat content_tag(:li, msg)
            end
          end)
        end)
      end
    end
  end

  ##############################################################################
  # HTML element to switch language among available ones
  #
  # Source:  http://dhampik.ru/blog/rails-routes-tricks-with-s
  #
  # 17.11.2013  The `alternative version` in the source is used
  # 09.01.2017  Fixing error: Attempting to generate a URL from non-sanitized request parameters!
  #             Solution: use *permit!* method:  params.merge(locale: loc).permit!
  ##############################################################################
  def language_switch
    content_tag(:ul, id: 'switch') do
      I18n.available_locales.each do |loc|
        locale_param = request.path == root_path ? root_path(locale: loc) : params.merge(locale: loc).permit!
        concat content_tag(:li, (link_to I18n.t(:language, locale: loc), locale_param), class: (I18n.locale == loc ? "active" : ""))
      end
    end
  end

  ##############################################################################
  # *language_switch* method updated for Bootstrap 4
  #
  # 08.12.2015  Created
  # 12.09.2016  updated for Admin (argument 'mode' added)
  # 09.01.2017  Fixing error: Attempting to generate a URL from non-sanitized request parameters!
  #             Solution: use *permit!* method:  params.merge(locale: loc).permit!
  ##############################################################################
  def language_switch_bootstrap4 mode
    content_tag(:ul, class: 'dropdown-menu', id: 'switch') do
      I18n.available_locales.each do |loc|
        if mode == 'admin'
          locale_param = request.path == admin_root_path ? admin_root_path(locale: loc) : params.merge(locale: loc).permit!
        else
          locale_param = request.path == root_path ? root_path(locale: loc) : params.merge(locale: loc).permit!
        end
        concat content_tag(:li, (link_to I18n.t(:language, locale: loc), locale_param), class: (I18n.locale == loc ? "active" : ""))
      end
    end
  end

  ##############################################################################
  # *language_switch* method updated for Bootstrap 5
  #
  # 08.12.2015  Created
  # 12.09.2016  updated for Admin (argument 'mode' added)
  # 09.01.2017  Fixing error: Attempting to generate a URL from non-sanitized request parameters!
  #             Solution: use *permit!* method:  params.merge(locale: loc).permit!
  # 23.06.2021  Updated for Bootstrap 5
  ##############################################################################
  def language_switch_bootstrap mode
    content_tag(:div, "aria-labelledby" => "navbarDropdown", class: "dropdown-menu") do
      I18n.available_locales.each do |loc|
        if mode == 'admin'
          locale_param = request.path == admin_root_path ? admin_root_path(locale: loc) : params.merge(locale: loc).permit!
        else
          locale_param = request.path == root_path ? root_path(locale: loc) : params.merge(locale: loc).permit!
        end
        concat(content_tag(:div, class: "dropdown-item") do
          concat content_tag(:div, (link_to I18n.t(:language, locale: loc), locale_param), class: (I18n. == loc ? "active" : ""))
        end)
      end
    end
  end

  ##############################################################################
  # Return a title on a per-page basis with localization
  # Source:  Michael Hartl
  #
  # 15.12.2013  Created
  # 19.12.2013  Approach modified
  # 28.12.2013  Updated
  ##############################################################################
  def page_title
    if controller_name == 'pages'
      title = t "#{action_name}_page"
      "#{app_name} | #{title}"                                # e.g.: 'Ror4 | Home'
    else
      if @page_title.nil?
        "#{app_name} | #{t controller_name}-#{t action_name}" # e.g.: 'Ror4 | groups-index'
      else
        "#{app_name} | #{t @page_title}"                      # e.g.: 'Ror4 | Show group Manager'
      end
    end
  end

  # Sorts array of objects by the Attribute (if passed)
  def sort_objects objects_array, attribute=nil
    if attribute.nil?
      objects_array
    else
      objects_array.sort! { |a,b| eval("a.#{attribute} <=> b.#{attribute}") }
    end
  end

  ##############################################################################
  # Selects a status mark to be displayed
  #
  # 25.01.2016  Obsoleted (glyphicons to be used)
  # 25.04.2022  Modified (pure text is used)
  ##############################################################################
  def status_mark status
    if status == 'active' || status == true
      # image_tag('admin/check_mark.png', size: '12x15', alt: 'Active')
      content_tag(:font, status, color: 'green')
    else
      # image_tag('admin/minus_mark.png', size: '12x15', alt: 'Archived')
      content_tag(:font, status, color: 'red')
    end
  end
end
