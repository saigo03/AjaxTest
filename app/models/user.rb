class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  has_many :folders
  has_many :memos, through: :folders

  has_many :user_missions
  has_many :missions, through: :user_missions

  # 新規登録時にデフォルトランクを設定
  before_create :set_default_rank

  def check_mission
    #nilの場合は0にする
    self.points ||= 0

    # 初めてのメモ作成時にポイントを追加
    if self.memos.count == 1
      mission_one_points = Mission.find_by(id: 3).points_value
      self.points += mission_one_points
    end

    # メモ作成回数が100回に達した時にポイントを追加
    if self.memos.count == 3
      mission_two_points = Mission.find_by(id: 4).points_value
      self.points += mission_two_points
    end

    # ポイントの変更があった場合のみ保存
    self.save if self.points_changed?
  end

  private
  
  def set_default_rank
    self.rank = '一般人' unless self.rank
  end


end
