# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

User.create!([{
  firstname: "Sylvain",
  name: "Metayer",
  email: "sylvain@metayer.fr",
  password: "valid_password",
  password_confirmation: "valid_password"
  },
  {
    firstname: "Tiphaine",
    name: "Girardot",
    email: "tiphaine@girardot.fr",
    password: "valid_password",
    password_confirmation: "valid_password"
  }
    ])

Post.destroy_all

Post.create!([{

    title: "Ceci est un premier post",
    publish_date: "2017-05-05",
    resume: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
    user_id: User.first.id,
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dictum lectus sit amet justo tempus, at fermentum justo tristique. Duis scelerisque blandit euismod. Aenean ante lacus, tristique ut justo a, maximus viverra purus. Nulla sit amet libero pellentesque, vestibulum ipsum convallis, dapibus felis. Ut diam quam, fringilla ut imperdiet accumsan, convallis vitae velit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc interdum lectus sit amet elit posuere faucibus. Etiam auctor arcu lorem, in mattis risus elementum in. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse nunc massa, posuere id neque vitae, iaculis condimentum mi."
    },
  {
    title: "Ceci est un second post",
    publish_date: "2017-08-05",
    resume: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
    user_id: User.first.id,
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dictum lectus sit amet justo tempus, at fermentum justo tristique. Duis scelerisque blandit euismod. Aenean ante lacus, tristique ut justo a, maximus viverra purus. Nulla sit amet libero pellentesque, vestibulum ipsum convallis, dapibus felis. Ut diam quam, fringilla ut imperdiet accumsan, convallis vitae velit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc interdum lectus sit amet elit posuere faucibus. Etiam auctor arcu lorem, in mattis risus elementum in. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse nunc massa, posuere id neque vitae, iaculis condimentum mi."
  },
    {
      title: "Ceci est un troisieme post",
      publish_date: "2017-09-05",
      resume: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
      user_id: User.offset(1).first.id,
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dictum lectus sit amet justo tempus, at fermentum justo tristique. Duis scelerisque blandit euismod. Aenean ante lacus, tristique ut justo a, maximus viverra purus. Nulla sit amet libero pellentesque, vestibulum ipsum convallis, dapibus felis. Ut diam quam, fringilla ut imperdiet accumsan, convallis vitae velit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc interdum lectus sit amet elit posuere faucibus. Etiam auctor arcu lorem, in mattis risus elementum in. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse nunc massa, posuere id neque vitae, iaculis condimentum mi."

      }])
