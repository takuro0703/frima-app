crumb :root do
  link "トップページ", root_path
end

crumb :log_in do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :sign_up do
  link "新規登録", new_user_registration_path
  parent :root
end

crumb :confirmation do
  link "個人情報登録", confirmation_path
  parent :address
end

crumb :address do
  link "住所登録情報", address_path
  parent :sign_up
end

crumb :mypage do
  link "マイページ", informations_path
  parent :root
end

crumb :new_card do
  link "支払い方法", new_card_path
  parent :mypage
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).