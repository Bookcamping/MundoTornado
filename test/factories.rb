# encoding: utf-8
require 'factory_girl'

FactoryGirl.define do

  factory :user do
    sequence(:name) {|n| "User#{n}"}
    email { "#{name}@email.com" }
    password { "#{name}-secret"}
    password_confirmation { password }
    admin false
  end

  factory :group do
    sequence(:name) {|n| "Group#{n}" }
    subdomain  { name.parameterize }
    description { "#{name} description" }
    user
  end

  factory :content do
    sequence(:title) {|n| "Content #{n}" }
    user
    group
  end
  factory :page, parent: :content do
    sequence(:title) {|n| "Page #{n}" }
    user
    group
  end
  factory :character do
    sequence(:title) {|n| "Character #{n}" }
    user
    group
  end
  factory :pedia do
    sequence(:title) {|n| "Pedia #{n}" }
    user
    group
  end

  factory :seed do
    user
    group
    sequence(:body) {|n| "Seed #{n}" }
  end


  factory :chapter do
    sequence(:title) {|n| "Chapter #{n}"}
    summary { "#{title} summary" }
    user
    group
  end

  factory :scene do
    chapter
    group { chapter.group }
    user
    sequence(:content) {|n| "Scene #{n}" }
    content_type { 'markdown' }
  end
end
