FactoryBot.define do
  factory :customer, aliases: [:user] do
    transient do
      upcased { false }
      qtt_orders { 3 }
    end

    name { Faker::Name.name }
    sequence(:email) { |n| "meu_email-#{n}@email.com" }
    # email { Faker::Internet.email }
    # gender { ["M", "F"].sample }

    address { Faker::Address.street_address }

    trait :male do
      gender { "M" }
    end

    trait :female do
      gender { "F" }
    end

    # factory :zoro do
    #   name { "Zoro" }
    #   email { "zoro@one.com" }
    # end

    # factory :customer_vip do
    #   vip { true }
    #   days_to_pay { 30 }
    # end

    # factory :customer_default do
    #   vip { false }
    #   days_to_pay { 15 }
    # end

    trait :one do
      name { "Zoro" }
      email { "zoro@one.com" }
    end

    trait :vip do
      vip { true }
      days_to_pay { 30 }
    end

    trait :default do
      vip { false }
      days_to_pay { 15 }
    end

    trait :with_orders do
      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.qtt_orders, customer: customer)
      end
    end

    factory :zoro, traits: [:one, :male]
    factory :customer_female, traits: [:female]
    factory :customer_male, traits: [:male]
    factory :customer_vip, traits: [:vip]
    factory :customer_default, traits: [:default]
    factory :customer_female_vip, traits: [:vip, :female]
    factory :customer_male_vip, traits: [:vip, :male]
    factory :customer_female_default, traits: [:default, :female]

    after(:create) do |costumer, evaluator|
      costumer.name.upcase! if evaluator.upcased
    end
  end
end
