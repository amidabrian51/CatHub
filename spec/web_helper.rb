def sign_in
  visit('/')
  click_link('Sign in')
  fill_in('Email', with: 'test@example.com')
  fill_in('user_password', with: 'testtest')
  click_button('Sign in')
end

def sign_up(email = 'test@example.com')
  visit('/')
  click_link('Sign up')
  fill_in('Petname', with: 'fido')
  fill_in('Email', with: email)
  fill_in('user_password', with: 'testtest')
  fill_in('Password Confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_out
  visit('/')
  click_link('Sign out')
end

def add_post(text)
  visit '/posts'
  click_link 'Create a post'
  fill_in 'post_text', with: text
  click_button 'Create post'
end

def visit_post(text)
  visit '/posts'
  click_link text
end

def edit_post(text)
  click_link 'Edit'
  fill_in 'post_text', with: text
  click_button 'Edit post'
end
