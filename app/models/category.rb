class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '雑誌' },
    { id: 2, name: '小説' },
    { id: 3, name: 'ビジネス・経済' },
    { id: 4, name: 'コンピュータ・IT' },
    { id: 5, name: '建築・アート' },
    { id: 6, name: '趣味' },
    { id: 7, name: '金融' },
    { id: 8, name: 'アート' },
    { id: 9, name: 'スポーツ・アウトドア' },
    { id: 10, name: '医学' },
    { id: 11, name: '語学' },
    { id: 12, name: 'コミック' },
    { id: 13, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :books
  
end