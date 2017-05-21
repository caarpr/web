module ApplicationHelper

  def format_phone_number(number)
    return unless number.present?

    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end
end
