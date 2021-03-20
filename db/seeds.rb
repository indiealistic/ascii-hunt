User.destroy_all
u1 = User.create :email => 'jonesy@idc.studio', :username => 'jonesy', :password => 'chicken'
u2 = User.create :email => 'craigsy@idc.studio', :username => 'craigsy', :password => 'chicken', :admin => true
u3 = User.create :email => 'gocsy@idc.studio', :username => 'gocsy', :password => 'chicken', :admin => true
puts "#{ User.count } users added."

Beet.destroy_all
b1 = Beet.create :content => AsciiGen.new("https://news.artnet.com/app/news-upload/2018/02/jean-michel-basquiat-cabeza-from-portfolio-ii-prints-and-multiples-zoom_550_759.jpg").to_ascii_art(width: 70), :image => 'https://news.artnet.com/app/news-upload/2018/02/jean-michel-basquiat-cabeza-from-portfolio-ii-prints-and-multiples-zoom_550_759.jpg'
b2 = Beet.create :content => AsciiGen.new("https://1.bp.blogspot.com/_2CnQWIZQ3NY/R0piYJTcVNI/AAAAAAAAAUg/MaF7YXX5xhk/s320/aph.jpg").to_ascii_art(width: 70), :image => 'https://1.bp.blogspot.com/_2CnQWIZQ3NY/R0piYJTcVNI/AAAAAAAAAUg/MaF7YXX5xhk/s320/aph.jpg'
b3 = Beet.create :content => AsciiGen.new("https://ae01.alicdn.com/kf/HTB1u70laZrrK1Rjy1zeq6xalFXas.jpg").to_ascii_art(width: 70), :image => 'https://ae01.alicdn.com/kf/HTB1u70laZrrK1Rjy1zeq6xalFXas.jpg'
b4 = Beet.create :content => AsciiGen.new("https://i1.wp.com/www.templatescatalog.com/wp-content/uploads/2020/08/Chocolate-donut-on-black-background.jpg").to_ascii_art(width: 70), :image => 'https://i1.wp.com/www.templatescatalog.com/wp-content/uploads/2020/08/Chocolate-donut-on-black-background.jpg'
puts "#{ Beet.count } beets added."

Comment.destroy_all
c1 = Comment.create :content => 'I love this!'
c2 = Comment.create :content => 'I uploaded a similar one though yours is much better 😂'
c3 = Comment.create :content => 'Amazing! You have to upload more!'
c4 = Comment.create :content => 'I copied this in an email to my Mum and she thought I was special (finally) so thank you!'
puts "#{ Comment.count } comments added."

Like.destroy_all
l1 = Like.create :status => true
l2 = Like.create :status => true
l3 = Like.create :status => true
l4 = Like.create :status => true
l5 = Like.create :status => true
l6 = Like.create :status => true
puts "#{ Like.count } likes added."

# ASSOCIATIONS #################################################################

puts "Users and Beets (posts)"
u1.beets << b1
u3.beets << b2 << b3 << b4

puts "Users and Likes"
u1.likes << l1 << l2 << l3
u2.likes << l4 << l5
u3.likes << l6

puts "Users and Comments"
u1.comments << c1
u2.comments << c2 << c3
u3.comments << c4

puts "Beets and Likes"
b1.likes << l1
b2.likes << l2
b3.likes << l3
b4.likes << l4

puts "Beets and Comments"
b1.comments << c1
b2.comments << c2
b3.comments << c3 << c4
