require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'is not valid without a title' do 
    blog = Blog.create(content: 'place hold content')
    expect(blog.errors[:title]).to_not be_empty 
  end
  it 'is not valid without a content' do 
    blog = Blog.create(title: 'blog1')
    expect(blog.errors[:content]).to_not be_empty 
  end
  it 'is not valid if title is less than 4 characters' do 
    blog = Blog.create(title: 'bl', content: 'place hold content')
    expect(blog.errors[:title]).to_not be_empty 
  end
  it 'is not valid if content is less than 10 characters' do 
    blog = Blog.create(title: 'blog1', content: 'place')
    expect(blog.errors[:content]).to_not be_empty 
  end
  it 'does not allow duplicate title' do 
    Blog.create(title: 'blog1', content: 'place hold content')
    blog = Blog.create(title: 'blog1', content: 'place hold content')
    expect(blog.errors[:title]).to_not be_empty 
  end
end
