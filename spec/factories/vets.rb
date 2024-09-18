FactoryBot.define do
  factory :vet do
    calendar { "2024-09-18" }
    vet { "MEVVC" }
    # concern { "GI STASIS" }
    next_visit { "2024-10-18" }
  end
end
