require 'seo_helpers'

ActionView::Base.send(:include, SeoHelpers::TitleHelper)
ActionView::Base.send(:include, SeoHelpers::MetaHelper)