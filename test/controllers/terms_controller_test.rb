# frozen_string_literal: true

require 'test_helper'

class TermsControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get terms_and_conditions_url
    assert_response :success
  end
end
