every 1.day, :at => '10:30 am' do
  runner "NoticeMailer.purchases_summary().deliver"
end