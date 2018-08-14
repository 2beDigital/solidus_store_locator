Spree::Admin::NavigationHelper.module_eval do
  def button_link_to(text, url, html_options = {})
    if (html_options[:method] &&
      html_options[:method].to_s.downcase != 'get' &&
      !html_options[:remote])
      form_tag(url, method: html_options.delete(:method), class: 'display-inline') do
        button(text, html_options.delete(:icon), nil, html_options)
      end
    else
      if html_options['data-update'].nil? && html_options[:remote]
        object_name, action = url.split('/')[-2..-1]
        html_options['data-update'] = [action, object_name.singularize].join('_')
      end

      html_options.delete('data-update') unless html_options['data-update']

      html_options[:class]  = html_options[:class] ? "btn #{html_options[:class]}" : "btn btn-default"

      if html_options[:icon]
        icon = content_tag(:span, '', class: "icon icon-#{html_options[:icon]}")
        text.insert(0, icon + ' ')
      end

      link_to(text.html_safe, url, html_options)
    end
  end
end
