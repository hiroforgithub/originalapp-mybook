class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'Magazine' },
    { id: 2, name: 'Novel' },
    { id: 3, name: 'Business' },
    { id: 4, name: 'Technology' },
    { id: 5, name: 'Art' },
    { id: 6, name: 'Hobby' },
    { id: 7, name: 'Finance' },
    { id: 8, name: 'Sports' },
    { id: 9, name: 'Medical' },
    { id: 10, name: 'Language' },
    { id: 11, name: 'Comic' },
    { id: 12, name: 'etc.' }
  ]

  include ActiveHash::Associations
  has_many :books
  
end