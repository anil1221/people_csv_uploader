require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should post csv file and return records' do
    file = fixture_file_upload('files/people.csv', 'application/csv')
    post upload_csv_path, params: { person: { csv_file: file } }, headers: { content_type: 'application/csv' },
                          xhr: true
    assert_response :success
  end

  test 'should post person record and return record' do
    post create_path, params: { person: { first_name: 'Anil', last_name: 'Kumar', email: 'anil@gmail.com',
                                          phone: '9909909909' } }, xhr: true
    assert_response :success
  end

end
