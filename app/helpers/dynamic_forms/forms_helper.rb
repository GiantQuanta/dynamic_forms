module DynamicForms
  module FormsHelper

    def form_item_classes(form_item)
      [].tap do |classes|
        classes << "new" if form_item.new_record?
        classes << "question" if form_item.question?
      end.join(' ')
    end

    def form_partial_path(question)
      parts = question.to_partial_path.split('/')
      parts[-1] = 'form'
      parts.join('/')
    end

    def item_types_for_select
      DynamicForms.item_types.values.map {|item_def| [item_def.name, item_def.type] }
    end

  end
end
