if User.first.blank?
  User.create(first_name: 'Admin', last_name: '', email: 'admin@ungavaleki.com', password: 'admin123', role: 'super_admin')
end

if Account.first.blank?
  Account.create(amount: 20000, revenue: 10000, why_not: 8500, nonsense: 3420, operation: 5420, plug: 2530, time_stamp: 1546)
end
