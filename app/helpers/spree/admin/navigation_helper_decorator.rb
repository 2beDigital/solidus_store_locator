Spree::Admin::NavigationHelper.module_eval do
  # helper method to create proper url to apply per page filtering
  # fixes https://github.com/spree/spree/issues/6888
  def per_page_dropdown_params(args = nil)
    args ||= params.clone
    args.delete(:page)
    args.delete(:per_page)
    args
  end

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

  # the per_page_dropdown is used on index pages like orders, products, promotions etc.
  # this method generates the select_tag
  def per_page_dropdown
    # there is a config setting for admin_products_per_page, only for the orders page
    if @products && per_page_default = Spree::Config.admin_products_per_page
      per_page_options = []
      5.times do |amount|
        per_page_options << (amount + 1) * Spree::Config.admin_products_per_page
      end
    else
      per_page_default = 15
      per_page_options = %w{5 15 30 45 60}
    end

    select_tag(:per_page,
    options_for_select(per_page_options, params['per_page'] || per_page_default),
    { class: "form-control pull-right js-per-page-select" })
  end
end
