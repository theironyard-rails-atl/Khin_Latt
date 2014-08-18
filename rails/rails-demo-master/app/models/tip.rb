class Tip < ActiveRecord::Base
  validates :content, length: { in: 6..255 }

  def angry_content
    "#{content.upcase}!!!"
  end
end
