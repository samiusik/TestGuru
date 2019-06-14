# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)одит или когда-либ


Answer.create([{ title: 'Correct' }, {title: 'Uncorrect'}])
Category.create(
  [
    { title: 'HTML' },
    { title: 'Ruby' },
    { title: 'SEO'}
  ]
)
Question.create(
  [
    { title: 'your questions', level: '1' },
    { title: 'What is WP?', level: '0' },
    { title: 'What is Ruby?', level: '2' }
  ]
)
Test.create(
  [
    { title: 'Ruby', level: '2', category_id: Category.where(title: "Ruby").first.id },
    { title: 'HTML', level: '1', category_id: Category.where(title: "HTML").first.id },
    { title: 'SEO', level: '0', category_id: Category.where(title: "SEO").first.id }
  ]
)
User.create(
  { title: 'Alexandr' }
)