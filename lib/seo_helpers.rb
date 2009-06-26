module SeoHelpers
  module TitleHelper
    # This method should be used in your layout and your actions.
    # 
    # In your action:
    #   <%= title "Edit user #{@user.name}" %>
    # => <h1>Edit user Jan De Poorter</h1>
    #
    # In your layout:
    #   <head>
    #     <title><%= title :site_name => 'Foobar' %></title>
    #     ...
    # => <title>Edit user Jan De Poorter - Foobar</title>
    # 
    def title arguments, options = {}
      case arguments
      when String
        @title = arguments
        options[:class] = [options[:class], 'error'].compact.join(' ') if options[:error]
        return content_tag(:h1, [options[:header], @title, options[:trailer]].compact.join(' '), options.except(:error, :header, :trailer))
      when Hash
        sitename = arguments[:site_name]
        if @title
          return %(<title>#{strip_tags(@title)} - #{sitename}</title>)
        else
          return %(<title>#{sitename}</title>)
        end
      end
    end
  end

  module MetaHelper
    def meta name, content
      %(<meta name="#{name}" content="#{content}" />)
    end

    def display_meta options = {:robots => 'all', :language => 'english'}
      s = ""
      s += meta('description', options[:description]) unless options[:description].nil?
      s += meta('keywords', options[:keywords]) unless options[:keywords].nil?
      s += meta('robots', options[:robots])
      s += meta('SKYPE_TOOLBAR', 'SKYPE_TOOLBAR_PARSER_COMPATIBLE') if options[:skype] == true
      s += meta('language', options[:language])
      return s
    end

    def favicon location = '/favicon.ico'
      %(<link rel='shortcut icon' href='#{location}' type='image/x-icon' />)
    end

    def metatype options = {:type => 'text/html', :format => 'utf-8'}
      %(<meta http-equiv='content-type' content='#{options[:type]};charset=#{options[:format]}' />)
    end

    def display_keywords options = {}
      if options[:keys].nil?
        keys = "linux csharp socialnetworks css facebook blog ruby rubyonrails 
          php5 ajaxian learning javascript python development tsql geek jquery 
          hosting ubuntu scalable cloudcomputing agilemethods"
      else
        keys = options[:keys]
      end
      keys = %w(keys).join(',')

      titles = []
      tags = []
      cats = []

      # if @articles
      #   @articles.each { |article| titles.push(article.title) }
      #   @articles.each { |article| tags.push(article.cached_tag_list) }
      # 
      #   if !@article.blank?
      #     [titles.join(','),
      #     tags.join(','),
      #     @article.updated_at.to_s(:month_year)].join(',')
      #   else
      #     [titles.join(','),
      #     tags.join(',')]
      #   end
      # 
      # elsif @article and !@article.new_record?
      #   @article.categories.each { |category| cats.push(category.title) }
      # 
      #   if !@article.updated_at.blank?
      #     [@article.title,
      #     @article.cached_tag_list,
      #     cats.join(','),
      #     @article.updated_at.to_s(:month_year)].join(',')
      #   else
      #     ['',
      #     '']
      #   end
      # 
      # else
      # end
      return meta('keywords', keys)
    end
    
  end
end
