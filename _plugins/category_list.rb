module Jekyll
  class CategoryList < Liquid::Tag
    safe = true

    def render(context)
      result = "<ul class='unstyled'>"
      categories = context.registers[:site].categories

      categories.keys.each do |category|
        result << %(<li><a href="/categories/#{category.slugize}">#{category}</a> (#{categories[category].length})<br /></li>)
      end

      result << "</ul>"
      result
    end
  end
end

Liquid::Template.register_tag('category_list', Jekyll::CategoryList)