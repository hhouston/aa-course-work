# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
