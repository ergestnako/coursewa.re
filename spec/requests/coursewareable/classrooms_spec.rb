require 'spec_helper'

describe 'Classrooms' do
  let(:classroom) { Fabricate('coursewareable/classroom') }

  it 'it should redirect if not logged in' do
    visit dashboard_classroom_url(:subdomain => classroom.slug)
    page.should have_css('#login')
  end

  it 'it should show dashboard if logged in' do
    sign_in_with(classroom.owner.email)
    visit dashboard_classroom_url(:subdomain => classroom.slug)
    page.should have_content(classroom.title)
    page.should have_css('#dashboard-classrooms')
    page.should_not have_css('#activities .classroom-create')
  end

end