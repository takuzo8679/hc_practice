# frozen_string_literal: true

# ChangeName
module ChangeName
  def change_name(new_name)
    return puts '不適切な名前です' if new_name == '不適切'

    @name = new_name
  end
end
