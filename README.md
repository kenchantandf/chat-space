# <u> 1. Userモデル </u>

### Association
  - has_many :messages
  - has_and_belongs_to_many :groups


  ###  Columns
    - name :string, null: false
    - email :string, null: false, unique: true
    - password :string, null: false
    - has_and_belongs_to_many :user
    - has_many :messages


  ### Columns
    - name :string, null: false
    - user :string, null: false
    - user :references
    - created_at
    - updated_at

***


# <u> 2. GroupsUsersモデル </u>
######(Groups_Usersモデル)

  ### Columns
    - user :references
    - group :references

***

# <u> 3. Messageモデル </u>

### Association
  - belongs_to :user
  - belongs_to :group


  ### Columns
    - body :text, null: false
    - image :string, null: false
    - user :references
    - group :references
    - created_at
    - updated_at
