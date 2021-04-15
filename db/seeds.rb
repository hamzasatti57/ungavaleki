if User.first.blank?
  User.create(first_name: 'Admin', last_name: '', email: 'admin@ungavaleki.com', password: 'admin123', role: 'super_admin')
end
