module DynamicForms
  module FormsHelper

    def form_item_classes(form_item)
      [].tap do |classes|
        classes << "new" if form_item.new_record?
        classes << "question" if form_item.question?
      end.join(' ')
    end

    def form_partial_path(question)
      partial_path(question, 'form')
    end

    def response_partial_path(question)
      partial_path(question)
    end

    def item_types_for_select
      DynamicForms.item_types.values.map {|item_def| [item_def.name, item_def.type] }
    end

    def multiple_choice_appearances_for_select
      MultipleChoiceQuestion::APPEARANCES
    end

    private

    def partial_path(object, partial_name)
      parts = object.to_partial_path.split('/')
      parts[-1] = partial_name
      parts.join('/')
    end

  end
end
