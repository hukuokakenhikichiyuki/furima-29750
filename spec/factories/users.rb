FactoryBot.define do
  factory :user do
    nickname              { 'ああああ' }
    email                 { 'yu@gamil' }
    password              { 'aa0000' }
    password_confirmation { 'aa0000' }
    family_name           { '引地' }
    first_name            { '雄生' }
    family_name_kana      { 'ヒキチ' }
    first_name_kana       { 'ユウキ' }
    birthday              { '1920-01-01' }
  end
end
