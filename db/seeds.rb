# Batch.destroy_all

# Batch.create!(name: "batch1", start_date: Date.today)


batches = Batch.all #.where(start_date < Date.today - 6.weeks)
batches.each do |batch|
  user_id_couples = batch.users.map(&:id).shuffle.each_slice(2).to_a
  user_id_couples.each do |user_id_couple|
    pair = Pair.create(date: Date.today)
    PairUser.create(pair: pair, user_id: user_id_couple.first )
    PairUser.create(pair: pair, user_id: user_id_couple.second )
  end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?