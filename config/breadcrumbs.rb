crumb :root do
  link "スケジュール帳", root_path
end

crumb :event_show do |event_show|
  link "イベント詳細", event_path(event_show)
  parent :root
end

crumb :event_edit do |event_edit|
  link "イベント編集", edit_event_path(event_edit)
  parent :event_show, event_edit
end

crumb :event_new do |event_new|
  link "イベント追加", new_event_path
  parent :root
end

crumb :group_new do |group_new|
  link "グループ作成", new_group_path
  parent :root
end

crumb :user_edit do |user_edit|
  link "ユーザー編集", edit_user_path(user_edit)
  parent :root
end

crumb :group_index do |group_index|
  link "グループ一覧", groups_path
  parent :root
end

crumb :group_show do |group_show|
  link "グループ詳細", group_path(group_show)
  parent :group_index, group_show
end

crumb :group_edit do |group_edit|
  link "グループ編集", edit_group_path(group_edit)
  parent :group_show, group_edit
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