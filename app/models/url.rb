class Url < ApplicationRecord
  validates_presence_of :description
  validates_presence_of :long_url
  validates_format_of :long_url, :with => /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix

  belongs_to :user

  before_create :generate_short_url

  def generate_short_url
    while
      @short = rand(36**8).to_s(36)
      break if not Url.exists?(short_url: @short)
    end
    self.short_url=@short
  end
end
