require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    #ユーザーAを作成しておく
    let(:user_a) {FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')}
    let(:user_b) {FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com')}

    before do
      #作成者がユーザーであるタスクを作成しておく
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end

    context 'ユーザーAがログインしているとき' do
      # before do
      #   #ユーザーがログインする
      #   # visit login_path
      #   # fill_in 'メールアドレス', with: 'a@example.com'
      #   # fill_in 'パスワード', with: 'password'
      #   # click_button 'ログインする'
      # end
      let(:login_user) {user_a}

      it 'ユーザーAが作成したタスクが表示される' do
        # 作成済みのタスクの名称が画面上に表示されていることを確認
        expect(page).to have_content '最初のタスク'
      end
    end

    context 'ユーザーBがログインしているとき' do
      # before do
      #   # ユーザーBを作成しておく
      #   FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com')
      #   # ユーザーBでログインをする
      #   visit login_path
      #   fill_in 'メールアドレス', with: 'b@example.com'
      #   fill_in 'パスワード', with: 'password'
      #   click_button 'ログインする'
      # end
      let(:login_user) {user_b}


      it 'ユーザーAが作成したタスクが表示されない' do
        # ユーザーAが作成したタスクの名称が画面上に表示されていないことを確認
        expect(page).to have_no_content '最初のタスク'
      end
    end
  end
end
