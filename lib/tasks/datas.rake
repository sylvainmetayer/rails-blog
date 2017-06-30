namespace :datas do
  desc 'TODO'
  task create_post: :environment do
    p = Post.new
    p.title = rand(36**8).to_s(36)
    p.publish_date= time_rand
    p.content = rand(36**8).to_s(36)
    p.resume=rand(36**8).to_s(36)
    p.save
  end

  desc 'https://stackoverflow.com/a/4899857'
  def time_rand(from = 0.0, to = Time.now)
    Time.at(from + rand * (to.to_f - from.to_f))
  end

end
