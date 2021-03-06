module MedicineInformationHelper
  def build_information_section(name, div_id, text)
    content_tag(:section) do
      content_tag(:h3, name) +
        content_tag(:div, id: div_id) do
          content_tag(:p, default_text(text), class: 'multiline-ellipsis ellipsis-paragraph') +
            content_tag(:a, 'Read More', class: 'read-more ellipsis-controller', style: 'display: none;') +
            content_tag(:a, 'Read Less', class: 'read-less ellipsis-controller', style: 'display: none;')
        end
    end
  end

  def default_text(text)
    text ? text : 'No information was found for this section on this medicine.'
  end

  def highlight_interactions(interaction_text, medicine)
    return 'No interaction label data is present' if interaction_text.blank?
    text = interaction_text.gsub(/#{medicine.name}/i).with_index { |m| content_tag(:span, m, class: 'neon highlight scroll-to') }
    text.html_safe
  end
end
